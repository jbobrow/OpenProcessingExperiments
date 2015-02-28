
float x = 255;

void setup(){
 size(600,600);
 
 frameRate(30);
  
}

void draw(){
  
  
  
  

}
 



void mousePressed(){
 fill(random(255), random(255), random(255));
 rect(random(width),random(height),random(width),random(height));
}

void mouseReleased(){
 rect(random(width),random(height),random(width),random(height));
}

void mouseDragged(){
 
}  

