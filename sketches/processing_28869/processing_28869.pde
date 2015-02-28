
void setup () {
 size(400,400);
 smooth();
 background(255);
}

void draw () {
 // background (255);
  fill(255,112,231);
  rect(0,0,width,height);
 
  
  
  for( int x=0; x <= width; x+=20 ) {
      for (int y=0; y <= height; y+=20) {
        float abstand = dist(mouseX, mouseY, x,y);
        float angle = atan2(mouseY-y, mouseX-x);
        //  line(x,y,x+10,y);
      
      pushMatrix();
      translate(x,y);
      rotate(angle);
//      rotate(abstand/100);
      line(0,0,10,0);
      popMatrix(); 
    }
  }


}

void mousePressed() {
 //  println("mouse pressed");
   colorMode(HSB, 100);
 
}

