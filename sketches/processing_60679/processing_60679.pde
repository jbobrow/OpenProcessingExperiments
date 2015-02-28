
int x = 32;
int y = 32;
int geschwindigkeit = 12;
int distance = 24;

int farbe;
int satt;
 
void setup() {
  size(400, 400);
  smooth();
  colorMode(HSB,360,100,100,100);
}
void draw() {
  
  
  
  heisserKreis(distance,geschwindigkeit);
  
}


void heisserKreis(int distance, int geschwindigkeit) {
  if (x <= width - distance && y <= distance) {
    x += geschwindigkeit;  
  } else if( x >= width - distance && y <= height - distance  ){
    y += geschwindigkeit;
  } else if ( x>=distance && y >= height-distance) { 
    x -= geschwindigkeit;
  } else  {
    y -= geschwindigkeit;
  }
  
  
  strokeWeight(1.5);
  noFill();
  stroke(0,0,100,80);
  ellipse(x,y,30,30);
  
  line(width/2, height/2, x,y);
  
  noStroke();
  farbe = (int) x+y;
  satt = (int) y+x;
  
  satt = (int) map(satt, distance, height+width, 80, 100);
  farbe = (int) map(farbe, distance, width+width, 260, 360);
  
  fill(farbe,satt,100,1.8);
  
  rect(0,0,width,height);
}

