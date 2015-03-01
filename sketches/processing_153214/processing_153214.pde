
// Triangle Rotate
// Gary Green 2014

// Centre of circle is 255,255


float x1=255;
float y1=255;
float x2, y2;
int r=128;
int g=255;
int b=50;
float chngr=2; // change red
float tran=255; // transparency
float rad=150;  // radius distance
float radchng=-0.5; // radius change
int degstart=0; // point that circle starts


void setup() {
  background(0);
  size(510,520);
  smooth();
  strokeWeight(3);
  strokeJoin(ROUND);
  }

void draw() {
  
  background(0);
  degstart+=2;
  if(degstart>360) { degstart=0; }
  
 for(int deg=degstart; deg<360+degstart; deg+=30) { // degree around circle
   
  
  float angle1=radians(deg);  // convert degree to radian
  float x1=255+(cos(angle1)*rad); // x coord around arc
  float y1=255+(sin(angle1)*rad);  // y coord around arc
  float angle2=radians(deg-40);
  float x2=255+(cos(angle2)*rad);
  float y2=255+(sin(angle2)*rad);

 // r+=chngr;           //change & set colours
  g=mouseX/2;
  b=mouseY/2;
 
  if((r<1) || (r>254)) { chngr=chngr*-1; }
  //stroke(g,b,r);
  fill(r,g,b,120);
      
  beginShape();
  vertex(x1-30,y1-20);
  vertex(x2+30,y2-30);
  vertex(x1+20,y2+20);
  endShape(CLOSE); 

}
  

  
rad=rad+radchng; // change radius distance

if((rad<-225) || (rad>225)) {
  radchng=radchng*-1;
  rad=rad+radchng;  
 }

  
}
