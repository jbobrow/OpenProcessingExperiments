

float delta = 2;
float r = 10;
float rad1 = 0;
float rad2 = 0;
float rad3 = 0;

void setup()
{
 size(1000,1000,P3D); 
frameRate(30);
}

void draw()
{
  background(0);

  translate(width/2, height/2, 0);
  float shp = random(230,255);


 rotateX(radians(90));
  
  
  for(float dig=0; dig<180; dig+=delta){
  for(float dog=0; dog<360; dog+=delta){
   float x1 = 200 * sin(radians(dig)) * cos(radians(dog));
    float y1 = 200 * sin(radians(dig)) * sin(radians(dog));
    float z1 = 200 * cos(radians(dig));
  float a = random(0,255);
 float b = random(0,255);
 float c = random(170,255);
strokeWeight(2);
  stroke(a,b,c);
      point(x1,y1,z1);
  }
  }

  
  rad1 += 30;
  rotateX(radians(rad1));
  for(float z=0; z<360; z+=0.5){
    rotateZ(radians(0.5));
   for(float deg=0; deg<360; deg+=delta){
  float theta = radians(deg);
  float x = r*cos(theta);
  float y = r*sin(theta);
strokeWeight(2);
  stroke(255,0,0);
  point(260+x,0,y);
   } 
  }
  
  rad2 += 3;
  rotateX(radians(-rad1));
  rotateY(radians(rad2));
  
   for(float z=0; z<360; z+=0.5){
    rotateZ(radians(0.5));
   for(float deg=0; deg<360; deg+=delta){
  float theta = radians(deg);
  float x = r*cos(theta);
  float y = r*sin(theta);
strokeWeight(2);
  stroke(170,170,170);
  point(280+x,0,y);
   } 
  }
  
    rad3 += 0.5;
    rotateY(radians(-rad2));
    rotateY(radians(rad3));
    rotateX(radians(rad3));
    
   for(float z=0; z<360; z+=0.5){
    rotateZ(radians(0.5));
   for(float deg=0; deg<360; deg+=delta){
  float theta = radians(deg);
  float x = r*cos(theta);
  float y = r*sin(theta);
strokeWeight(2);
  stroke(255,255,255);
  point(300+x,0,y);
   } 
  }
  
}

