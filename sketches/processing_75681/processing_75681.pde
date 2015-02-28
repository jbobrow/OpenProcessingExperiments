

float x,y,angle,glowLight;





void setup(){

  size(600,600);colorMode(HSB,360,100,100,100);background(0,0,100);noStroke();


x = 0;
y = 0;
angle = 0;
smooth();
}

void draw(){
   x= 700*cos(radians(angle))*sin(radians(angle))*sin(radians(angle));
   y= 200*sin(radians(angle*10))*cos(radians(angle))*cos(radians(angle));
   y= 20*sin(radians(angle*10))*cos(radians(angle))*cos(radians(angle));
    ellipse(x+width/2,y+height/2,1000,10);
   
    x= 700*cos(radians(angle))*sin(radians(angle))*sin(radians(angle));
   y= 200*sin(radians(angle*10))*cos(radians(angle))*cos(radians(angle));
   y= 20*sin(radians(angle*10))*cos(radians(angle))*cos(radians(angle));
  ellipse(x+width/2,y+height/2,1000,10);
   
    x= 700*cos(radians(angle))*sin(radians(angle))*sin(radians(angle));
   y= 200*sin(radians(angle*10))*cos(radians(angle))*cos(radians(angle));
   y= 20*sin(radians(angle*10))*cos(radians(angle))*cos(radians(angle));
   ellipse(y+width/2,x+height/2,200,10);
 glowLight = abs(100* sin (radians(angle)));
 fill(glowLight*3,100,100,30);
 ellipse(width/2,height/2,190,190);
 angle +=.1;
 
}


//x= radius *sin (radians());
//y= radius *sin (radians());


