

//week4

//This week i have used the new code lines to make 
//a Cool sketch using the keyboard and mouse inputs.
//Press 1-4 to switch sroke color
//press a,b,c,d,e to switch backgroung color and fill
//Press Delete to delete Draw
//Press S or s to save PrintScreen (:

//Global  Variables

//Define Color Palette
color strokeColor = color (0,20);
int stepX;
int stepY;

//setup()
void setup() {
  size(800,600);
  colorMode(HSB, width, height, 100);
  background(0);
}

//draw()
void draw() {


  
if(mousePressed) {
  pushMatrix();
  translate(width/5, height/5);
  int circleResolution = (int)map(mouseY+55, 0 , height, 2, 20);
  int radius = mouseX-width/2;
  float angle = TWO_PI/circleResolution;
  
  //style
  strokeWeight(2);
  stroke(strokeColor);
  
  beginShape();
  for ( int i=0; i<=circleResolution; i++){
    float x = 0 + cos(angle*i) * radius;
    float y = 0 + sin(angle*i) * radius;
    vertex(x, y);
  }
endShape();
popMatrix();
}}


  
 void keyReleased(){
if (key == 's' || key == 'S') saveFrame("screenshot.png");
  if (key == DELETE || key == BACKSPACE) background(0);

switch(key){
  case '1':
  strokeColor = color (#F495A3);
  fill(#21BFA2);
   break;
  case '2':
   strokeColor = color (#FCBBB5);
   fill(#E4F29A);
   break;
  case '3':
   strokeColor = color (#E7D9CB);
   fill(#A359BF);
   break;
  case '4':
   strokeColor = color (#F0A79E);
   fill(#170721);
   break;
  case 'a':
    background(#F0A79E);
    break;
   case 'b':
    background(#F04B9E); 
    break;
   case 'c':
    background(#604B9E);
    break;
   case 'd':
    background(#134B9E);
    break;
   case 'e':
    background(#554BAB);
    break;
   
   
}
 }





