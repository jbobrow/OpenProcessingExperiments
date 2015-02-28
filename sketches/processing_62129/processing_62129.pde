
void setup(){ 
  size(400,400);
  rectMode(CENTER);
  ellipseMode(CENTER);
  background(200);
  noCursor();
}

void draw() {


  if(mousePressed){
   strokeWeight(5);
   stroke(255);
   fill(160,2,12, 20);
   ellipse(200, 200, mouseX *2, mouseY/2);
   
   
  }else{
   stroke(255,252,152,60);
   strokeWeight(3);    
   frameRate(60);  
   fill(156,106,245,60);
   ellipse(mouseY, mouseY, mouseX /10, mouseX/5); 

   stroke(152,255,153,60);
   strokeWeight(3);    
   frameRate(60);  
   fill(255,252,152,60);
   ellipse(mouseX * 1/2, mouseY, mouseX/2, mouseY); 

   stroke(189,152,255,60);
   strokeWeight(3);    
   frameRate(60);  
   fill(152,255,153,60);
   ellipse(mouseX, mouseY* 1/2, mouseX /2, mouseX/4); 

  }
}


