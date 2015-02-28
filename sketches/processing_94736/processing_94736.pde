
float[] x = new float[300];


void setup() {
size(1000, 800);
smooth();
noStroke();
for (int i= 0; i <x.length; i++){
  x[i] = random (-1000, -10);
}

}

void draw() {
background(0);
fill(0,100,0);
rect(150,0,50,800);
rect(800,0,50,800);
fill(139,119,101);
for (int i =0; i< x.length; i++){
  x[i] += 0.5;
  float y = i * 10;
  ellipse(y,x[i], 20,20);
}


fill(100);
  rect(0,0,150,800);
  rect(850,0,150,800);
  for (int r=-1100; r< width+100; r +=250){
  house(5,r);
  }
  for (int r=-1100; r< width+100; r +=250){
  house(885,r);
  }
  fill(127,255,0);
ellipse(mouseX,mouseY,40, 40);
}
void house(int r, int s){
  pushMatrix();
  translate (r,s);
  strokeWeight(1);
  smooth();
  stroke(1);
  fill(148,110,73);
  rect(5,620,100, 100);
  popMatrix();
  
}

void housetwo (int a, int b){
  pushMatrix();
  translate (a,b);
  strokeWeight(1);
  smooth();
  stroke(1);
  fill(148,110,73);
  rect(885,620,100, 100);
  popMatrix();
}







