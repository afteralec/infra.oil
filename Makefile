plan:
	terraform plan \
		--var "do_token=${DO_PAT}" \
		--var "pvt_key=${DO_PVT_KEY_DIR}" \
		--out "infra.tfplan"

destroy:
	terraform plan --destroy \
		--var "do_token=${DO_PAT}" \
		--var "pvt_key=${DO_PVT_KEY_DIR}" \
		--out "infra.tfplan"

apply:
	terraform apply "infra.tfplan"
