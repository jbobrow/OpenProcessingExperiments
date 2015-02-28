
void setup () {
  size(500,500); 
}



void draw () {
  for (int mouseX=10; mouseX<500; mouseX+=10) {
    for (int mouseY=10; mouseY<500; mouseY+=10){
    fill(mouseX,mouseY,0);
    quad(mouseX,mouseY, 10,20, 20,30, 30,40);
    }
  }
   
}

void mousePressed () {
  println("pressed mousey");
  rect(mouseX, mouseY, 10, 10);
}

