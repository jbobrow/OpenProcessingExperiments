
int across = 600, down = 400;
int switchDir;
int speed = 1;
int y = 100;

void setup(){
  
  size (across, down);
  
}

void draw (){
  background(#5ADED1);
  fill(#F5E065);
  stroke(#F5E065);
  strokeWeight(6);
  
  noFill();
  arc(185, 400, 350, 550, PI, PI+QUARTER_PI);
  
  fill(#F5E065);
  ellipse(78,190,100,100);
  
  fill(#5ADED1);
  noStroke();
  rect(70, 120, 20, 200);
  rect(0, 180, 200, 20);
  
  fill(#F5E065);
  ellipse(78,190,20,20);

  //Movable A
  pushMatrix();
  translate(mouseX, 0);
  fill(#F5E065);
  ellipse(-420,190,100,100);
  
  fill(#5ADED1);
  noStroke();
  rect(-430, 120, 70, 150);
  rect(0, 180, -520, 20);
  rect(0, 100, -520, 100);
  
  fill(#F5E065);
  ellipse(-420,190,20,20);

  //As
  arc(5, 150, 80, 80, HALF_PI, PI);
  arc(-145, 150, 80, 80, HALF_PI, PI);
  arc(-270, 150, 80, 80, HALF_PI, PI);
  
  popMatrix();
  
  
  if(y >= height-190){
    switchDir = 1;
  }
  if (y <= -150){
    switchDir = 0;
  } 
  if(switchDir == 0){
    y += speed;
  }else y-= speed;
  
  pushMatrix();
  translate(0, y);
  stroke(#F5E065);
  strokeWeight(4);
  //M
  line(250,190,250,150);
  line(250,150,270,170);
  line(270,170,290,150);
  line(290,150,290,190);
  
  //N
  line(380,190,380,150);
  line(380,150,400,190);
  line(400,190,400,150);
  
  //D
  line(420,190,420,150);
  line(420,150,450,170);
  line(450,170,420,190);
  
  popMatrix();
  
}
