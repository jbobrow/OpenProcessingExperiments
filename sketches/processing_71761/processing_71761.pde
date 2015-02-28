
float circle_x=0.0;
float square_y=0.0;
float value=350.0;
float recta=0.0;
float col=0.0;
float rr=200.55;
float rs=332.78;
int rad = 60;        
float xpos=200, ypos=200;       

float xspeed = -2.8;  
float yspeed = -2.2; 

int xdirection = 1;  
int ydirection = 1;  
int rad2=70;
float xpos2=500, ypos2=500;       

float xspeed2 = -2.8;  
float yspeed2 = -2.2; 

int xdirection2 = 1;  
int ydirection2 = 1;  


void setup(){
background(100,100,random(rs)); 
size(800,600);
frameRate (22);

 ellipseMode(RADIUS);
  
  xpos = width/2;
  ypos = height/2;

}
void mouseMoved(){
value= value + 12;
if (value > 255){
 value=0;} 
} 
void draw(){

fill(255);
noStroke();
circle_x=circle_x +1;
square_y=square_y+10;
fill(value);
rect (value,200,150,150);


 xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
 }
if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }
 ellipse(xpos, ypos, rad, rad);

fill(random(200),random(200),random(90));
  xpos2 = xpos2 - ( xspeed2 * xdirection2 );
  ypos2 = ypos2 - ( yspeed2 * ydirection2 );
if ((xpos2) > width-rad2 || xpos2 < rad2) {
    xdirection2 *= -1;
 }
if ((ypos2) > height-rad2 || ypos2 < rad2) {
    ydirection2 *= -1;
  }
 ellipse(xpos2, ypos2, rad2, rad2);

if(circle_x >130){
  noStroke();
  fill(random(80),random(rr),random(255));
  ellipse (400,random(600),random(200),random(100));
  circle_x=circle_x%5;
}


{
translate(width/2, height/2);
rotate (PI/1.50);
noStroke();
smooth();
fill(random(255),random(200),random(200));
ellipse(-40,290,60,220);

translate(width/2, height/2);
rotate (PI/1.50);
noStroke();
smooth();
fill(random(180),random(100),random(200));
ellipse(-45,820,60,190);
}

}


 




