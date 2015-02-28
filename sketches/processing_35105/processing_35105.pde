
void setup(){
  size(200,200);
}


void draw(){
  background(144,mouseY,230);
  smooth();
  strokeWeight(4);
  line(width/2, height/2,width/2,-mouseY);
  
  ellipseMode(CENTER);
  fill(243,247,50);
  ellipse(width/2,height/2,-mouseY,-mouseY);
  
  strokeWeight(1.5);
  fill(0);
  rect(50,50,20,20);
  rect(130,50,20,20);
  ellipse(width/2,height/2, 20,20);
  arc(width/2,120,40,40,0, PI);  

}  

