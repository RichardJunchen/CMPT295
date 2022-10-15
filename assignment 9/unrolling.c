// Filename : unrolling.c
// purpose: change original function into inner6x1unrolling and inner6x6unrolling
// Junchen Li
// 301385486

void inner6x1unrolling(vec_ptr u, vec_ptr v, data_t *dest)
{
	long i;
	long length= vec_length (u);
	data_t *udata = get_vec_start(u);
	data_t *vdata = get_vec_start(v);
	data_t sum = (data_t) 0;

	for (i = 0; i < length-6; i+=6)
	{
		sum = sum + (udata[i]*vdata[i] + udata[i+1]*vdata[i+1]+ udata[i+2]*vdata[i+2]+ udata[i+3]*vdata[i+3]+ udata[i+4]*vdata[i+4] +udata[i+5]*vdata[i+5]);   //add current value and next five values into sum
	}
	for (; i < length ; i++)
		sum+= udata[i]*vdata[i];        // add the rest element into result if it has more

	*dest = sum;                        // return back to the destination
}

void inner6x6unrolling(vec_ptr u, vec_ptr v, data_t *dest)
{
	long i;
	long length= vec_length (u);
	data_t *udata = get_vec_start(u);
	data_t *vdata = get_vec_start(v);
	data_t sum1 = (data_t) 0;           // introduce two more variable for doing 6x6
    data_t sum2 = (data_t) 0;
    data_t sum3 = (data_t) 0;
    data_t sum4 = (data_t) 0;
    data_t sum5 = (data_t) 0;
    data_t sum6 = (data_t) 0;
    data_t sum_result = (data_t) 0;

	for (i = 0; i< length-6 ; i+=6)
	{
		sum1 += udata[i]*vdata[i];          // add current value into sum1
		sum2 += udata[i+1]*vdata[i+1];
        sum3 += udata[i+2]*vdata[i+2];
        sum4 += udata[i+3]*vdata[i+3];
        sum5 += udata[i+4]*vdata[i+4];
        sum6 += udata[i+5]*vdata[i+5];// add next value into sum2
	}
	sum_result= sum1+sum2+sum3+sum4+sum5+sum6;           // merge two results into sum_result (the final result)

	for (; i< length; i++)
		sum_result += udata[i]*vdata[i];        //add the rest element into result if it has more

	*dest = sum_result;                         // return back to the destination 
}
