

int movY = 0 + 10;


void setup () {
size (500,500);
background (75,0,0);
}


void draw () {
 line (mouseX, mouseY, 255, movY);
 stroke (255, 0, 0);
  strokeWeight (1/12);
  
  
//for (int i = 0; i< width; i = i+10) {
//  strokeWeight (1/8);
  //stroke (255, 0, 0); 
  //line (origen, origen, 255, i);
// }
}
