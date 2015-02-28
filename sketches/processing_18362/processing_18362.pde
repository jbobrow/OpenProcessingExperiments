
void setup() {
  background(20,40,60);
  size(250,250);
  smooth();
  frameRate(50);
}

float rot = 0;

void draw() {
  background(20,40,60);
  rot = rot + 0.02;
  translate(width/2,height/2);
  rotate(rot);
  for(
    float i=0.1; i<50; i+=0.2)     
  {
    float j = dist (width/2,height/2,mouseX,mouseY);
    float k = dist (width/2,height/2,mouseX,mouseY);
    stroke(255,random(j/1.5));
    rotate(i);
    line(-250,-250,125,125);
    stroke(255,25);
    strokeWeight(0.5);
    fill(255,0.5);      
    ellipse(j*16,j*16,k/4,k/4);      
    ellipse(j*14,j*14,k/4,k/4); 
    ellipse(j*12,j*12,k/4,k/4);      
    ellipse(j*10,j*10,k/4,k/4); 
    ellipse(j*8,j*8,k/4,k/4);      
    ellipse(j*6,j*6,k/4,k/4);     
    ellipse(j*4,j*4,k/4,k/4);    
    ellipse(j*2,j*2,k/4,k/4);
    ellipse(j,j,k/4,k/4);
    ellipse(j/2,j/2,k/4,k/4);
    ellipse(j/4,j/4,k/4,k/4);
    ellipse(j/6,j/6,k/4,k/4);
    ellipse(j/8,j/8,k/4,k/4);
    if(mousePressed) {
      i++;
    }
  }
}


