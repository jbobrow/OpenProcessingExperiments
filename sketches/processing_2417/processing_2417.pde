
void setup() {
  size(500,500); //this is the size
  background(#673576); //this sets the background colour
  smooth();//this turns on smoothing to make the line smooth
  
  
  
  
};

//this is the draw wrapper. Anything in here happens once per frame. 

void draw(){
  stroke(125,64,140,40);
  line(250,250,mouseX,mouseY);
  fill(195,74,141,20);
  ellipse(mouseX,mouseY,random (30,120), random(30,120));
  stroke(255,100,40,40);
  line(250,250,mouseX/1.7,mouseY/1.7);
  fill(232,238,130,20);
  ellipse(mouseX/1.7,mouseY/1.7,10,10);
  
  
};

