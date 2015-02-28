
int monsterX;
int monsterY;

void setup() {
  size(500, 500);
  monsterX = 250;
  monsterY = 100;

  
}


 
void draw() {
  
   monsterY = monsterY -1;
  monsterX = mouseX;

  background(255);
   
 
  //head
  stroke(0);
  strokeWeight(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(monsterX, monsterY, 200, 160);
   
   
  //eye
  stroke(0);
  strokeWeight(0);
  fill(255);
  ellipse(monsterX-50, monsterY-30, 40, 40);
   
  //eye
  stroke(0);
  strokeWeight(0);
  fill(255);
  ellipse(monsterX+50, monsterY-30, 40, 40);
   
  //pupil
  stroke(0);
  strokeWeight(0);
  fill(0);
  ellipse(monsterX-50,monsterY-30,20,20);
   
  //pupil
  stroke(0);
  strokeWeight(0);
  fill(0);
  ellipse(monsterX+50, monsterY-30, 20, 20);
   
   //mouth
  stroke(0);
  strokeWeight(0);
  fill(190,42,56);
  ellipse(monsterX, monsterY+20, 100, 60);
 
   
  //body
  stroke(0);
  strokeWeight(0);
  fill(0);
  ellipse(monsterX, monsterY+200, 250, 300);
   
   
  //bodyyellow
stroke(0);
strokeWeight(0);
fill(246,207,24);
ellipse(monsterX, monsterY+220, 200, 220);
   
   //body
  stroke(0);
  strokeWeight(0);
  fill(255);
  ellipse(monsterX, monsterY+240, 195, 220);
   
    //foot
  stroke(0);
  strokeWeight(0);
  fill(234, 126, 27);
  ellipse(monsterX+70, monsterY+355, 130, 30);
   
   //foot
  stroke(0);
  strokeWeight(0);
  fill(234,126,27);
  ellipse(monsterX-70, monsterY+355, 130, 30);
   
 //arm
stroke(0);
strokeWeight(30);
fill(0);
line(monsterX-195, monsterY+250, monsterX-75, monsterY+100);
 
//arm
stroke(0);
strokeWeight(30);
fill(0);
line(monsterX+205, monsterY+250, monsterX+75, monsterY+100);
  
 strokeWeight(0);
   
 
}

