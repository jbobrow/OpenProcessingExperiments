
void setup() {  //setup function called initially, only once
  size (200, 200);
  background (154,205,50);

}

void draw() {  //draw function loops 
  fill (255,223,196);
  ellipseMode (CENTER);
  ellipse (100,50,60,60);     //head
  fill (0,191,255);
  ellipse (110,45,10,10);     //right eye
  ellipse (90,45,10,10);      //left eye
  line (158,200,100,120);     //right leg
  line (50,200,100,90);       //left leg
  fill (50,50,200);
  rect (70,80,60,80);         //body
  line (30,15,70,85);         // left arm
  line (150, 5, 130, 85);     //right arm
  
  
}
