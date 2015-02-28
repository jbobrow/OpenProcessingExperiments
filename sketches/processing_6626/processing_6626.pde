


int size = 60;
float xpos, ypos;

float xspeed = 2.0;
float yspeed = 2.5;
float fillNum = 0;
float xdirection = random(xspeed);
int ydirection = 1;

void setup(){
size(700,700,P3D);
smooth();
background(30);
xpos = width/2;
ypos = random(400)/2;
}

void draw() {
  

fill(xpos/3,ypos/3,0,100);
xpos = xpos + (xspeed*xdirection);
ypos = ypos + (yspeed*ydirection);

if(xpos>width-size || xpos<0){
  xdirection *= -1;
}
if(ypos>height-size || ypos<0){
  ydirection *= -1;
}
ellipse(xpos,ypos,20,20);
translate(20,20);
ellipse(xpos,ypos,30,30);



}




