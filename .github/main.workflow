workflow "Build, Test, and Deploy to Zeit on Push" {
  on = "push"
  resolves = ["GitHub Action for Zeit", "build"]
}

action "build" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "i"
}

action "test" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["build"]
  args = "test"
}

action "GitHub Action for Zeit" {
  uses = "actions/zeit-now@5c51b26db987d15a0133e4c760924896b4f1512f"
  needs = ["test"]
  secrets = ["ZEIT_TOKEN"]
}
