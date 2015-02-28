
int rosso = int(random(0, 255));
int verde = int(random(0, 255));
int blu =int(random(0, 255));

void setup (){
 
 size(400,400);
 background(255,234,180);
 smooth();
 noStroke();
   fill(0);
  
}

void draw(){
  
 
    ellipse(mouseX,mouseY,5,5);
    
  
}

void mousePressed() {
 
 fill(int(random(0, 255)),int(random(0, 255)),int(random(0, 255))); 
}

//void mouseDragged(){
//fill(255,234,180);
//  ellipse(mouseX,mouseY, 10,10);
//  
//}
  


