
float x; 
float y;
float yspeed = 0;
float xspeed = 0;
float spherediameter = 20; //Definition the sphere  diameter
float sphereradius = spherediameter/2; //Definition the sphere  diameter
 
void setup(){
size(720,720,P3D);
 
}
 
void draw(){
  
 
  frameRate(80);//Control the rate of change
   
 background(0);
 line(50,50,x,y);
line(0,50,720,50);
stroke(random(255),random(255),random(255));
noFill();
translate(x,y,50);
sphere(25);
sphereDetail(mouseX/60);
lights();
mousemouvement();
boundary();
Sphere();
colorMode(HSB,150);
}
void mousemouvement(){
if(mousePressed==true){ //press the mouse and move
x=mouseX;
y=mouseY;
yspeed = mouseY-pmouseY; //Control the direction of fall
xspeed = mouseX-pmouseX;    //Control the direction of fall
 
}
}
void boundary() { //Control of the sphere after contact  the  boundary speed
if (y >= height - sphereradius) {
y = height - sphereradius;
yspeed = -yspeed;
}
if (y <= sphereradius) {
y = sphereradius;
yspeed = -yspeed/10;
}
if (x >= width -sphereradius) {
x = width -sphereradius;
xspeed = -xspeed/1.10;
}
if (x <= sphereradius) {
x = sphereradius;
xspeed = -xspeed/1;
}
}
 
 
 
 
 void Sphere(){
  if (spherediameter < 2) {
spherediameter = 20;
}
if (spherediameter > 400) {
spherediameter = 400;
}
 sphereradius = spherediameter/1.5;//Falling speed
yspeed = yspeed +0.8;
xspeed = xspeed/1.1;
y = y + yspeed;
x = x + xspeed;
}
