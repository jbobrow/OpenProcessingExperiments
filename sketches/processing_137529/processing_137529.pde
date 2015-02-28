
// Math 2: Curves
// Exercises continued

size(500,500);
background(255);

/*
(1) y = x^2
(2) y = x^3
(3) y = x^4
(4) y = x^5
(5) y = x^6
*/

for (int x = 0; x <= 500; x++) {
  float n = norm(x,0.0,500.0);
  float val1 = pow(n,2) * 255.0;
  stroke(val1);
  line(x,0,x,100);
  float val2 = pow(n,3) * 255.0;
  stroke(val2);
  line(x,100,x,200);
  float val3 = pow(n,4) * 255.0;
  stroke(val3);
  line(x,200,x,300);
  float val4 = pow(n,5) * 255.0;
  stroke(val4);
  line(x,300,x,400);
  float val5 = pow(n,6) * 255.0;
  stroke(val5);
  line(x,400,x,500);
}


