
//Streetlights

void setup(){
  
  size(900,900);
  background(0,0,0);
}
void draw() 
{
  fill(0,0,0,30);
  rect(0,0,900,900);
  
  if(frameCount <30)return;
  line(200, 200, mouseX, mouseY);
  
  //White lights
  noStroke();
  fill(255, 255,255, 30);
  ellipse(random(0, 900), random(400,450), 90, 90);
  
  //Large White lights
  noStroke();
  fill(255, 255,255, 10);
  ellipse(random(0, 900), random(400,450), 160, 160);
  
  //Gold lights
   noStroke();
  fill(255, 160, 64, 60);
  ellipse(random(0, 900), random(430,450), 60, 60);
  
  //Red lights
   noStroke();
  fill(255, 64, 64, 40);
  ellipse(random(0, 900), random(410,450), 30, 30);
  
  //Cyan lights
   noStroke();
  fill(63, 236,250, 15);
  ellipse(random(0, 900), random(400,450), 40, 40);
  
    //Cyan lights
   noStroke();
  fill(63, 236,250, 15);
  ellipse(random(0, 900), random(400,450), 40, 40);
}               
