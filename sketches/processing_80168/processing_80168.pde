
size(500,300);
background(255);
strokeWeight(0.5);
smooth();

int centX =50;
int centY =50;

float x,y;
for(int i=0;i<100;i++){

float lastx = -999;
float lasty = -999;
float radiusNoise = random(20);
float radius = 20;

stroke(random(10),random(20),random(70),40);

int startangle = int(random(360));
int endangle = 2100 + int(random(2000));
int anglestep = 5 + int(random(3));
for(float ang = startangle; ang <+ endangle; ang += anglestep){

  radiusNoise +=0.5;
  radius +=0.5;
  float thisRadius = radius+(noise(radiusNoise)*200)-100;
  float rad =radians(ang);  //converts from degrees to radians
  x = centX+(thisRadius*cos(rad));
  y = centY+(thisRadius*sin(rad));
  if(lastx > -999){
    line(x,y,lastx,lasty);
}

lastx = x;
lasty = y;
}
}


