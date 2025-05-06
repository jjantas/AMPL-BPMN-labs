var x1 >= 0;
var x2 >= 0;
var x3 >= 0;

minimize funkcja_celu:
	x1 + 2*x2 + 3*x3;

subject to ograniczenie1:
	-x1 + x2 + x3 = 5;

subject to ograniczenie2:
	12*x1 - 9*x2 + 9*x3 >= 8;

