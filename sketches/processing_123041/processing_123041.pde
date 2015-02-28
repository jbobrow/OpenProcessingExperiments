
int monsterY;

void setup() {
  size(500,500);
  monsterY = 500;
}

void draw() {
  //lichaam
  background(255);
  rectMode(CENTER) ;
  stroke(0);
  fill(22,84,186);
  ellipse(mouseX-25,monsterY+35,30,15);
  ellipse(mouseX+25,monsterY+35,30,15);
  
  //gezicht
  fill(22,84,186);
  ellipse(mouseX,monsterY,100,75);

  //ogen
  fill(255);
  ellipse(mouseX-25,monsterY-25,25,40);
  
  fill(255);
  ellipse(mouseX+25,monsterY-25,25,40);
  
   //binnenogen
  fill(0,255,0);
  ellipse(mouseX-25,monsterY-25,15,15);
  
  fill(0,255,0);
  ellipse(mouseX+25,monsterY-25,15,15);
  
  //pupillenogen
  fill(0);
  ellipse(mouseX-25,monsterY-25,5,5);
  
  fill(0);
  ellipse(mouseX+25,monsterY-25,5,5);

  //mond
  fill(255);
  rect(mouseX,monsterY+15,50,1);
  
  //tand
  fill(255);
  triangle(mouseX+5,monsterY+15,mouseX+15,monsterY+15,mouseX+10,monsterY+25);
  
  fill(255);
  triangle(mouseX-15,monsterY+15,mouseX-5,monsterY+15,mouseX-10,monsterY+25);
  
  monsterY = monsterY - 1;
 
  }
  
