
float margin;

void setup() {
    size (400,400);
}
 
void draw() {
  margin=50;
  
   smooth();
   background (255);

  if (mousePressed == true) {
    fill (0);
    noStroke();
    ellipse (150,150,50,5);
    ellipse (250,150,50,5);
  } else {
    float r = random (30);
    fill (r);
    ellipse (150,150,50,50);
    ellipse (250,150,50,50);
  }
         
     rectMode(CORNERS);
     noFill();
     strokeWeight (20);
     stroke (0);
         rect (margin,margin,width-margin,height-margin);

    noFill();
    strokeWeight(10);
    stroke (0);
          line (150,240,170,280);
          line (170,280,190,240);   
          line (210,240,230,280);
          line (230,280,250,240);     
          
}



