
//assignment 3: patterns
//yssa badiola
//in which Yssa has NO IDEA what to do

void setup(){
  size(800,600);
  smooth();
}

void draw(){
  background(0);
  //forest
  for (int x = 0; x < width; x+=10){
    for (int y=0; y < height; y+=10){
      if(x%10 == 0 && y%10 == 0){
        fill(40,219,35,75);
        triangle(x,y,x+10,y+5,x+20,y+50);
        if(dist(mouseX,mouseY,x,y)<15){
          fill(255,255,255,95);
          noStroke();
          float ellSize = map(mouseY,0,height,80,30);
          ellipse(x,y,ellSize,ellSize);
        }
      }
    }
  }
  if(mouseX == 602 && mouseY == 478){
  //fionna
  fill(255);
  stroke(0);
  strokeWeight(1);
  beginShape();
  vertex(589,482);
  vertex(600,482);
  vertex(600,468);
  vertex(598,468);
  vertex(598,473);
  vertex(591,473);
  vertex(591,468);
  vertex(589,468);
  endShape();
  //cake
  beginShape();
  vertex(604,482);
  vertex(612,482);
  vertex(612,475);
  vertex(610,472);
  vertex(609,475);
  vertex(607,475);
  vertex(606,472);
  vertex(604,475);
  endShape();
  }
  
  
  fill(255);
  textAlign(CENTER);
  text("IT'S NIGHT TIME, BUT FIONNA AND CAKE ARE MISSING!",width/2,20);
  text("Use the flashlight to find them!",width/2, 35);
  println("x:" +mouseX + "y:" +mouseY);
}













//it's a bit tricky
//you need a specific coordinate!
























//602,478

