download: sample_data.tar.gz
	wget <url>
	tar xf sample_data.tar.gz

load_path:
	POD=$(kubectl get pod -l prism=imageloader -o jsonpath="{.items[0].metadata.name}")
	kubectl cp ./images/ $POD:/data/
	kubectl exec deployment/imageloader -- imageloader -src /data/images/example.csv -username admin -password bluecheese2018 -collectionname Public

load_radiology:
	@echo "Refer to Posda user manual"

load_semantic:
	@echo "Open http://localhost:7200 and load rdf"
	kubectl port-forward svc/triplestore 7200:7200
