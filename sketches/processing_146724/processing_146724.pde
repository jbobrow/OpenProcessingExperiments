
// Stephanie Jeong yujeongj copyright 2014
// HW 10

final int MAX = 1;
String [] stringArray = {"press the space bar to change", "the color of the circles!"};

float [] x = {40, 80, 120, 160, 200, 240, 280, 320, 360};
float [] y = {200, 200, 200, 200, 200, 200, 200, 200, 200};
float diam = 20;
float deltaX = 1;
PImage pic;
PImage [] picArray;


void setup(){
  size(400,400);
  textSize(20);
  fill(255);
  frameRate(24);
  noStroke();
  
  imageMode(CORNER);
  picArray = new PImage [MAX];
  initImageArray(picArray);
}


void draw(){
  background(255);
  showImage();
  drawCircles();
  printArray(stringArray);
}



void showImage()
{
  for(int i=0; i<picArray.length; i++){
    image(picArray[i], 0, 0, 400, 400); }
}

void drawCircles(){
  for ( int i = 0 ; i < x.length ; i++ ){
    ellipse(x[i], y[i], diam ,diam);
  }
}


void printArray(String[]anyArray){
  for (int i = 0; i < anyArray.length; i++){
    text(anyArray[i], 20, 340 + i*24);
  }
}
 
void initImageArray(PImage[ ] picArray)
{
  for(int i = 0; i<picArray.length; i++)
  {
    String imageName = "star.jpg";
    picArray [i] = loadImage(imageName);
  }
}

void keyPressed(){
  if (key ==' '){
    fill(random(255),random(255),random(255));
  }
}


