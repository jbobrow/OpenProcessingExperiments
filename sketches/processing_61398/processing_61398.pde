
float r;

void setup(){
  size(400,400);
  background(80,80,80);
  smooth();
  
}

void draw(){
  background(80,80,80);
  
  r = random(50,60);
  
  stroke(0);
  strokeWeight(3);
  line(0,0,mouseX,mouseY); 
  
  stroke(0);
  strokeWeight(3);
  line(400,0,mouseX,mouseY); 
  
  stroke(0);
  strokeWeight(3);
  line(0,400,mouseX,mouseY); 
  
  stroke(0);
  strokeWeight(3);
  line(400,400,mouseX,mouseY); 

  strokeWeight(10);
  ellipse(mouseX,mouseY,120,120);
  strokeWeight(3);
  ellipse(mouseX,mouseY,r,r);
  fill(0,70,150);
  
  
  triangle(160, 10, 200, 25, 240, 10); //ue
  triangle(390, 160, 375, 200, 390, 240); //hidari
  triangle(10, 160, 25, 200, 10, 240); //migi
  triangle(160, 390, 200, 375, 240, 390); //shita
  
  line(10,160,160,10);
  line(240,10,390,160);
  line(390,240,240,390);
  line(160,390,10,240);
	

  


}

  
  

