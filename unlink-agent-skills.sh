#!/usr/bin/env sh
# Remove the per-agent skill symlinks `npx skills add -g` creates for every agent,
# keeping ~/.agents/skills and ~/.claude/skills. DRY_RUN=1 lists without deleting.
cd "$HOME" || exit 1
removed=0
for d in .adal/skills .aider-desk/skills .astrbot/data/skills .augment/skills .autohand/skills \
  .bob/skills .codeartsdoer/skills .codebuddy/skills .codeium/windsurf/skills .codemaker/skills \
  .codestudio/skills .commandcode/skills .config/crush/skills .config/devin/skills .config/goose/skills \
  .config/kimchi/harness/skills .continue/skills .forge/skills .grok/skills .hermes/skills .iflow/skills \
  .inferencesh/skills .jazz/skills .junie/skills .kiro/skills .kode/skills .lingma/skills .mcpjam/skills \
  .minimax/skills .moxby/skills .mux/skills .neovate/skills .ona/skills .openclaw/skills .openhands/skills \
  .pochi/skills .posit/assistant/skills .qoder-cn/skills .qoder/skills .qwen/skills .reasonix/skills \
  .roo/skills .rovodev/skills .snowflake/cortex/skills .tabnine/agent/skills .terramind/skills \
  .tinycloud/skills .trae-cn/skills .trae/skills .vibe/skills .zcode/skills .zencoder/skills; do
  [ -d "$d" ] || continue
  for e in "$d"/* "$d"/.[!.]*; do
    [ -L "$e" ] || continue
    case "$(readlink "$e")" in
      *.agents/skills/*)
        removed=$((removed + 1))
        if [ -n "${DRY_RUN:-}" ]; then echo "would remove ~/$e"; else rm "$e"; fi ;;
    esac
  done
  # Drop the skills dir and any parents left empty (never above $HOME).
  [ -n "${DRY_RUN:-}" ] || rmdir -p "$d" 2>/dev/null
done
echo "${DRY_RUN:+[dry run] }removed $removed skill links"
