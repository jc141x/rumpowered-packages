#!/bin/env bash
OWNER="Frogging-Family"
REPO="wine-tkg-git"
WORKFLOW_ID=11219483

RUN_ID=`gh api \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "/repos/$OWNER/$REPO/actions/workflows/$WORKFLOW_ID/runs?status=success&per_page=1" \
  --jq '.workflow_runs[0].id'`

ARTIFACT_ID=`gh api \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "/repos/$OWNER/$REPO/actions/runs/$RUN_ID/artifacts" \
  --jq '.artifacts[0].id'`

gh api \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "/repos/$OWNER/$REPO/actions/artifacts/$ARTIFACT_ID/zip" \
  > wine-tkg.zip

unzip wine-tkg.zip
rm wine-tkg.zip
