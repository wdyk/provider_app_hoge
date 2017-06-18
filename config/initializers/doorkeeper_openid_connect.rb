Doorkeeper::OpenidConnect.configure do
  #issuer 'issuer string'
  issuer 'http://127.0.0.1:3000'

# 秘密鍵なので普通はコミットしてはいけない
  jws_private_key <<-EOL
-----BEGIN RSA PRIVATE KEY-----
MIIEpgIBAAKCAQEAy7MUjxvbfero4rIzHtcxDW8DlowNuYZf/E99mWMcnq9gj+fW
zpAjEuUK1pUewF0KbWD1NHLsa1e7CejQZRec0/utB3c69yTqTU15087iSOnr4tFj
/QGH/Yzi83j8avVt7rXwHhS6p4Y6FM1iOwqFMDx3mp8yGM9aGtkUPoO1KXO33bBy
lHcXMhAMiIIoCWKcgFq0LhZ4KuiZF1hK7MwcoEv5qQyCU4FYCXQVownYg1n0bxn5
xlJIrAbaB37GyeyPICSUOLr05KXFf3GJ7ccon4ZgxwiZZciR9lYVBz1yLCq/sYs5
2Yw2ld/UL+TGt2zOf9nss/5F0b8VYLjc1JoDTwIDAQABAoIBAQCzlh+zB9lcSyWk
73yYXRo3AL/GE5XqEek/9gkCmVnbIT1dwgUkufjiKKKEipXA/IY75nZoFkYPYRpa
YzKPXeD7F3D2Gw0WZSpYmsyki0n/BJTdtMOVhKsTRAm2o9zOo7CW+zpGGvpwxash
Oe23pc/EthqwbFfrfauv7eCmONIYRwQqUzXbGTZdmQK/QDznACmtsUE9xh7Cpt6o
zHyA+67XnEKc3Obs7Mu0OdF+5VAzza18lRB3f0Qg6fxXjvrXby+dNUJSUk0QIbiE
CbXmuYxl8p+knEjdUYijC0ElJOwHFWfY34QTEtjvuKEOERs6gONQJMfMOnbyKDRs
3FEKqPOJAoGBAPhPxkDC1gfOyPD/L1ZYeO6X7CfTI3yQLMuJS1aweQzQYxLwMz5W
KHCCOx+LVmlOuaUjxbCNR9Yh8opD+9rPgsZfPsbWe4vLgZBqBJlNtozF1K1CMCei
Teb48LKEGk1DBLsGfqoAlRzKst/85mYSQkVwaCVfBsKeAHM8uCQK5QbdAoGBANIB
sO6HYSwRgy1YuTc8lct2ECcr+33l99ZUP1M2xaGFwMs2IfOmIpYCFBF7+hA4YSh1
TrUkiW2ExDZy6Do3t0bIRnoulnMPld55Uq8cgdxZleMkqinz9TY1PH9parrXIIUj
h+PWVE8Pp1NifoUsY818z5JmCX3NhPqUwFlWhdIbAoGBAOQZE/rlf4rIj5miMK/W
sbAq6opiz9Ra9Gs8AXLuxSPaQUhiUhBPQPKpDvqZGpW99ZcXV0ApZ/XyVURh0vdb
a7wiPh6VZAQ0ux4X5YWV97009Xr6tBWUaI9l2mWCKE8U40GSY8RyqIc8RDixrkvR
NgNnkKPTuPgKAEvbWSPyxhQZAoGBALRwi4uHerCYo3M1Bn81aSeWW66slbvI+jeH
z5k6OHjeKZbw/h8RIiptwrx7H5MMPj66/FOb/xDAwK5f8LUE5k7FCfk1SkO2oniz
GZ4oClRADQ9Lk4HUgV6AQ2jeNLww11pN+xaCM5JyyrxUpozaZS5MDTWmwoT7L0T2
xoZ8VyL9AoGBAOii0lsQ5WUCM/1Ic5UyfCuZukE47xVxOPBR4VM0RMtfI82JdlBQ
Lpp7oloYYGl4JqZ02LjbKDOYduU5hAl1cqKDwWJ5WKOES5QFbXVaNjuWlfGLF/VF
EZ3cYel1ItrkIFE5FwILRyPocfR2YRVOiaQCKALoF3kexNzWTWmESqg+
-----END RSA PRIVATE KEY-----
EOL

  resource_owner_from_access_token do |access_token|
    # Example implementation:
    User.find_by(id: access_token.resource_owner_id)
  end

  auth_time_from_resource_owner do |resource_owner|
    # Example implementation:
    # resource_owner.current_sign_in_at
  end

  reauthenticate_resource_owner do |resource_owner, return_to|
    # Example implementation:
    # store_location_for resource_owner, return_to
    # sign_out resource_owner
    # redirect_to new_user_session_url
  end

  subject do |resource_owner|
    # Example implementation:
    resource_owner.key
  end

  # Protocol to use when generating URIs for the discovery endpoint,
  # for example if you also use HTTPS in development
  # protocol do
  #   :https
  # end

  # Expiration time on or after which the ID Token MUST NOT be accepted for processing. (default 120 seconds).
  # expiration 600

  # Example claims:
  # claims do
  #   normal_claim :_foo_ do |resource_owner|
  #     resource_owner.foo
  #   end

  #   normal_claim :_bar_ do |resource_owner|
  #     resource_owner.bar
  #   end
  # end
end
