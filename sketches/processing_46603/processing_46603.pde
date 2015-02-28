
/*
Hackpact Arte Generativo 2011
Dia 18

Martin Zumaya Hernandez
*/


float ang = 0;
float nx = 0.1;
float ny = 0.1;

void setup() {
  size(600, 600);
  colorMode(HSB);
  background(0);
}

void draw() {

//  fill(0, 10);
//  rect(0,0,width,height);
  translate(width/2, height/2);

  if ( radians(ang) < TWO_PI ) {
    rotate(radians(-ang));  
    for (int i = 20; i < width/2; i += 5) {
      stroke(68+i/3*sin(ang), 255, 255);
      point(i+40*noise(nx, ny), 0);
    }
  }

  nx += 0.1;
  ny += 0.3;

  ang += 0.5;
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

