# spring-boot-hello
## 開発実行
```
./gradlew bootrun
```

## Docker実行
```
docker build -t spring-boot-hello . && docker run -p 8080:8080 spring-boot-hello
```


## memo
### program
ここまでやった  
https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started.html#getting-started.first-application.run.gradle  


### deploy
https://dr6v9snpl32kb.cloudfront.net/?c=bd127942-2fd4-4a01-a26c-6666cf312866  
- 権限追加
  ```
  gcloud projects add-iam-policy-binding ${project_id} \
    --member="user:${email}" \
    --role="roles/artifactregistry.writer"
  ```
- build
  ```
  docker build -t asia-northeast1-docker.pkg.dev/${project_id}/spring-boot-hello/spring-boot-hello .
  ```
- push
  ```
  docker push asia-northeast1-docker.pkg.dev/${project_id}/spring-boot-hello/spring-boot-hello
  ```
- deploy
  ```
  gcloud run deploy spring-boot-hello \
    --image asia-northeast1-docker.pkg.dev/${project_id}/spring-boot-hello/spring-boot-hello \
    --platform managed \
    --project ${project_id} \
    --region asia-northeast1 \
    --allow-unauthenticated
  ```
- 最小インスタンス設定
  課金を抑えるために0にして普段は停止しておく(デフォルト0っぽいが)
  ```
  gcloud run services update spring-boot-hello --min 0 --project ${project_id} --region asia-northeast1
  ```

