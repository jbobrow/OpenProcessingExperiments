

int height= 50;

void setup (){
  size (400,400);
background (255);
}

void draw(){
  if (mousePressed==false) {
    noStroke();
    fill(height, mouseX, mouseY, 50);
    rect(mouseX, mouseY, height, mouseY);
  } else  {  
    background( 255);
  }
}




