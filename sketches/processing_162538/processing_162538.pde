
size(700,100);
colorMode(HSB,360,100,100);
for (int i=0;i<700;i++){
  float j=map(i,0.0,500.0,0.0,100.0);
  float newHue=280-(j*0.6);
  stroke (newHue,110,80);
  line(i,0,i,500);
}

smooth();
strokeWeight(2);
float offset=126.0;
float scaleVal=126.0;
float angleInc=0.42;
float angle=0.0;
for (int x=-52;x<=width;x+=5){
  float y=offset+(sin(angle)*scaleVal);
  stroke(y*2,(y+20)/2,(200-y)/2,100);
  line(x,0,x+50,height);
  angle +=angleInc;
}


