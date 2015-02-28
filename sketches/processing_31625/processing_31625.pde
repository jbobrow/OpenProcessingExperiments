



int patternSeperationX = 125;
int patternSeperationY = 75;

void setup(){
  size(500,500);
  background(0);
  smooth();
  
  
  for(int i = 0; i < width/patternSeperationX; i++){
 for(int j = 0; j < height/patternSeperationY; j++){
   pushMatrix();
   translate(i*patternSeperationX, j*patternSeperationY);
   yourFunction();
   popMatrix();
 
  
   
  }
}
}

void yourFunction(){
  scale(random(1.2));
  for(int i = 20; i<width; i+=20){
ellipse (i,height/2,2,2);
strokeWeight(1);
stroke(255,random(25));
line(100,100,100,200);


strokeWeight(1);
stroke(255,random(50));
line(25,25,25,200);

strokeWeight(1);
stroke(255,random(25));
line(50,50,50,500);

strokeWeight(1);
stroke(255,random(50));
line(100,100,100,500);
 
 
 scale(random(2));
  noStroke();
  smooth();
  fill(255,random(10));
  ellipse(50,50,50,100);
  
  
  noStroke();
  smooth();
  fill(68,93,102,random(70));
  ellipse(50,50,50,50);
  
  noStroke();
  smooth();
  fill(143,152,176,random(70));
  ellipse(50,0,50,50);
  
  noStroke();
  smooth();
  fill(143,152,176,random(70));
  ellipse(50,100,50,50);
  
  noStroke();
  smooth();
  fill(115,113,128,random(70));
  ellipse(5,25,50,50);
  
  noStroke();
  smooth();
  fill(115,113,128,random(70));
  ellipse(95,75,50,50);
  
  noStroke();
  smooth();
  fill(48,54,57,random(70));
  ellipse(5,75,50,50);
  
  noStroke();
  smooth();
  fill(48,54,57,random(70));
  ellipse(95,25,50,50);
  
  scale(random(0.5));
  rotate(random(360));
   noStroke();
  smooth();
  fill(68,93,102,random(128));
  ellipse(50,50,50,50);
  
  noStroke();
  smooth();
  fill(143,152,176,random(128));
  ellipse(50,0,50,50);
  
  noStroke();
  smooth();
  fill(143,152,176,random(128));
  ellipse(50,100,50,50);
  
  noStroke();
  smooth();
  fill(115,113,128,random(128));
  ellipse(5,25,50,50);
  
  noStroke();
  smooth();
  fill(115,113,128,random(128));
  ellipse(95,75,50,50);
  
  noStroke();
  smooth();
  fill(48,54,57,random(128));
  ellipse(5,75,50,50);
  
  noStroke();
  smooth();
  fill(48,54,57,random(128));
  ellipse(95,25,50,50);
  
 
  strokeWeight(2);
  smooth();
  noFill();
  stroke(68,93,102);
  ellipse(50,50,50,50);
  
  strokeWeight(2);
  smooth();
  noFill();
  stroke(143,152,176);
  ellipse(50,0,50,50);
  
  strokeWeight(2);
  smooth();
  noFill();
  stroke(143,152,176);
  ellipse(50,100,50,50);
  
  strokeWeight(2);
  smooth();
  noFill();
  stroke(115,113,128);
  ellipse(5,25,50,50);
  
  strokeWeight(2);
  noFill();
  smooth();
  stroke(115,113,128);
  ellipse(95,75,50,50);
  
  strokeWeight(2);
  noFill();
  smooth();
  stroke(48,54,57);
  ellipse(5,75,50,50);
  
 strokeWeight(2);
  noFill();
  smooth();
  stroke(48,54,57);
  ellipse(95,25,50,50);
  
  strokeWeight(1);
  stroke(255,random(25));
  line(10,10,10,80);
  
  noStroke();
  smooth();
  fill(255,random(128));
  ellipse(75,175,15,15);
  
   noStroke();
  smooth();
  fill(255,random(128));
  ellipse(175,200,15,15);
  
  noStroke();
  smooth();
  fill(115,113,128,random(128));
  ellipse(200,150,20,20);
  
  noFill();
  strokeWeight(1);
  stroke(255,random(250));
  triangle(100, 100, 200,100,150,150);
  
  noFill();
  strokeWeight(1);
  stroke(255,random(128));
  triangle(200,200,300,150,80,80);
  
  
  noFill();
  strokeWeight(1);
  stroke(255,random(128));
  triangle(400,500,350,280,180,170);
}

}


