

/*
Norman Diaz
August 8/2011
PACMAN
*/

int i= 15; 
int x = 15; 
int y = 15;
float diam = 15; 
int xspeed = 2;
int  distance = 60; 
PImage bg;

  
void setup() {
  size(400, 300);
  background(255);
  bg = loadImage("background.jpg");
  smooth();
  frameRate(50);
  
}

void draw() {
  colorMode(RGB);
  image(bg, 0, 0);
noStroke();
smooth();
x = x + xspeed;

for(int i = 0; i<15; i++) {
ellipse(x, y+ distance*i ,diam, diam);

 }

fill(1, 890, 230);
if(x>=100){
fill(42,89,456);

}


 if(x>=250){
fill(37,238,30);


 }


if(x>=300){
fill(250,217,100); 
 }

if(x>=375){
fill(3,108,191);
}
if(x>=400){
fill(4,89,250);

} 

if(x>=450){
fill(30,100,200);
 }  


if(x>=500){
fill(252,214,1);

 } 

if(x>=550){
fill(10,34,235);
} 

}




