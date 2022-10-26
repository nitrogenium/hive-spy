

start_ssh_rig_id=$(curl -G --data-urlencode "n=qwe"  "http://127.0.0.1:8000/report")

#echo $start_ssh;

hssh_output=$(cat test.txt)

#echo $hssh_output

curl --data "hssh=$hssh_output" "http://127.0.0.1:8000/hssh/$start_ssh_rig_id"
