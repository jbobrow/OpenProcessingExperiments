
/* @pjs preload="Project3night.png"; 
 */
 // CREATE YOUR OWN DESTINY
// Stars with random colors and shapes are drawn as the mouse is pressed in the Istanbul sky. 
// DELETE OR BACKSPACE clears the stars. "s" and "S" can be used to save screenshot. 
//There are two color alternatives. They can be accessed by pressing "1"(default colors - night) and "2" (dawn).

//Global Variables
float xcenter = 25;      //x coordinate of the star's center
float ycenter= 25;      //y coordinate of the star's center
float counter = 0;
float rnew;
color[] palette={#FF31F5, #46D70C, #FFB308, #E8640C, #FF041A};  //color version 1
//Declare two PImage type variables: 
PImage night;
PImage dawn;


void setup() {
  size(900,600);
  night = loadImage("Project3night.png");   //Load an image file from HDD
  dawn = loadImage("Project3dawn.png");
  frameRate(10);
}

void draw() {
  int n = int(random(4,15));  //number of points of the star
  float r = random(2,7);    //used for sizing of the star
  float pppp = random(5);   //used to choose random colors from the palette
  counter = counter + 1;
   if (counter <= 1){
     image(night, 0, 0, 900, 600); //draws the image to the screen at (0,0) for only once - serving as background
   }
  strokeWeight(0);
  stroke(palette[int(pppp)]);
  fill(palette[int(pppp)]);
  xcenter = mouseX;
  ycenter = mouseY;
  if (mousePressed) {
    if (ycenter < 350) {
      beginShape();      // draws the star as a polygon
        for (int i = 1; i < 2*n+1 ; i++){
          float j = i;
          if (j/2 == int(i/2))  { //my way of determining if i is even - when i is even, points of the star are drawn
            rnew = 3 * r;
          } else {
            rnew = r;
          }
          float alfa = TWO_PI / (4 * n) + (i - 1) * TWO_PI / (2 * n); 
          float x = xcenter + rnew * cos(alfa);
          float y = ycenter + rnew * sin(alfa);
          vertex(x,y);
        }
      endShape();
    }else {    //when the mouse is clicked on the land - not on the sky
      textSize(24);
      textAlign(CENTER);
      text("Create your own destiny",width/2, 525);
    }
  }
}

void keyReleased(){
  if (key == DELETE || key == BACKSPACE) image(night, 0, 0, 900, 600);
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
  if (key == '2') {
    image(dawn, 0, 0, 900, 600);
    palette[0]=#9ED3D6; palette[1]=#DAEBBF; palette[2]=#D1D9D5; palette[3]=#FEC7D8; palette[4]=#D8CAA3;
  }
  if (key == '1')  {
    image(night, 0, 0, 900, 600);
    palette[0]=#FF31F5; palette[1]=#46D70C; palette[2]=#FFB308; palette[3]=#E8640C; palette[4]=#FF041A;
  }
}





