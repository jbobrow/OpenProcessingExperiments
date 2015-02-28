
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
  
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter

float ease = .1;
boolean circMove = false;
 
  
void setup() {
  size(640, 360);
  smooth();
   
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;
   
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}
  
void draw() {
  background(102);
  fill(0);
  rect(rx, ry, rd, rd);
  fill(255);
  ellipse(ex, ey, ed, ed);
  
   float d = dist( ex, ey, mouseX, mouseY);
 
   //if you click on circle
   if( d <= (ed/2)){
     background(102);
     fill(0);
     rect(rx+10, ry+10, rd-30, rd-30);
     fill(255);
     ellipse(ex, ey, ed, ed);
     if( mousePressed == true){
       ex += (mouseX-ex)*ease;
      ey += (mouseY-ey)*ease;
    }else{
      circMove=false;
    }
  }
  if (circMove==false){
    ex += (width*0.66-ex)*ease;
      ey += (height*0.5-ey)*ease;
  }
  ellipse(ex, ey, ed, ed);
      
      //if you click on rect
      if(mouseX>rx && mouseX<rx+rd && mouseY>ry && mouseY<ry+rd) {
        background(102);
        fill(0);
        rect(rx, ry, rd, rd);
        fill(255);
        ellipse(ex, ey, ed-20, ed-20); }
     if (mousePressed && mouseX>rx && mouseX<rx+rd && mouseY>ry && mouseY<ry+rd) {
     fill (100, 200, 300); 
  rect(rx, ry, rd, rd);   
     }
     
    
   }
      
     


