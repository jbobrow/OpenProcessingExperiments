
//copy info from another image
PImage myImg;

//it takes the w and h parameters of myImg
int w;
int h;

void setup(){
  //image
  myImg = loadImage("landscape (1).jpg");
  
  w = myImg.width; //The point asks what is the width of this image
  h = myImg.height;
  
  //SIZE  takes the w and h parameters of myImg
  size(w, h*2);
  
}

void draw(){
  image(myImg, 0,0);
  //Copies the upper left corner
  copy(myImg, 0, 0, 100, 50, 0, 400, 100, 50);
  
  //Copies part of the mountains
  copy(myImg, 300, 300, 100, 50, 0, 450, 100, 50);
  
  //Copies based on the mouse position
  copy(myImg, mouseX, mouseY, 100, 50, 0, 500, 400, 200); //the last two positions in this example are changing the size and magnifying gthe selected area.
  noFill();
  stroke(255);
  rect(mouseX, mouseY, 100, 50);
  
  //PRINTS the value
  println("The w is: " + w + " The h is " + h);
}


