
void setup () {

  size (600, 600);
  background(0);
}

void draw () {

//top left
  if ( (mouseX < 300) && (mouseY < 300) ) {
    fill(255, 255, 0);
  } 
  //top right
  else if ((mouseX > 300) && (mouseY < 300))  {
    fill(0, 255, 255);
  }
  //bottom left
  else if ((mouseX < 300) && (mouseY > 300)) {
   fill(255,0,0); 
  }
  //bottom right
  else if ((mouseX > 300) && (mouseY > 300)) {
   fill(0,200,0); 
  }


  rectMode(CENTER);
  rect (width/2, height/2, 300, 300);
  
  
  
}



