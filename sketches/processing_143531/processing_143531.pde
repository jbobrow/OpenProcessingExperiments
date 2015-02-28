

/*
 Konkuk University
 SOS iDesign
 
Name:Lim Hyun Seung
 ID: 201420104 Lim Hyun Seung
 
*/

float cX=10;
float direction=1;
float angle=2;
 
void setup()
{
  size(600, 600);
  background(0);
  frameRate(15);
}
 
void draw()
{
  noStroke();
  fill(255,50);
  rectMode(CORNERS);
  rect(0,0,width,height);
   
  stroke(0);
  fill(0,150,cX,10);
  translate(width/2,height/2); 
   
  // basic gird of coordinates
  for(int i=40; i<width; i+=250){
    for(int j=30; j<height; j+=90){
      strokeWeight(0);
      stroke(255, 255, 255);
      line(i,j,0,0);
      rotate(angle);
      rectMode(CORNERS);
      rect(i,j,0,0);
      noStroke();
      triangle(i,j,0,220,i,500);
    }
  }
   
  // counter for ellipse width & height, and color range
  cX = cX + (1.75 * direction);
  // change the direction of counting
  if ((cX<120)||(cX>200)){
    direction*=-3;
  }
   
  // Rotation Angle
  angle += 0.009;
     
}
 
void mousePressed(){
  noLoop();
}
void mouseReleased(){
  loop();
}

