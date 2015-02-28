
int monsterY = 500;

void setup() {
  size(500, 500);
}

void draw() {
  
  monsterY--;
  background(0,0,0);
  
  //Het hoofd
  noStroke();
  fill(255, 218, 0);
  ellipseMode(CENTER);
  ellipse(mouseX-0, monsterY+5, 200, 200);

  //mond
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(mouseX-0, monsterY+25, 140, 90);
  
  //monde
  fill(255, 218, 0);
  ellipseMode(CENTER);
  ellipse(mouseX-0, monsterY+5, 150, 55);

  //rechter oog
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(mouseX+30, monsterY-20, 40, 60);

  fill(255, 218, 0);
  noStroke();
  //                1ste punt           2e punt            3e punt
  triangle(mouseX+25,monsterY-10, mouseX+55,monsterY-5, mouseX+55,monsterY-20);

  //linker oog
  fill(0, 0, 0);
  ellipseMode(CENTER);
  ellipse(mouseX-30, monsterY-20, 40, 60);
  
  fill(255, 218, 0);
  noStroke();
  //                1ste punt           2e punt            3e punt
  triangle(mouseX-25,monsterY-10, mouseX-50,monsterY-5, mouseX-50,monsterY-20);
  


  println("Dit is mijn poppetje");
}

