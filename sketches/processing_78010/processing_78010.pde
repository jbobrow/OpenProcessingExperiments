
int tamany = 25;

void setup (){
  size (500,500);
  background (0);
}

void draw (){
  if (keyPressed == true) {
     fill(0);
     tamany = tamany + 10;
     
  } else {
     fill (int(random(255)),int(random(255)),int(random(255)));
     tamany = tamany - 10;
  }
  
  rect (mouseX, mouseY, int (random(20)), tamany);
  
}


