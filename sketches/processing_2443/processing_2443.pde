
boolean isDrawing = false;

//this is the setup wrapper. Anything in here happens once at the start of the program.

void setup() {
  size(500,500); //this is the size
  background(#bfd5dc); //this sets the background colour
  smooth();//this turns on smoothing to make the line smooth
  fill(0,0,0,50);
  
  
};

//this is the draw wrapper. Anything in here happens once per frame. 

void draw(){
  
 if (isDrawing){
  
  stroke(255,0,0,250);
  line(pmouseX,pmouseY,mouseX - random(-50,50),mouseY - random(-50,50));
  noStroke();
  fill(13,93,119,10);
  ellipse(mouseX - random(-50,50),mouseY - random(-50,50),90,90);
 };
  
};


void mousePressed(){
  isDrawing = !isDrawing;
};

