
int bgcolor = 255;

void setup() {
  size(500, 500);
}

void draw() {
 
//colorMode(HSB);
  
  background(bgcolor, bgcolor, bgcolor);
  
  //background transition
  if(mouseX > width/2) {
    bgcolor = bgcolor + 1;
  }
  
  if(mouseX < width/2){
    bgcolor = bgcolor - 1;
  }
  
  //Het hoofd
  noStroke();
  fill(255, 218, 0);
  ellipseMode(CENTER);
  ellipse(mouseX-0, mouseY, 200, 200);

  //mond
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(mouseX-0, mouseY+25, 140, 90);
  
  //monde
  fill(255, 218, 0);
  ellipseMode(CENTER);
  ellipse(mouseX-0, mouseY+5, 150, 55);

  //rechter oog
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(mouseX+30, mouseY-20, 40, 60);

  fill(255, 218, 0);
  noStroke();
  //                1ste punt           2e punt            3e punt
  triangle(mouseX+25,mouseY-10, mouseX+55,mouseY-5, mouseX+55,mouseY-20);

  //linker oog
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(mouseX-30, mouseY-20, 40, 60);
  
  fill(255, 218, 0);
  noStroke();
  //                1ste punt           2e punt            3e punt
  triangle(mouseX-25,mouseY-10, mouseX-50,mouseY-5, mouseX-50,mouseY-20);
  


  println("Dit is mijn poppetje");
}

