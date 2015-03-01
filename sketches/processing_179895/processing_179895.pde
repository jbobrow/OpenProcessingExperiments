
float noiseX, noiseY;
float positionX, positionY;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(0);  //set background white
  
  noiseX = random(50);
  noiseY = random(150);
  
  positionX = 170;
  positionY = 170; 
 
}

void draw() {  //draw function loops 
  pushMatrix();
  scale(1);
  
  noStroke();
  fill(0,15);
  rect(0,0,width,height);
  
  noiseX += 0.05;
  noiseY += 0.05;
  positionX += map(noise(noiseX, 5, 15),0,1 ,-5,6);
  positionY += map(noise(noiseY, 55, 35),0,1,-5,6);
  
  if (positionX < 0 ) { positionX = width;}
  if (positionX > width){ positionX = 0;}
  if (positionY < 0 ) { positionY = height;}
  if (positionY > height) { positionY = 0;}
  popMatrix();
  
  
  
  translate(positionX,positionY);
  
  pushMatrix();
  pushStyle();
  
  scale(0.25);
  fill(255);
  noStroke();
   
  ellipse(150,100,160,160);
   
  rect(70,100,160,150);
   
   
  triangle(70,250,90,250,80,275);
  triangle(90,250,110,250,100,275);
  triangle(110,250,130,250,120,275);
  triangle(130,250,150,250,140,275);
  triangle(150,250,170,250,160,275);
  triangle(170,250,190,250,180,275);
  triangle(190,250,210,250,200,275);
  triangle(210,250,230,250,220,275);
   
  fill(0);
   
  ellipse(110,100,40,40);
  ellipse(190,100,40,40);
   
  fill(255);
   
  float dx = map(mouseX,0,width,-5,5);
  float dy = map(mouseY,0,height,-5,5);
   
  ellipse(110+dx,100+dy,3,24);
  ellipse(190+dx,100+dy,3,24);
   
   
  fill(0);
  ellipse(150,150,50,noise(noiseX,1,25)*20+5);

  
  
  popStyle();
  popMatrix();
  
  
}
