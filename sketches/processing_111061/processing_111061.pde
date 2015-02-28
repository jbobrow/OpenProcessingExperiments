
//triangle_strips
size (600, 600);
background(196);
noStroke();

int t = 5; //top
int b = t*10; //bottom 
int sp = 25; //spacing

for (int y=0; y<height; y+=sp) {
pushMatrix(); 
if (y%2==0) {
translate (-50, y*2);
} else { 
translate (-75, y*2); 
}

    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i<width+50; i++) {
      
      if (i%2==0) {
      fill(#008ED8);
      } else { 
      fill(#004AA7);
      }
            
    vertex(i+=sp, b);
    vertex(i+=sp, t);
    vertex(i+=sp, b);
    vertex(i+=sp, t);
    }
    
endShape();
popMatrix();
}









//
//for (int i = -50; i<width+50; i+=sp) {
//  beginShape(TRIANGLE_STRIP);
//    for (int y = 0; y<height+50; y+=sp) {
//    vertex(i, y);
//    vertex(i+sp, y+=sp);
//    vertex(i, y);
//    }
//  endShape();
//}



