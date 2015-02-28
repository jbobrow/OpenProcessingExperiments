
//Mandala by Luis Silva

PImage photo1;
PImage photo2;
PImage photo3;
PImage photo4;
PImage photo5;

//setup
void setup(){
  size(1000,1000);
  photo1 = loadImage("bobomb.png");
  photo2 = loadImage("whomp.jpg");
  photo3 = loadImage("cool.jpg");
  photo4 = loadImage("tiny.jpg");
  photo5 = loadImage("mario.png");
}

void draw(){
  background(50);
  //Grid 
    strokeWeight(1);
    stroke(255);
    //x
    line(0, 100, 1000, 100);
    line(0, 200, 1000, 200);
    line(0, 300, 1000, 300);
    line(0, 400, 1000, 400);
    line(0, 500, 1000, 500);
    line(0, 600, 1000, 600);
    line(0, 700, 1000, 700);
    line(0, 800, 1000, 800);
    line(0, 900, 1000, 900);
    //y
    line(100, 0, 100, 1000);
    line(200, 0, 200, 1000);
    line(300, 0, 300, 1000);
    line(400, 0, 400, 1000);
    line(500, 0, 500, 1000);
    line(600, 0, 600, 1000);
    line(700, 0, 700, 1000);
    line(800, 0, 800, 1000);
    line(900, 0, 900, 1000);

//Mandala
//Floor Tile
  rectMode(CORNER);
  noStroke();
  fill(255); //white
  rect(200, 0, 100, 100);
  rect(700, 100, 100, 100);
  rect(0, 200, 100, 100);
  rect(200, 200, 100, 100);
  rect(800, 200, 100, 100);
  rect(100, 300, 100, 100);
  rect(700, 300, 100, 100);
  rect(900, 300, 100, 100);
  rect(0, 400, 100, 100);
  rect(200, 400, 100, 100);
  rect(800, 400, 100, 100);
  rect(100, 500, 100, 100);
  rect(700, 500, 100, 100);
  rect(900, 500, 100, 100);
  rect(0, 600, 100, 100);
  rect(200, 600, 100, 100);
  rect(800, 600, 100, 100);
  rect(100, 700, 100, 100);
  rect(700, 700, 100, 100);
  rect(900, 700, 100, 100);
  rect(200, 800, 100, 100);
  rect(700, 900, 100, 100);
  
  fill(0); //black
  rect(700, 0, 100, 100);
  rect(200, 100, 100, 100);
  rect(100, 200, 100, 100);
  rect(700, 200, 100, 100);
  rect(900, 200, 100, 100);
  rect(0, 300, 100, 100);
  rect(200, 300, 100, 100);
  rect(800, 300, 100, 100);
  rect(100, 400, 100, 100);
  rect(700, 400, 100, 100);
  rect(900, 400, 100, 100);
  rect(0, 500, 100, 100);
  rect(200, 500, 100, 100);
  rect(800, 500, 100, 100);
  rect(100, 600, 100, 100);
  rect(700, 600, 100, 100);
  rect(900, 600, 100, 100);
  rect(0, 700, 100, 100);
  rect(200, 700, 100, 100);
  rect(800, 700, 100, 100);
  rect(700, 800, 100, 100);
  rect(200, 900, 100, 100);

//Carpet
  rectMode(CORNER);
  noStroke();
  fill(217, 7, 16);
  rect(300, -100, 400, 2000);
  //
  stroke(250, 248, 7);
  strokeWeight(5);
  line(325, 0, 325, 1000);
  line(675, 0, 675, 1000);

//Center Circle
  fill(1, 2, 84);
  stroke(250, 248, 7);
  strokeWeight(30);
  ellipse(500, 500, 600, 600);
    //Rays
    strokeWeight(10);
    //Inside Rays (CLOCKWISE)
    stroke(176, 19, 250);
    fill(176, 19, 250);
    triangle(500, 400, 700, 300, 600, 500);
    triangle(600, 500, 700, 700, 500, 600);
    triangle(500, 600, 300, 700, 400, 500);
    triangle(400, 500, 300, 300, 500, 400); 
    //Outside Rays (CLOCKWISE)
    stroke(227, 45, 6);
    fill(227, 45, 6);
    triangle(400, 400, 500, 200, 600, 400);
    triangle(600, 400, 800, 500, 600, 600);
    triangle(600, 600, 500, 800, 400, 600);
    triangle(400, 600, 200, 500, 400, 400);
  //Inside Circle
    fill(250, 248, 7);
    stroke(227, 45, 6);
    ellipse(500, 500, 300, 300);  
  //Center Cirle's Stroke
  noFill();
  stroke(250, 248, 7);
  strokeWeight(30);
  ellipse(500, 500, 600, 600);
  
//Boxes
//1
  rectMode(CENTER);
  stroke(84, 161, 67);
  strokeWeight(10);
  fill(143, 210, 239);
  rect(100, 100, 200, 200);
//2
  fill(143, 210, 239);
  rect(900, 100, 200, 200);

//3
  fill(143, 210, 239);
  rect(100, 900, 200, 200);
//4
  fill(143, 210, 239);
  rect(900, 900, 200, 200);
  
//Paintings
//1
      if (keyPressed){
    if (key == '1'){
    image(photo1, 0, 0);
  } else {
    fill(143, 210, 239);
  }
}
//2
      if (keyPressed){
    if (key == '2'){
    image(photo2, 800, 0);
  } else {
    fill(143, 210, 239);
  }
}
//3
      if (keyPressed){
    if (key == '3'){
    image(photo3, 0, 800);
  } else {
    fill(143, 210, 239);
  }
}
//4
      if (keyPressed){
    if (key == '4'){
    image(photo4, 800, 800);
  } else {
    fill(143, 210, 239);
  }
}
//Cursor
  image(photo5, mouseX, mouseY);
}



