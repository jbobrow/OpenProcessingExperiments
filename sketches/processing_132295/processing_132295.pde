
size(500, 500);
background(175, 75, 100);
smooth();

int a = 100;
int b = 5;
int c = 75;
fill(a);

/*
rect(100, 100, a, a);
rect(150, 200, 50, 50);
fill(b);
rect(200, 300, b, b);
ellipse(300, 400, 50, 50);
fill(c);
ellipse(325, 500, c, c);
*/

for(int i = 0; i <= 500; i += 10){
  rect(0, i, a, b); //statement
  rect(i, i, a, b);
}


