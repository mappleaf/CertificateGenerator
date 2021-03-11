extends Node

var cert_filename = "AC_Certificate.crt"
var key_filename = "AC_Key.key"

onready var cert_path = "user://Certificate/"
onready var key_path = "user://Certificate/"

var CN = "AhegaoClicker"
var O = "Mappleaf"
var C = "RU"
var not_before = "20210311000000"
var not_after = "20220311235959"


func _ready() -> void:
	var directory = Directory.new()
	if directory.dir_exists("user://Certificate/"):
		pass
	else:
		directory.make_dir("user://Certificate/")
	CreateCert()
	print("Certificate creted")


func CreateCert() -> void:
	var CNOC = "CN=" + CN + ",O=" + O + ",C=" + C
	var crypto = Crypto.new()
	var crypto_key = crypto.generate_rsa(4096)
	var cert = crypto.generate_self_signed_certificate(crypto_key, CNOC, not_before, not_after)
	cert.save(cert_path + cert_filename)
	crypto_key.save(key_path + key_filename)
