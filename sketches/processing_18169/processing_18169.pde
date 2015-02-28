
float StartAngle = 0;
float AngleBump = 0;
color Color1 = color(180,95,10);
color Color2 = color(255);

void setup(){

  size(255,255);
  smooth();
  colorMode(HSB);

}

void draw(){

  //background(Color2);
 background(255);
  noStroke();
  float radius = width;
  int circleCount = 0;
  
  float angle = StartAngle;
  
  while(radius > 0){
fill(255);
    ellipse(width/2,height/2,radius,radius*height/width);
fill(random(255),100,255,millis()%255);
    arc(width/2,height/2,radius,radius*height/width,angle,angle + PI);
    radius -= (second() + minute() + hour())/4.;
    angle += AngleBump;
  };
  
  StartAngle += 0.02;
  AngleBump += 0.02 + second()/10000.;

}
                                                                
