
//Setup backround to white, face to yellow, size of sketch, loads sound file into sketch
void setup() {
  size(450,400);
  int value = 0;
 background(255);
 noStroke();
 fill(255,222,0);
 ellipse(225, 200, 375, 375);
 fill(0);
 
  
}

void draw() {
  //happy expression
 if (keyPressed) {
   if (key == CODED) {
    if (keyCode == UP) 
    noStroke();
    fill(0);
     stroke(0);
    line(90,175,120,160);
    line(340,165,360,180);
    line(85,170,103,168);
    line(351,170,370,172);
    noStroke();
    ellipse(100,150,25,25);
    ellipse(350,150,25,25);
arc(225,175,100,200,0,PI);
  
   stroke(255,222,0);
   strokeWeight(2);
   noFill();
   arc(150, 425, 50, 200, PI+QUARTER_PI, PI+HALF_PI);
    noStroke();
    fill(255,222,0);
   ellipse(150,150,25,60);
    ellipse(300,150,25,60);
    rect(150, 350, 150, 8);
    
    

}
  } else {
    //neutral expression
   stroke(0);
   strokeWeight(2);
   noFill();
   arc(150, 425, 50, 200, PI+QUARTER_PI, PI+HALF_PI);
   noStroke();
    fill(0);
    ellipse(150,150,25,60);
    ellipse(300,150,25,60);
    rect(150, 350, 150, 8);
    fill(255,222,0);
    rect(125,110,200,25);
    ellipse(100,150,25,25);
    ellipse(350,150,25,25);
    arc(225,175,100,200,0,PI);;
 stroke(255,222,0);
line(90,175,120,160);
    line(340,165,360,180);
    line(85,170,103,168);
    line(351,170,370,172);

  }
}



