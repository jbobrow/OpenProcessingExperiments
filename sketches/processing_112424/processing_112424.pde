
void setup(){
  size (600,600);
  background(180,180,180);
  
}


void draw(){
  background(180,180,180);
  //noStroke();
  fill(29,52,23);
  stroke(mouseY,56,244);
  strokeWeight(5);
  line(200,300,250,250);
  line(300,250,350,300);
  line(250,250,300,250);
  line(275,190,275,290);
  line(250,210,250,280);
  line(300,210,300,280);
  noStroke();
  fill(44,7,7);
  rect(260,mouseY,20,20);
  rect(255,mouseY+30,20,20);
  rect(270,mouseY+60,20,20);
  fill(mouseY,56,244);
  rect(100,350,20,60);
  rect(450,350,20,60);
  rect(100,100,60,20);
  rect(470,100,-60,20);
  stroke(0,0,0);
  strokeWeight(5);
  line(100,300,100,190);
  line(470,300,470,190);
 
  
  
  
  
  }


