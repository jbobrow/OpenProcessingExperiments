

int i;
int num = 24;
float offset = TAU/24.0;
float a;
float b;
float c;

int X =mouseX;
int Y= mouseY;


void setup(){
 size(500,500, P3D);
//noStroke(); 
  
}

void draw(){
  frameRate(75);
lights();


background(242,194,70);
translate(mouseX,mouseY);
//translate(mouseX,mouseY);

stroke(255,170,0);
for(int i = 0; i < num; i++) {
  
  float grey = map(i,250, num-1,200,255);
  pushMatrix();
  fill(255,255,250,15);
  rotateY(a + offset*i);
  rotateX(a/2 + offset*i);
  println(mouseX);
  box(200);
 popMatrix();
}
a += 0.01;

for(int i = 0; i < num; i++) {
  
  float grey = map(i,250, num-1,200,255);
  pushMatrix();
  fill(7,207,205,100);
  rotateY(a + offset*i);
  rotateX(a/2 + offset*i);
  box(200);
 popMatrix();
}
b += 0.01;






}


