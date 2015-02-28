
/*Assignment 4
Name:       Ilena Pegan
E-mail:     ipegan@brynmawr.edu
Course:     CS 110 - Section 03
Submitted:  Friday, October 21, 2011

An interactive composition where falling stars appears when the mouse is 
clicked. As the star falls it leaves a tail that looses opacity as it nears
the ground. 
*/

//Declare: Falling Star Array
falling fallings[];
int maxi = 30; 

//Falling Star Tail
int[] fallingX = new int[30];
int[] fallingY = new int[30];
int TAIL_SIZE = 10;
float tailSize = TAIL_SIZE; 


//Background: Number of Twinkling Stars
int[] starX = new int[900];
int[] starY = new int[900];
color[] starColor = new color[900];
//Background: Size of Stars
int starSize = 3;

void setup () {
  size (500, 500);
//Background: Twinkling Stars Location
  for (int i = 0; i < starX.length; i++) {
    starX[i] =(int)random(width);
    starY[i] = (int)random(height);
    starColor[i] = color((int)random(100,255));
  }
  ellipseMode (CENTER);
  fallings = new falling[maxi];
}

void draw() {
  //Background: Thin Black Outline for Twinkling Stars
  
  updateFalling();
  //Background: Night Sky
  background (0, 5, 57);
  drawFalling();
}

//updateFalling Function
//Call the class: Update/Step Function
void updateFalling() {
  int i = 0;
  while(fallings[i] != null) {
    if (fallings[i].centerY < height + fallings [i].diam*2.5)
    fallings[i].step();
    i++;
    if(!(i<maxi))
    break;
  }
}

//drawFalling function
void drawFalling () {
  int i = 0;
  while (fallings[i] !=null) {
    if (fallings[i].centerY < height + fallings [i].diam*2.5)
    fallings[i].draw();
    i++;
    if(!(i<maxi))
    break;
  }
}

//mousePressed Funcion
void mousePressed() {
  int i = 0;
  while (fallings[i] != null){
    if (fallings[i].centerY > height + fallings[i].diam*2.5)
    break; 
    i++;
    if (!(i < maxi))
    break;
  }
  
  if(i < maxi){
    fallings[i] = new falling(mouseX, mouseY);
  }
}

//Falling Star Class
class falling {
  float originalY;
  float centerX;
  float centerY;
  float diam;
  float opacity;
  
//Constructor
falling (float x, float y) {
   originalY = y;
    centerX = x;
    centerY = y;
    diam = random(5, 10);
    opacity = 255; 
  }
  
//Design Falling Star
void draw() {
  fill (255, opacity);
  ellipse(centerX,centerY,diam,diam); 
  stroke(255, opacity);
  strokeWeight(3);
  beginShape (LINES);
  vertex (centerX, centerY);
  vertex(centerX, (centerY-(diam*2.5)));
  
  //Background: Twinkle Stars!
  stroke(0,5,57);
  strokeWeight(1);
  for (int i = 0; i < starX.length; i++) {
    fill(random(50,255)); 
    if (random(10) < 1) {
      starColor[i] = (int)random(100,255);
    }
    fill(starColor[i]);
    ellipse(starX[i], starY[i], starSize, starSize);
  }
 
}
void step() {
  centerY += 2;
  //Falling Star Fades
  opacity = (500 + diam*2.5 - centerY) / (500 + diam *2.5 - originalY) * 255;
    
  }
}

