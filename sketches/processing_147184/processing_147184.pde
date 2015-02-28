
ArrayList<Branch> greybranches;

float range = 100;
float t = 0;
float x = 0;
float t1 = 1;
float x1 =0;
float y = 0.;
float y1 = 0.;

void setup() {
  size(800,800);
  background(56,9,103);
  greybranches = new ArrayList();
}



void draw() {
  float x = map(noise(t),0.,1.,0, width);
  triangle(x,x+0.1,x+0.3,x+0.5,x+0.2,x+0.4);
   triangle(x,x+0.2,x+0.4,x+0.1,x+0.5,x+0.3);
  stroke(248,250,150,70);
  strokeWeight(200);
  t +=0.005;
  
 float x1 = map(noise(t1),0.,1.,0,width);
triangle(x1,x1+0.1,x1+0.3,x1+0.5,x1+0.2,x1+0.4);
triangle(x1,x1+0.2,x1+0.4,x1+0.3,x1+0.1,x1+0.5);
stroke(96,245,102,70);
strokeWeight(150);
 t1 +=0.2;  
 
 for (int i = 0; i<greybranches.size(); i++){
 Branch greybranch = greybranches.get(i);
greybranch.display();
greybranch.run();
 }
 y = y+0.01; 
 if (mousePressed){
    greybranches.clear();
}
if (greybranches.isEmpty()){
}
}

void keyPressed() {
  if (key == ' ') {
    greybranches.add(new Branch(255, random(800),random(800),random(50)));
  }
}  
class Branch{
  color c;
  float xpos;
  float ypos;
  float xspeed;
   
  Branch(color tempC, float tempXpos, float tempYpos, float tempXspeed){
    c = tempC;
    xpos =tempXpos;
    ypos =tempYpos;
    xspeed = tempXspeed;
  }
 
void display() {
noStroke();
fill(random(180),127,237,50)  ;
ellipse(xpos+xspeed,ypos-xspeed,xspeed,xspeed);
}
   
void run(){
  xpos = xpos+ xspeed;
  if (xpos> width){
    xpos =0;
  }
}
}

