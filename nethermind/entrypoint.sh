#!/bin/sh

case "$_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_HOLESKY" in
"prysm-holesky.dnp.dappnode.eth")
  echo "Using prysm-holesky.dnp.dappnode.eth"
  JWT_PATH="/security/prysm/jwtsecret.hex"
  ;;
"lighthouse-holesky.dnp.dappnode.eth")
  echo "Using lighthouse-holesky.dnp.dappnode.eth"
  JWT_PATH="/security/lighthouse/jwtsecret.hex"
  ;;
"teku-holesky.dnp.dappnode.eth")
  echo "Using teku-holesky.dnp.dappnode.eth"
  JWT_PATH="/security/teku/jwtsecret.hex"
  ;;
"nimbus-holesky.dnp.dappnode.eth")
  echo "Using nimbus-holesky.dnp.dappnode.eth"
  JWT_PATH="/security/nimbus/jwtsecret.hex"
  ;;
"lodestar-holesky.dnp.dappnode.eth")
  echo "Using lodestar-holesky.dnp.eth"
  JWT_PATH="/security/lodestar/jwtsecret.hex"
  ;;
*)
  echo "Using default"
  JWT_PATH="/security/default/jwtsecret.hex"
  ;;
esac

# Print the jwt to the dappmanager
JWT=$(cat $JWT_PATH)
curl -X POST "http://my.dappnode/data-send?key=jwt&data=${JWT}"

exec /nethermind/nethermind --config holesky \
  --JsonRpc.JwtSecretFile=${JWT_PATH} \
  --JsonRpc.WebSocketsPort 8546 \
  --HealthChecks.Enabled true \
  --Init.BaseDbPath=/data \
  --Init.LogDirectory=/data/logs \
  $EXTRA_OPTS
