
boolean isDrawing = false;

//this is the setup wrapper. Anything in here happens once at the start of the program.

void setup() {
  size(500,500); //this is the size
  background(#414e12); //this sets the background colour
  smooth();//this turns on smoothing to make the line smooth
  fill(0,0,0,50);
  
  
};

//this is the draw wrapper. Anything in here happens once per frame. 

void draw(){
  
 if (isDrawing){
  
  noStroke();
  fill(51,236,248,20);
  rect(pmouseX,pmouseY,10,mouseY - random(-150,150));
  noStroke();
  fill(246,248,51,10);
  rect(mouseX - random(-50,50),mouseY - random(-50,50),10,mouseY - random(-30,30));
  noStroke();
  fill(19,38,6,60);
  rect(mouseX - random(-20,50),mouseY - random(-20,70),8,mouseY - random(-200,200));

 };
  
};


void mousePressed(){
  isDrawing = !isDrawing;
};

