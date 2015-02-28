

void setup() {
  size(500,500,JAVA2D);
  smooth();
  background(255);
  stroke(0);
}

float deg3, x3, y3, b, x4, y4;
int dia, sides, sidescalc, sidesn=1, sidesold;


void draw() {


  dia = (mouseX/2);
  sides = (mouseY/2)+9;
  
  
  
  
  //background(255);
  fill(255,255,255,150);
  rect(0,0,height,width);
  
  if (keyPressed) {
    if (key == '+' && sidesn < 24) {
    sidesn = sidesn + 1;
    } else if (key == '-' && sidesn > 1) {
     sidesn = sidesn - 1; 
    }
    delay(100);
  }
  
 
  
 sidescalc = (360/sides); 
  
  
  for(int i=0; i < 360; i = i + sidescalc) {
  
      if (sidesn == 1) {
    strokeWeight(3);
  } else {
    strokeWeight(1);
  }
    
  stroke(0);
  deg3=radians(i+sidescalc);
  x3 = sin(deg3)*dia+(width/2);
  y3 = cos(deg3)*dia+(height/2);
  ngon(sidesn,x3,y3,i,i+sidescalc);
 
  
}
 

fill(25);
  text(sides-9 + " " + dia + " " + sidesn ,5,15);
  
   text("'+' to increase ngon side count, '-' to decrease. Polycount: " + sides*sidesn,5,height-5);
   
   stroke(175);
   strokeWeight(2);
   point(height/2,width/2);
   
}



void ngon(int sides, float cordx, float cordy, int siz, int rot) {
  
  float deg1, x1, y1, deg2, x2, y2;
  int sidescalc;
  
  sidescalc = (360/sides);
  
  for (int i = 0+rot; i < 360+rot; i=i+sidescalc) {
  
  deg1=radians(i);
  x1 = sin(deg1)*(360-siz-5)/8+(cordx);
  y1 = cos(deg1)*(360-siz-5)/8+(cordy);
  
  deg2=radians(i+sidescalc);
  x2 = sin(deg2)*(360-siz-5)/8+(cordx);
  y2 = cos(deg2)*(360-siz-5)/8+(cordy);
  line(x1, y1, x2, y2);
  }

}





