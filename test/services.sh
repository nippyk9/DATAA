for i in `cat test1`

do 
{
echo "********************************************$i***************************************************"
sshpass -p 'Magic@Redhat' ssh -t elastic@$i systemctl status elasticsearch
}
done
