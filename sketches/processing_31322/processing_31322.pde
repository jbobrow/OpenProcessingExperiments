
int E = -50;
int R = 50;

int T = 50;
int Y = 150;

int U = 100;
int I = 200;

int O = 150;
int P = 250;

int A = 200;
int S = 300;

int D = 250;
int F = 350;

int G = 300;
int H = 400;

int J = 350;
int K = 450;

int Z = 400;
int X = 500;

int C = 450;
int V = 550;

void setup()
{
 size(500,500);
 background(255);
 smooth();
 
 noStroke();
 fill(0,20);
 
 triangle(-50, E, 0, R, 150, R);
 triangle(0, E, 50, R, 200, R);
 triangle(50, E, 100, R, 250, R);
 triangle(100, E, 150, R, 300, R);
 triangle(150, E, 200, R, 350, R);
 triangle(200, E, 250, R, 400, R);
 triangle(250, E, 300, R, 450, R);
 triangle(300, E, 350, R, 500, R);
 triangle(350, E, 400, R, 550, R);
 triangle(400, E, 450, R, 600, R);
 triangle(450, E, 500, R, 650, R);
 
 triangle(0, 0, 50, 100, 200, 100);
 triangle(50, 0, 100, 100, 250, 100);
 triangle(100, 0, 150, 100, 300, 100);
 triangle(150, 0, 200, 100, 350, 100);
 triangle(200, 0, 250, 100, 400, 100);
 triangle(250, 0, 300, 100, 450, 100);
 triangle(300, 0, 350, 100, 500, 100);
 triangle(350, 0, 400, 100, 550, 100);
 triangle(400, 0, 450, 100, 600, 100);
 triangle(450, 0, 500, 100, 650, 100);
 
 triangle(50, T, 100, Y, 250, Y);
 triangle(100, T, 150, Y, 300, Y);
 triangle(150, T, 200, Y, 350, Y);
 triangle(200, T, 250, Y, 400, Y);
 triangle(250, T, 300, Y, 450, Y);
 triangle(300, T, 350, Y, 500, Y);
 triangle(350, T, 400, Y, 550, Y);
 triangle(400, T, 450, Y, 600, Y);
 triangle(450, T, 500, Y, 650, Y);
 
 triangle(100, U, 150, I, 300, I);
 triangle(150, U, 200, I, 350, I);
 triangle(200, U, 250, I, 400, I);
 triangle(250, U, 300, I, 450, I);
 triangle(300, U, 350, I, 500, I);
 triangle(350, U, 400, I, 550, I);
 triangle(400, U, 450, I, 600, I);
 triangle(450, U, 500, I, 650, I);
  
  triangle(150, O, 200, P, 350, P);
 triangle(200, O, 250, P, 400, P);
 triangle(250, O, 300, P, 450, P);
 triangle(300, O, 350, P, 500, P);
 triangle(350, O, 400, P, 550, P);
 triangle(400, O, 450, P, 600, P);
 triangle(450, O, 500, P, 650, P);
 
  triangle(200, A, 250, S, 400, S);
 triangle(250, A, 300, S, 450, S);
 triangle(300, A, 350, S, 500, S);
 triangle(350, A, 400, S, 550, S);
 triangle(400, A, 450, S, 600, S);
 triangle(450, A, 500, S, 650, S);
 
 triangle(250, D, 300, F, 450, F);
 triangle(300, D, 350, F, 500, F);
 triangle(350, D, 400, F, 550, F);
 triangle(400, D, 450, F, 600, F);
 triangle(450, D, 500, F, 650, F);
 
 triangle(300, G, 350, H, 500, H);
 triangle(350, G, 400, H, 550, H);
 triangle(400, G, 450, H, 600, H);
 triangle(450, G, 500, H, 650, H);
 
 triangle(350, J, 400, K, 550, K);
 triangle(400, J, 450, K, 600, K);
 triangle(450, J, 500, K, 650, K);
 
  triangle(400, Z, 450, X, 600, X);
 triangle(450, Z, 500, X, 650, X);
 
 triangle(450, C, 500, V, 650, V);
}

