
Eye [] eyes= new Eye[100];


void setup(){
  size(600,600);
  smooth();

  for( int i=0; i<eyes.length; i++){
    
    eyes[i] = new Eye(random(0,width), random(0,height));
  }
}


void draw(){
background(64);
 for( int i=0; i<eyes.length; i++){
    eyes[i].draw();
    
}
}

class Eye{
  float x;
  float y;
  


Eye(float init_x, float init_y){
  x= init_x;
  y= init_y;
}
 void draw()
 {
  x =x + random(-2,2); 
  y =y + random(-2,2);  
  stroke(255,30);
  strokeWeight(1);
  line(300, height/2, x, y);
   
  pushMatrix();
  translate(x,y);
  
  noStroke();
  fill(255,40);
  ellipse(0,0,100,100);
  
  float angle = atan2(mouseY - y, mouseX - x);
  rotate(angle);
  
  line(0,0,50,0);
  
  translate(25,0);
  fill(255,40);
  ellipse(0,0,50,50);
  

  popMatrix(); 
 } 
 
  
}





