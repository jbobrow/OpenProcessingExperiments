

int radius;
int ellipseSize;
int legLength;
int cx;
int cy;
int rotated;
int howMany;
int transparency;

void setup() {
  size(800, 600);
  background(165,150,135);
  fill(255);
 
}

void draw() {
}

void mouseClicked() {
  ellipseMode(CENTER);
 
  cx = mouseX;
  cy = mouseY;
  howMany = int(random(20));
  for (int l = 0; l < howMany; l++) {
  rotated = int(random(0,100));
  legLength = int(random(5, 110));
  transparency = int(random(10,90)); 
   
   
  for (int j = 0; j < 50; j++) {
      float legW = cx + cos(radians(5*j+rotated)) * legLength;
      float legX = cy+ sin(radians(10* j+rotated))* legLength;
      
      
      fill(255,transparency);
      ellipse(cx, cy, 1, 1);
      //fill(255,transparency);
      //ellipse(cx, cy - 25, 1,1);
 
      stroke(255,transparency);
      line(cx, cy, legW, legX);
      //ellipse(legX, legX, radius, radius);
      
  if (legLength < 50) {
     stroke(103,29,15,transparency);
     line(cx,cy,legW,legX);
    
  } 
   else {
  }
    
      
    }
  }


}
/* there are two key things you need to do with shapes before you make ob=jects

  --- make shapes relative with VARIABLES, not based on certain points!!
  --- start with a center point, based on mouse x and y values
  --- use of loops > legs specifically 
        for int i = 0; i < variable, i ++);
  */ 
  


