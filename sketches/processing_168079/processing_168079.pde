
float t=0;
float radius=200;
float curDeg=0;
float curDeg2 =0;
float curDeg3 =0;

void setup() {
  size(600, 600, P3D);
}

void draw() {
 
  background(random(0,50),random(50,100),random(100,255));
  translate(height/2, width/2,0);
  
  if(mousePressed) {
    background (40,30,150);
    curDeg2 += 0.03;
  float rad2 = radians(curDeg2);
  float x2 = 200 * cos(rad2);
  float y2 = radius * sin(rad2);
stroke(0);
line(0,0,x2,y2);

curDeg3 += 0.1;
  float rad3 = radians(curDeg3);
  float x3 = 200 * cos(rad3);
  float y3 = radius * sin(rad3);
stroke(255,255,125);
line(0,0,x3,y3);
    
    for (float a=0; a<360; a+=5) {
  for (float Deg=0; Deg<360; Deg+=10)
  {
    float theta=radians(Deg);
    float pi=radians(a);
    float x= radius *sin(pi)*cos(theta);
    float y= radius *sin(pi)*sin(theta);
    float z= radius *cos(pi);
    point(x, y, z);
    strokeWeight(5);
    stroke(0);
    point(x/3, y/3, z/3);
    strokeWeight(2);
    stroke(255);
  }
}

}
 else {
frameRate(60);

  float x1=0, y1=0, z1=0; // starts from the center
  float x2=random(-300, 300); //random length
  float y2=random(-300, 300); //random length
  float z2=random(-300, 300); //random length
  float mag2=sqrt(x2*x2+y2*y2+z2*z2); //length of vector
  float magNormal=1; //normal vector
  float dotProduct=z2;
  float cosine=dotProduct/(mag2*magNormal);
  stroke(255*cosine, 255*cosine, 125*cosine); // theta --> 0 color darker 
  strokeWeight(2.5); 
  line(x1, y1, z1, x2, y2, z2);
  
for (float a=0; a<360; a+=5) {
  for (float Deg=0; Deg<360; Deg+=10)
  {
    float theta=radians(Deg);
    float pi=radians(a);
    float x= radius *sin(pi)*cos(theta);
    float y= radius *sin(pi)*sin(theta);
    float z= radius *cos(pi);
    point(x, y, z);
    strokeWeight(5);
    stroke(0);
    point(x/3, y/3, z/3);
    strokeWeight(2);
    stroke(255);


  }
}
}
}

