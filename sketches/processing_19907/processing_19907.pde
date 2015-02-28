


float y1,y2,y3,y4;
float v1,v2,v3,v4;
float diametre;

void setup() {
  size(400,400);
  diametre = 40;
  y1 = y2 = y3 = y4 = diametre/2;
  v1 = v2 = v3 = v4 = 5;
  
  frameRate(20);
  smooth();
  noStroke();
}


void draw() {

 background(100);
  
  // CERCLE MAUVE
  y1 = y1 + v1;
  if ( y1 > height - diametre/2 ) {
    y1 = height - diametre/2;
  } 
  fill(200,10,200);
  ellipse(width/5,y1,diametre,diametre);

  // CERCLE JAUNE
  y2 = y2 + v2;
  if ( y2 > height + diametre/2 ) {
    y2 = -diametre/2;
  }
  fill(200,200,10);
  ellipse(width/5*2,y2,diametre,diametre);
  
  // CERCLE CYAN
   y3 = y3 + v3;
  if ( y3 > height - diametre/2 ) {
    y3 = height - diametre/2;
    v3 = v3 * -1;
  } else if ( y3 < diametre/2 ) {
    y3 = 0 + diametre/2;
    v3 = v3 * -1;
  }
  fill(10,200,200);
  ellipse(width/5*3,y3,diametre,diametre);
  
  // CERCLE CYAN FONCE
   y4 = y4 + v4;
   v4 = v4 + 0.2;
  if ( y4 > height - diametre/2 ) {
    y4 = height - diametre/2;
    v4 = v4 * -0.9;
  } else if ( y3 < diametre/2 ) {
    y4 = 0 + diametre/2;
    v4 = v4 * -0.9;
  }
  fill(10,150,150);
  ellipse(width/5*4,y4,diametre,diametre);
  
}



void mousePressed() {
  y1 = y2 = y3 = y4 = diametre/2;
  v1 = v2 = v3 = v4 = 5;
}

