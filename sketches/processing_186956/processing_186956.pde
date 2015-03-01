
// starting point of circle
int x = 25;
int y = 25;
int w = 375;
int z = 375;
//circle speed
int xx = 7;
int yy = 7;
int ww = 7;
int zz = 7;

 
void setup() {
    size(400,400);
    
}
 
void draw() {
 // background color change as mouse moves  
background(mouseX, mouseY, 100, 100);
  
 fill(mouseX, mouseY, 100, 100);
 
  println(mouseX + ", " + mouseY);

   


  // bouncing circle   
    noFill ();
    ellipse(mouseX,y,50,50);
    
     if (y>400) {
        yy = -yy;
    }
     
    if (y<0) {
        yy = -yy;
    }
     
    y = y + yy;
    
 
        noFill ();
    ellipse(mouseX,z,50,50);
    
     if (z>400) {
        zz = -zz;
    }
     
    if (z<0) {
        zz = -zz;
    }
     
    z = z + zz;

     
    // location of circle bounce 
    if (mousePressed) {
    x = mouseX;
    y = mouseY;
    }
}



