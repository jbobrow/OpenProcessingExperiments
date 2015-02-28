
import processing.pdf.*;




void setup () {
  size (1000,1050,PDF, "HW_Wallpaper_Project_Nahyun.pdf");
  smooth ();
  background (#FFFFFF);
  
  
  
}



void draw () {
  
  for(int i = 0; i < 1000; i = i + 200) {
    for( int j = 0; j < 900; j = j+160) {  
      
  stroke (167,227,198);
  strokeWeight (3);
  fill (#D8C3A4);
  ellipse (80+i,80+j,50,50);
  fill (#D8C3A4);
  ellipse (130+i,130+j,50,50);
  fill (#A4CDD8);
  ellipse (80+i,130+j,50,50);
  fill (#A4CDD8);
  ellipse (130+i,180+j,50,50);
   fill (#A4CDD8);
  ellipse (80+i,40+j, 20,20);
   fill (#D8C3A4);
  ellipse (80+i, 20+j,5,5);
  fill (#D8C3A4);
  ellipse (40+i,130+j,20,20);
  fill (#A4CDD8);
  ellipse (20+i, 130+j,5,5);
  fill (#A4CDD8);
  ellipse (170+i, 130+j, 20,20);
  fill (#A4CDD8);
  ellipse (190+i, 130+j,5,5);
  fill (#D8C3A4);
  ellipse (130+i, 220+j, 20,20);
  fill (#D8C3A4);
  ellipse (130+i,240+j,5,5);
  
  }
  
  }
  exit();
  
}
 

