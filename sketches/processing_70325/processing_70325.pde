
int rad;
float angle;
float xPos1, yPos1;
float r;

void setup() {
  size(1000, 1000);
  background(0);

}


void draw() {
  translate(width/2, height/2);
        
    for (int i=0; i<300; i++){
    rad=70;
    angle=radians(i);
    xPos1= cos(angle)*rad;
    yPos1= sin(angle)*rad;
    rotate(radians(50));
    strokeWeight(0.2);
    noFill();
    smooth();
    
    stroke(100, 100, 255,30);
    ellipse(xPos1, yPos1, rad, rad);
    
    }
    

    for (int i=0; i<100; i++){
    rad=100;
    angle=radians(i);
    xPos1= cos(angle)*rad;
    yPos1= sin(angle)*rad;
    rotate(rad);
    strokeWeight(0.2);
    noFill();
    smooth();
    
    stroke(255,100,100,20);
    rect(xPos1,yPos1,i,i);
    }
    
    for (int i=0; i<360; i++){
    rad=120;
    angle=radians(i);
    xPos1= cos(angle)*rad;
    yPos1= sin(angle)*rad;
    rotate(rad);
    strokeWeight(0.2);
    noFill();
    smooth();
    
    stroke(150,100,200,20);
    ellipse(xPos1,yPos1,i,i);
      
    stroke(100,200,0,20);
    rect(xPos1,yPos1,rad,rad);
    
   stroke(255,100,100,50);
   line(mouseX,mouseY,xPos1,yPos1);
      }
      
      for (int i=0; i<100; i++){
    rad=300;
    angle=radians(i);
    xPos1= cos(angle)*rad;
    yPos1= sin(angle)*rad;
    rotate(rad);
    strokeWeight(0.2);
    noFill();
    smooth();
    stroke(100,255,255,20);
    ellipse(xPos1,yPos1,rad,i);
    
      }
}




