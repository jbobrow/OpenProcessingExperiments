


void setup(){
  size(800, 800);
 
  noStroke();
  background(0,160,230);
}
 
void draw(){




  
  stroke(255);
  noFill();
  background(0,160,230);
  translate(width/2, height/2);
   if (keyPressed==true)
  {
    background(125,0,150);      
    
 }
 
   for(int i = 0; i < 700; i+=3)
  {
    float n = sin(radians(i));
    float x = sin(radians(i+frameCount*(n*2)))*(i/( noise(i/12)*10));
    float y = cos(radians(i+frameCount*(n*2)))*(i/( noise(i/12)*10));
    ellipse(x, y, noise(i)*10 , noise(i)*10);
    
}


}

void mouseClicked() {
 
  
}




    

    
   
