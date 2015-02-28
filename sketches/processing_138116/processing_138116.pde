
/* My idea was to show what will happen in México if our 
population and cities keep growing. We are destroying nature
and changing our way of living with not enough resources for
everyone.
You will see a map where you can add people (smaller circles) and 
Urban spaces (bigger circles) and see what happens with 
Overpopulation by clicking and dragging the mouse.

Mouse:
click to add people and urban spaces to the map.

keys
del, backspace : restart
s : save png
*/

//variables globales

int person = 0;  
int edificio = 0;  
int recursos = 0;
int rataA;
int rataB;
PImage Mexico;
PImage maiz;
 
//setup
void setup() {
  size(1200,700);
  colorMode(HSB, width, height, 100);
  Mexico = loadImage("Mexico.jpg");
  maiz = loadImage("maiz.jpg");
  image(Mexico, 0, 0, 1200, 700);
   
}//setup
//draw
void draw() {

  //mouse input
  rataA = mouseX;
  rataB = mouseY; 
  
   if(mousePressed){
     noStroke();
     fill(random(mouseY-353), random(mouseX-100), 81);
     ellipse( rataA+(random(-30,30)), rataB+(random(-30,30)), 10, 10);
     person++;
     edificio++;
     if (edificio > 10 ) {
       ellipse(rataA+(random(-30,30)), rataB+(random(-30,30)), 30, 30); 
       edificio = 0;  
     }
     if (person > 1000) {
       int X = +80;
       int Y = +80;
       for (int gridY = 0; gridY < height; gridY +=Y){//if gridw less than the height of grid, if it is add stepY
       for (int gridX = 0; gridX < width; gridX+=X){
         ellipse( random(1200-gridX), gridY+30, X, Y);
       }
       }
       if (person > 1100) { 
         image(maiz, 0, 0, 1200, 800);
       }
     }  
   }//mouse pressed    
}//draw
  
//keys
void keyReleased() {
  if(key == DELETE || key == BACKSPACE)  {
    image(Mexico, 0, 0, 1200, 700);
    person = 0;  
    edificio = 0;  
    recursos = 0; ;
  }
  if(key == 's' || key =='S') saveFrame("screenshot.png");
}//key

