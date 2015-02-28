
void setup(){ 
  size(400,400);
  rectMode(CENTER);
  ellipseMode(CENTER);
//  background(200);
  noCursor();
}

void draw() {


  if(mousePressed){
   strokeWeight(10);
   stroke(0);
   frameRate(3);
   fill(0, 100);
   rect(mouseX, mouseY, 50, 50);
  }else{
   stroke(255,80);
   strokeWeight(3);    
   frameRate(60);  
   fill(0,5);
   ellipse(mouseX, mouseY, mouseX /10, mouseX/5); 

   stroke(255,80);
   strokeWeight(3);    
   frameRate(60);  
   fill(0,5);
   ellipse(mouseX * 1/2, mouseY * 1/2, mouseX /4, mouseX/8); 

   stroke(0,5);
   strokeWeight(3);    
   frameRate(60);  
   fill(255,90);
   ellipse(mouseX * 1/2, mouseY, mouseX /5, mouseX/10); 

   stroke(0,10);
   strokeWeight(3);    
   frameRate(60);  
   fill(255,60);
   ellipse(mouseX, mouseY* 1/2, mouseX /2, mouseX/4); 

  }
}


