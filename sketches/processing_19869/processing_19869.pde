
PFont font; //declare variable of Pfont 

void setup(){
  size(250, 250);
  font= loadFont ("Futura-Medium-48.vlw");
  textFont(font); //variable font current and active
  background(255);
  smooth();
  noStroke();
  textAlign(CENTER);
  textSize(10);
}

void draw() {
  if (mousePressed)
  {
    float n = dist(width,height,mouseX,mouseY);
    //boundaries of float distance is within width and height of sketch
    // and is active(mouse pressed) within x and y boundaries^^
    text("L5V2M2", mouseX, mouseY, n/2, n/2);//mouse hovers  
    
    if((mouseX<125)&(mouseY<125))
    
    {
      fill(random(98), random(134), random(82), 15);//colours
    }
  }
  
}

    
  


