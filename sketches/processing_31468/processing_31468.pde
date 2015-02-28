
void setup(){
 
  size(500,500);
  background(0);
  
  stroke(255);
  smooth();
 
  ellipse(200,220,100,100);
  ellipse(300,220,60,60);
  
  noStroke();
  fill(0);
  ellipse(180,220,20,20);
  ellipse(310,240,20,20);
  
  stroke(1);
  fill(255);
  arc(250,280,250,280,PI*2, PI*3);
  
  
  fill(255);
    ellipse(30,20,30,30);
    ellipse(70,20,30,30);
    fill(255,6,0);
    bezier(0,50,25,100,75,100,100,50);
  
  fill(0);
  ellipse(30,20,20,20);
  ellipse(70,20,10,10);
  
}

