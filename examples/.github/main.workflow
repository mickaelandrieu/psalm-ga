workflow "Main" {
  on = "push"
  resolves = ["Psalm"]
}

action "Psalm" {
  uses = "docker://mickaelandrieu/psalm-ga"
  secrets = ["GITHUB_TOKEN"]
  args = "--find-dead-code --threads=8 --diff --diff-methods"
}
