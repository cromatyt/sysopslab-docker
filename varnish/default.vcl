vcl 4.1;

backend default {
    .host = "nginx.docker.localhost";
    .port = "8081";
}

sub vcl_deliver {
  # Display hit/miss info
  if (obj.hits > 0) {
    set resp.http.V-Cache = "HIT";
    set resp.http.V-HIT-Count = obj.hits;
  }
  else {
    set resp.http.V-Cache = "MISS";
  }
}