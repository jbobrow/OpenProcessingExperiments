
float x;
float y;
float yspeed = 0;
float xspeed = 0;
float balldiameter = 10;
float ballradius = balldiameter/2; 

void setup(){
size(700,400);
background(255);
fill(0);
noStroke();
}

void draw(){
mousemouvement();
boundary();
Ball();

}
void mousemouvement(){
if(mousePressed==true){
x=mouseX;
y=mouseY;
yspeed = mouseY-pmouseY;
xspeed = mouseX-pmouseX;
//ellipse(pmouseX,pmouseY,mouseX,mouseY);
}
}



void boundary() {
if (y >= height - ballradius) {
y = height - ballradius;
yspeed = -yspeed/1.5;
}
if (y <= ballradius) {
y = ballradius;
yspeed = -yspeed/1.35;
}
if (x >= width -ballradius) {
x = width -ballradius;
xspeed = -xspeed/1.10;
}
if (x <= ballradius) {
x = ballradius;
xspeed = -xspeed/1.10;
}
}

void Ball() {
if (balldiameter < 2) {
balldiameter = 2;
}
if (balldiameter > 400) {
balldiameter = 400;
}
ballradius = balldiameter/2;
background(255);
ellipse (x,y,10,10);
yspeed = yspeed += 0.2;
xspeed = xspeed/1.1;
y = y + yspeed;
x = x + xspeed;
} 
                
                
