
  float L=400,i;
  float A;

void setup()
{
  size(900,600,P3D);
  background(0);
frameRate(20);

}

void draw()
{  
  drawsmoke();
drawCircle();

}

float a = 250;

void drawCircle()
{
  stroke(0,random(0,255),random(0,255),20);
  translate(width/2,height/2,0);
  rotateX(0.1*radians(mouseY));
  rotateY(0.1*radians(mouseX)); 
    for (float deg =0; deg<360;deg+=5) {
      for(float deg2=0;deg2<180;deg2+=3){
         float theta=radians(deg);
        float phi = radians(deg2);
      float x = a*sin(phi)*cos(theta);
      float y = a*sin(phi)*sin(theta);
      float z = a*cos(phi);
      point(x,y,z);
    }
  } }
  
  void drawsmoke()
{
  //vector part
  float lx=0, ly=0, lz=1;
  
  float x = mouseX;
  float y = mouseY;
  float z = abs(mouseX-mouseY);
  
  float rx = random(0,100);
  float ry = random(0,100);
  float rz = random(0,100);
  
  float sx = random(0,100);
  float sy = random(0,100);
  float sz = random(0,100);
  
  float cx = (ry*sz-ry*sy);
  float cy =-(rx*sz-rz*sx);
  float cz=(rx*sy-ry*sx);
  
  float size = sqrt(cx*cx+cy*cy+cz*cz);
  cx = cx/size;
  cy = cy/size;
  cz = cz/size;
  
  float brightness=abs(cx*lx+cy*ly+cz*lz);
  
  fill(brightness*255,brightness*145,brightness*138,100);  
ellipse(abs(x+=9*cos(A+=.5-noise(i++))),abs(y+=9*sin(A)),40,40);
filter(18);
filter(11);
smooth(8);


}


