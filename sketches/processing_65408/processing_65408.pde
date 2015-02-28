
//Batman vs. Superman

int xPos = 0;
int yPos = 0;

PImage no1;
PImage no2;
PImage no3;
PImage no4;

void setup () {
noCursor();
size (700,400);
 
no1 = loadImage("superman.png");
no2 = loadImage("batman.png");
no3 = loadImage("himmel.jpg");
no4 = loadImage("bam.jpg");

}
  
void draw(){
    
image(no3,0,0);

image(no1,xPos,270);

if(xPos > width){
xPos = 0;} 
xPos = xPos +7;

image(no2,mouseX,mouseY);
 
if (mousePressed) {
image(no4,0,0);
} 
 
}
 


