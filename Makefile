plan:
	terraform plan --var "do_token=${DO_PAT}" \
		--var "pvt_key=${DO_PVT_KEY_DIR}" \
		--out "infra.out"
