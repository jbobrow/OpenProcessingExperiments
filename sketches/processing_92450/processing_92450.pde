
/* Triangle Crystal
   Programmer: Dan Olson
   03/09/2013 */

void setup() {
noSmooth();
size(300,300);

}

void draw() {
 
 rectBackground();
 quadRandSimple();
 noLoop();
  
}

void rectBackground() {

  for(int i = 0; i <= height; i++) {
    stroke(240,156,0,10);
    fill(255,random(220,240),random(150,200));
    int y = int(random(0,height));
    rect(0,y,width,y);
   
  }
}
  
void quadRandSimple() {
  
stroke(189,195,203);  

int num = int(random(5,20));

float[] x1 = new float[num];
float[] y1 = new float[num];
  
for (int i = 0; i < num; i++) {

x1[i] = random(20,width-20);
y1[i] = random(20,height-20);
 
}

beginShape(TRIANGLE_FAN);
for (int i =0; i < num; i++) {
vertex(x1[i],y1[i]);
fill(random(200,255),random(50,255),random(100,255));
}
endShape(CLOSE);

}

//Right click pause, left click re-start
void mousePressed(){
if (mouseButton == RIGHT){
noLoop();
save("1111.png");
}
if (mouseButton == LEFT) {
background(255,random(220,240),random(150,200));
loop();
setup();
}
}
