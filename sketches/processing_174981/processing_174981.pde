
//mouseinput() interactive project 1
//www.generative-gestaltung.de/code


//Global Variables
int stepX;
int stepY;


//setup()
void setup() {
 size(800, 600);
 background(0);
 
 
}
//draw()
void draw() {
 colorMode(HSB, width, height, 100);
 //mouse input
 stepX = mouseX+20;
 stepY = mouseY+20;
 
 //for statement
 //gridX and gridY
 for (int gridY = 0;gridY < height; gridY+=stepY){
   for (int gridX = 0;gridX < width; gridX+=stepX){
     fill(gridX, height-gridY, 100);
     ellipse(gridX, gridY, stepX, stepY); 
     
   }
   
 }

}

//keyPressed()
void keyPressed() {
 if (key=='s' ||key=='S') saveFrame("screenshot.png"); 
}

