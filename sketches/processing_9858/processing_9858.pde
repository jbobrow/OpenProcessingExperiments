
  int x = 100;
int y = 30;
 
 
void setup ()
{
  size( 600, 900 );
  smooth();
 
}
 
 
void draw ()
 
{
 
  background(255);
  //stroke( 0 );
  corp( mouseX, mouseY, width/10, height/20*2);
  kopf(width/2,120);
  rellipse_left_right  ( mouseX, mouseY-180 );
  mund ( mouseX-100, mouseY-220 );
}
 
void corp ( float x5, float y10, float x7, float y20 )
 
{
  stroke( 0 );
  strokeWeight(x*2);
  line(mouseX, mouseY,0,0);
  line(mouseX, mouseY,width,0);
  line(mouseX, mouseY,0,height);
  line(mouseX, mouseY,width,height);
  ellipse ( x5, y10, x7, y20);
 
  if(mousePressed) {
    fill(random(width/x), random(height/y), x*y);
    
    stroke( random(255),0,0 );
  strokeWeight(x*2);
  line(mouseX, mouseY,0,0);
  line(mouseX, mouseY,width,0);
  line(mouseX, mouseY,0,height);
  line(mouseX, mouseY,width,height);
  ellipse ( x5, y10, x7, y20);
  }
  else {
    fill(0);
  }
  ellipse ( x5, y10, x7, y20);
}
/////////////////////////KOPF ////////////////////   
 
 
 
 
void kopf (float x, float y)
{
  noStroke();
  //KOPF
  pushMatrix();
  shapeMode(CENTER);
  fill(20);
  translate(mouseX-300,mouseY-300);
  ellipse(x,y,250,160);
  rect(x-30,y+50,60,50);
 
 
  //HUT
  fill(50);
  rotate(radians(-20));
  rect(x-200, y+20, 230,10);
  rect(x-160, y-40, 150,70);
  popMatrix();
 
}
 
///////////////////////////////// AUGEN ////////
 
void rellipse_left_right ( float x , float y)
{
 
  float x1_left = x - 20;
  float y1_left = y - 20;
  float x1_right = x + 20;
  float y1_right = y - 20;
  float x2_left = 10, y2_left = 10;
  float x2_right = 10, y2_right = 10;
  float x2_eye_size = 20, y2_eye_size = 40;
 
  fill(255);
  ellipse(x1_left, y1_left, x2_left+x2_eye_size, y2_left+y2_eye_size);
  ellipse(x1_right, y1_right, x2_right+x2_eye_size, y2_right+y2_eye_size);
 
  fill(0); 
  translate(random((-x2_left + (1/1.6)), (y2_left - (1/1.6))), random((-x2_right + (1/1.6)), (y2_right - (1/1.6))));
  ellipse( x1_left, y1_left, x2_left, y2_left );
  ellipse( x1_right, y1_right, x2_right, y2_right );
}
 
 
 
 
/////////////// MUND ////////////////
 
void mund ( float x, float y )
{
  pushMatrix();   // alle werte werden eingefroren
  translate(x,y);  // neuer nullpunkt wird gesetzt
 
 
 
 
  fill(255,0,0);
  beginShape();
  vertex( 60, 60 );
  bezierVertex( 50, 120,  60, 150,  180, 60 );
  endShape( CLOSE ); 
 
  fill(0);
  beginShape();
  vertex( 60, 60 );
  bezierVertex( 60, 120,  60, 120,  180, 60 );
  endShape( CLOSE ); 
 
  fill(255);    //zÃ¤hne
  triangle(60,60,70,80,80,60);
  triangle(80,60,90,70,100,60);
  triangle(100,60,110,75,120,60);
  triangle(120,60,130,82,140,60);
  triangle(140,60,150,70,160,60);
 
 
 
  popMatrix();   // alle werte werden wieder zurÃ¼ckgesetzt
 
 
 
 
}

