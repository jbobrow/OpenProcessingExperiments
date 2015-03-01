
void setup(){
  size(400,400);
  background(40,80,100);
}

void draw(){
  
  fill(125,10);
  noStroke();
  rect(0,0,width,height);
  
  fill(254,246,104);
  stroke(50);
  strokeWeight(3);
  ellipse(200,250,mouseX,mouseY);
 
  fill(255);
  strokeWeight(2);
  ellipse(150,200,50,50);
  ellipse(250,200,50,50);
  
  float a=0.02;
  noStroke();
  fill(0);
  ellipse(150 + mouseX*a,170+ mouseY*a,70,20);
  ellipse(250+ mouseX*a,170+ mouseY*a,70,20);
  
  if(mouseX>width/2 ||mouseY<height/2){
  fill(0);
  ellipse(150,200,10,10);
  ellipse(250,200,10,10);
  }
   
  stroke(223,0,36);
  strokeWeight(10);
  fill(100,45,35);
  rect(160,250,80,80);
  
  noStroke();
  fill(0,150,241);
  ellipse(200,290,20,30);
}
  void mouseDragged(){
  stroke(107,226,234);
  strokeWeight(4);
  line(200,290,mouseX,mouseY); 
}
 
