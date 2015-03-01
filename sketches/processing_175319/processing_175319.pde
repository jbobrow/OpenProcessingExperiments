
size(800,800);

for (int x = 0; x < 300; x++) {
float n = norm(x, 0.0, 300.0);
float val = n * 255.0;
stroke(val);
line(x, 0, x, 50);

float valNeg = (1-n) * 255.0;
stroke(valNeg);
line(x, 50, x, 100);

float valSquare = pow(n,2) * 255.0;
stroke(valSquare);
line(x, 100, x, 150);

float valSquareNeg = pow((1-n),2) * 255.0;
stroke(valSquareNeg);
line(x, 150, x, 200);

float valCube = pow(n,3) * 255.0;
stroke(valCube);
line(x, 200, x, 250);

float valCubeNeg = pow((1-n),3) * 255.0;
stroke(valCubeNeg);
line(x, 250, x, 300);

}


