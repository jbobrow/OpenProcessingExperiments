
int num = 150;
int [] x = new int[num];
int [] y = new int[num];

void setup(){
 size(500, 100);
 smooth();

//init
for (int i = 0; i < 150; i++){
 x [i] = 0;
 y [i] = 0;
  } 
}

void draw() {
 background (0,0,255);
//shift array values;
 for (int i = 0; i < x.length - 1; i++){
  x[i] = x [i+1];
  y[i] = y [i+1]; 
 }

x[x.length -1] = mouseX;
y[y.length -1] = mouseY;

//draw everything
for (int i = 0; i < x.length; i++){
  noStroke();
  fill(255 - i*5);
  ellipse(x[i], y[i], i-120,i-120);
}
}

