
class Jar{

  //Data
  float xpos;
  float ypos;
  float w;
  color lidc;
  
  //Constructor - setup function establishes what its born with
  Jar(float tempX, float tempY, int tempC, float tempW){
    xpos = tempX;
    ypos = tempY;
    w = tempW;
    lidc = tempC;
    
  }

  //Functionality or 'methods'
  void update(){
  //update
  //x = 72;
  //y = 100;  
  
}

  //Puts object on screen
  void display(){
  stroke(0);
  rectMode(CENTER);
  rect(xpos, 100, w, 86);
  strokeWeight(4);
  fill(lidc, 100, 100);
  ellipse(xpos, ypos-40, w, 23);
  fill(255);
  strokeWeight(1);
  ellipse(xpos, ypos+40, w, 25);  
}
}

