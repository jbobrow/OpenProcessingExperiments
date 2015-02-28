
PImage img0; 
PImage img1;
PFont myFont;

void setup(){
  size(400,400);
  img0 = loadImage("1.png");
  img1 = loadImage("a.png");
  smooth();
  noCursor();
  stroke(50);
  ellipseMode(CENTER);
  textAlign(CENTER);
  rectMode(CENTER);
  myFont = createFont("BLANCH_CAPS.otf",50);
  textFont(myFont);
  text("SEEDS");
}

void draw(){
  image(img0, 0, 0, 400, 400);
  
  noStroke();
  translate(mouseX, mouseY);
  rotate( mousePressed?-HALF_PI:0 );
  
  fill(255, 255, 200);
  rect(0, 0, 85, 120);
  
  fill(150, 100, 50);
  text("SEEDS", 0, 5);
  
  stroke(150, 100, 50, 200);
  strokeWeight(2);
  line (-38, -30, 38, -30);
  line (-38, 15, 38, 15);
  ellipse(-5, 30, 10, 10);
  ellipse(5, 30, 10, 10);
  triangle(-9, 33, 9, 33, 0, 42);
  
  if (mouseX > 0 && mouseX < 400 && mouseY > 20 && mouseY < 200){
    if (mousePressed == true){  
      noStroke();
      
      fill(20, 200, 125);
      ellipse(-175, -80, 40, 40);
      ellipse(-175, -40, 40, 40);
      triangle(-157, -90, -193, -90, -175, -125);
      triangle(-157, -31, -193, -31, -175, 5);
      strokeWeight(5);
      stroke(20, 200, 125);
      line(-175, -60, -220, -60);
      stroke(255, 50);
      strokeWeight(2);
      line(-175,-90,-175, -30);
      
      noStroke();
       fill(150, 100, 50);
      rotate( mousePressed?+HALF_PI:0);
      arc(-60, 245, 60, 60, -PI, 0);
    }
  }
}






