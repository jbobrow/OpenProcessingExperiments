
//PROJECT 1_WOVEN CROMATISM
//Sean M Gillespie
//ARCH 4050_DIGITAL METHODS




/*variable colors to be used in a randomColor generator
the variable barThickness allows the program to fit to window sizes*/
color Black = color(50,60);
color White = color(150,60);
color Red = color(255,0,0,60);
color Blue = color(100,220,220,60);
color Yellow = color(250,250,0,60);
int barThickness = width/40;


//setup provides a neutral canvas to the drawing
void setup(){
  size(700,700);
  background(255);
}

//introduction of two personalized functions

//barsHorizontal creates a set of horizontal bands of varying colors
//the bands themselves are related by a rule (height 1, height 1 + height 2, height 2) defining their y coordinate at the corner
void barsHorizontal(float y,float offset){
  int barThickness = width/40;
  fill(0);
  noStroke();
  rect(0, floor(y), width, barThickness);
  
  //this band has a unique color that is defined by a later function
  randomColor();
  noStroke();
  rect(0, floor(y + offset), width, barThickness);
  
  fill(White);
  noStroke();
  rect(0, floor(offset), width, barThickness);
}

//barsVorizontal creates a set of vertical bands of varying colors that overlap to produce a composition
//the bands themselves are related by a rule (width 1, width 1 + width 2, width 2) defining their x coordinate at the corner
void barsVertical(float x,float offset){
  int barThickness = width/40;
  fill(0);
  noStroke();
  rect(floor(x), 0, barThickness, height);
  
  //this band has a unique color that is defined by a later function
  randomColor();
  noStroke();
  rect(floor(x + offset), 0, barThickness, height);
  
  fill(White);
  noStroke();
  rect(0, floor(offset), barThickness, height);
}


  //////////////////////////////////////////////////////////////////////////////////////////////



//intitiation of the designed functions begins after the draw function
void draw(){
}


//each click of the mouse adds one layer of composed random lines given by the two functions: barsHorizontal, and barsVertical
//the layers drawn overlap through transparency and retain the previous information
void mousePressed(){
  for(int count = 0; count < 1; count++){
    barsHorizontal(random(width), random(width));
    }
  for(int count2 = 0; count2 < 1; count2++){
    barsVertical(random(height), random(width));
  }
}


//responding the the randomColor request, this function provides three potential colors as the random palette
void randomColor(){
  int randomNum = floor(random(1,4));
  if(randomNum == 1){
    fill(Red);
  }
  if(randomNum == 2){
    fill(Blue);
  }
  if(randomNum == 3){
    fill(Yellow);
  }
}


