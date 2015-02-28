

int[][] intMap;
int cols, rows, phase, angle, angle2, oX,oY;
PImage img;

void setup(){
  frameRate(60);
  size(400,400);
  cols = round(height/2);
  rows = round(width/2);
  phase = 0;
  angle = round(random(360));
  angle2 = round(random(360));
  oX = width/2;
  oY = height/2;
  intMap = new int[cols][rows];

  stroke(255,0,0);
  strokeWeight( 1 );
  strokeCap ( PROJECT );
  fill(120);
  background(255);
  translate(-oX,-oY);
}

void draw(){
  phase ++;
  if(phase > cols ) phase -= cols;
  angle2 += 0.5;
  if(angle2 > 360 ) angle -= 360;
  angle += 2;
  if(angle > 360 ) angle -= 360;
  updateMap();
}

void updateMap(){
  PImage img = createImage(width, height, RGB);
  img.loadPixels();
  img.copy(0, 0, width, height, 0, 0, width, height); 
  img.updatePixels();
  
  noStroke();
  fill(255,255,255,30);
  rect(0,0,width,height);
  noFill();

  blend(img, 0, 0, 33, 100, 67, 0, 73, 100, LIGHTEST);
  stroke(random(255),random(155),random(155));
   point( cos(radians(angle2))*random(cols) , sin(radians(angle2))*random(cols) );
  pushMatrix();
  rotate(radians(angle));
    translate( oX,oY);
    
    pushMatrix();
     point( cos(radians(angle2))*cols , sin(radians(angle2))*cols );
     rotate(radians(angle));
    translate( cos(radians(angle))*5 ,sin(radians(angle))*5 );
      pushMatrix();
         point( cos(radians(angle2))*(cols+phase), sin(radians(angle2))*(rows+phase) );
          rotate(radians(angle2));
          translate( cos(radians(angle2))*3 , cos(radians(angle2))*3 );
          pushMatrix();
          for( int c = 0; c< 360; c++ ) {
           rotate(radians(angle));
           stroke(random(255),random(100),random(100));
            point( cos(radians(angle2))*c , sin(radians(angle2))*c );
           stroke(random(255),random(50),random(50));
            point( cos(radians(angle))*c , sin(radians(angle))*c );
          }
          popMatrix();
      popMatrix();
    popMatrix();
  popMatrix();
}

