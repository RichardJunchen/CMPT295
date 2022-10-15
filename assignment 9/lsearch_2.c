// Filename : lsearch_2
// Purpose : modify by the pseudo code
//junchen Li
//301385486

int search (int A[n],target)
{
	if (n<=0)
		return -1;
	int temp=A[n-1];
    A[n-1]=target;
	int i=0;
	while (A[i]!=target)
		i=i+1;
	A[n-1]=temp;
	if (i<n-1)
		return i;
	else if (A[n-1]==target)
		return n-1;
	else
		return -1;

}
