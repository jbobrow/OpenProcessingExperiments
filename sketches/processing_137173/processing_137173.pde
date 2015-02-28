
size (600, 300);
noFill();


for (int x=0; x < 600; x++) {
 float n = norm (x, 0.0, 600.0);
 float  val = n*455.0;
 stroke (val);
 line (x, 0, x, 50);
 float valSquare = pow(n, 6) * 855.0;
 stroke (valSquare);
 line (x, 50, x, 100);
 float valOne = pow(n, 2) * 443.0;
 stroke (valOne);
 line (x, 100, x, 150);
}

for (int x=0; x < 600; x++) {
 float n = norm (x, 0.0, 600.0);
 float  val = (1-n)*250.0;
 stroke (val);
 line (x, 150, x, 200);
 float valSquare = pow((1-n), 6) * 235.0;
 stroke (valSquare);
 line (x, 200, x, 250);
 float valOne = pow((1-n), 2) * 1143.0;
 stroke (valOne);
 line (x, 250, x, 300);
}


