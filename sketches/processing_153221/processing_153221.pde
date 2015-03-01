
// Triangle Rotate (carnation)
// Gary Green 2014

// Centre of circle is 255,255


float x1=255;
float y1=255;
float x2, y2;
int r=200;
int g;
int b=50;
float chngr=10; // change red
float tran=255; // transparency
int degstart=0; // point that circle starts


void setup() {
  background(0);
  size(510,520);
  smooth();
  strokeWeight(1);
  strokeJoin(ROUND);
  }

void draw() {
  
  background(0);
  
  tran=120;
  g=255;
  
  degstart+=1;
  if(degstart>360) { degstart=0; }
  
  for(float rad=50; rad<250; rad+=80) {
    
    tran-=10;
      
 for(int deg=degstart; deg<360+degstart; deg+=30) { // degree around circle
   
  
  float angle1=radians(deg);  // convert degree to radian
  float x1=255+(cos(angle1)*rad); // x coord around arc
  float y1=255+(sin(angle1)*rad);  // y coord around arc
  float angle2=radians(deg-40);
  float x2=255+(cos(angle2)*rad);
  float y2=255+(sin(angle2)*rad);

  
  g-=10;
     
  fill(r,g,b,180);
  
  beginShape();    // draw triangles
  vertex(x1-80,y1);
  vertex(x1+60,y1+40);
  vertex(x2,y2);
  endShape(CLOSE);
  }
 
  }

}
