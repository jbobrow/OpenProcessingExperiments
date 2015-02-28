
int num=2;
Triangle [] triangles= new Triangle [num];
void setup(){
background(255);
size (800,400);
smooth();
for (int i=0; i<triangles.length; i++){
triangles[i] = new Triangle(60, 100);   
 }
}
 
void draw(){
for (int i=0; i<triangles.length; i++){
triangles[i].update(random(width), random(height),.1);
triangles[i].display(width/2, height/2, 1, 1);
triangles[i].checkedges();
 }
}
 
class Triangle {
    PVector loc=new PVector();
    PVector velocity=new PVector();
    PVector acceleration;
    PVector loc2;
    float topspeed;
    float xtemp;
    float ytemp;
    float movex;
    float movey;
 
 
Triangle (float x, float y) {
loc = new PVector (random(width), random(height));
velocity= new PVector (0,0);
acceleration = new PVector(-.1,.1);
topspeed=5;
}
 
void display(float x1, float y1,float w, float h){
 
noFill();
stroke(0,random(10,200));
strokeWeight(.5);
rect (loc.x, loc.y, w,h);
//rect (loc.x, loc.y, w+random(15),h+random(50));

}
   
void update(float mx, float my, float a){
xtemp=random(-10, 10);
ytemp=random(-10,10);
movex=xtemp+mx;
movey=ytemp+my;
 
movey=constrain(movey, height/4, height-(height/4));
loc2= new PVector (movex,movey);
 
PVector dir = PVector.sub(loc2,loc);
dir.normalize();
acceleration = dir;
acceleration.mult(random(a));
 
velocity.add(acceleration);
//velocity.limit(topspeed);
loc.add(velocity);
}
 
void checkedges(){
if ((loc.x > width) || (loc.x < 0)) {
velocity.x = velocity.x * -1;
}
if ((loc.y > height) || (loc.y < 0)) {
velocity.y = velocity.y * -1;
  }
 }
}
 
void mousePressed(){
if (mousePressed){
background(0);
println(mousePressed + "yes");
 }
}

