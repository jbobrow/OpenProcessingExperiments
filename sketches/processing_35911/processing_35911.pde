
int mysize = 100;
float ypos = 100;
float xpos = 350;
float weight = 10;
float ease = 0;

void setup() {
  size(700,400);
  background(255);
  
}

void draw(){
  smooth();
  background(0);
  strokeWeight(2);
  stroke(65,151,232);
  fill(65,151,232,65);
  ellipse(xpos,ypos,mysize,mysize);
stroke(255,0,0);



    xpos = xpos + (mouseX - xpos)/(weight + ease);
    ypos = ypos + (mouseY - ypos)/(weight + ease);
    
    
    if (mousePressed && (mouseButton == LEFT)){
      weight = 80;}
      
    if (mousePressed && (mouseButton == RIGHT)){
      weight = 2;}



 

}


