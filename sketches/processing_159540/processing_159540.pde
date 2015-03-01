
float x = 0.0;
int myCount;

void setup(){
  size(590,460);
  background(255,100,150); 
  ellipseMode(CENTER); 
   
  myCount = 0;
}
 
void draw() { 
   
   if (mousePressed) {
   background(255,100,150);

   myCount = 0;  
}
 
  frameRate(40);
  background (255,100,150);
  
  stroke(240); 
  fill(random(240));
  ellipse (100,100,50,50); 
  
  stroke(240);
  fill(random(240));
  ellipse(230,100,50,50);
  
  stroke(240);
  fill(random(240));
  ellipse(360,100,50,50);
  
  stroke(240);
  fill(random(240));
  ellipse(490,100,50,50);
  
  stroke(240);
  fill(random(240));
  ellipse(100,230,50,50);
  
  stroke(240);
  fill(random(240));
  ellipse(230,230,50,50);
  
  stroke(240);
  fill(random(240));
  ellipse(360,230,50,50);
  
  stroke(240);
  fill(random(240));
  ellipse(490,230,50,50);
  
  stroke(240);
  fill(random(240));
  ellipse(100,360,50,50);
  
  stroke(240);
  fill(random(240));
  ellipse(230,360,50,50);
  
  stroke(240);
  fill(random(240));
  ellipse(360,360,50,50);
  
  stroke(240);
  fill(random(240));
  ellipse(490,360,50,50);
  
  stroke(255);
  strokeWeight(10);
  
  if(x < 250) 
  {
     x += 2; 
  }
  else
  {
     x = 0;
  }
  
}


