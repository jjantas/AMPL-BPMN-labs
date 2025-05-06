var x{1..3} >=0;

param A{1..3};
param B{1..3};
param C{1..3};

minimize f_celu:
	sum{i in 1..3} A[i] * x[i];
	
subject to ograniczenie1:
	sum{i in 1..3} B[i] * x[i] = 5;

subject to ograniczenie2:
	sum{i in 1..3} C[i] * x[i] >= 8;




	