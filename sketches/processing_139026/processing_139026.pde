

float angle = 0;
float xradius = 300;
float yradius = 300;
float xradiusO = 1;
float yradiusO = 1;
float xradiusA = 800;
float yradiusA = 800;

void setup(){
  size (800,500);
  background(0);noStroke();
    frameRate(15000);
}

void draw(){


  
   for(int i = 0; i < 2; i++){
         pushMatrix();
    float xposK = xradiusO*tan(radians(angle))+400;
  float yposK = yradiusO*sin(radians(angle))+250;
  angle+=130.5; 
  xradiusO += .01;
  yradiusO += .01;
noStroke();
fill(255,50);
  ellipse (xposK,yposK,5,5);
   popMatrix();
  }
  for(int i = 0; i < 2; i++){
         pushMatrix();
    float xposK = xradiusO*cos(radians(angle))+400;
  float yposK = yradiusO*tan(radians(angle))+250;
  angle+=130.5; 
  xradiusO += .01;
  yradiusO += .01;
  noStroke();
fill(255);
  ellipse (xposK,yposK,6,6);
   popMatrix();
  }
 
  
 
 
 noStroke();
  float xpos = xradius*cos(radians(angle))-tan(radians(cos(angle)))+400;
  float ypos = yradius*tan(radians(sin(angle))+tan(radians(cos(angle))/tan(radians(tan(angle)))))+250;
fill(random(0, 200),random(0, 130),random(0, 110), 70);
  rect (xpos,ypos,10,10);
  

   float xposOne = xradius*cos(radians(angle))-tan(radians(cos(angle)))+200;
  float yposOne = yradius*tan(radians(sin(angle))+tan(radians(cos(angle))/tan(radians(tan(angle)))))+250;
fill(random(0, 50),random(0, 200),random(0, 150), 120);
  rect (xposOne,yposOne,5,5);

   float xposTwo = xradius*cos(radians(angle))-tan(radians(cos(angle)))+600;
  float yposTwo = yradius*tan(radians(sin(angle))+tan(radians(cos(angle))/tan(radians(tan(angle)))))+250;
fill(random(0, 100),random(0, 50),random(0, 100), 120);
  rect (xposTwo,yposTwo,5,5);
  
  
  
   float xposThree = xradiusA*cos(radians(angle))-tan(radians(cos(angle)))+800;
  float yposThree = yradiusA*tan(radians(sin(angle))+tan(radians(cos(angle))/tan(radians(tan(angle)))))+250;
fill(random(0, 50),random(0, 100),random(0, 80));
  ellipse (xposThree,yposThree,2,2);

   float xposT = xradiusA*cos(radians(angle))-tan(radians(cos(angle)))+0;
  float yposT = yradiusA*tan(radians(sin(angle))+tan(radians(cos(angle))/tan(radians(tan(angle)))))+0;
fill(random(0, 50),random(0, 100),random(0, 80));
  ellipse (xposT,yposT,2,2);
    
 angle++;
  
}


