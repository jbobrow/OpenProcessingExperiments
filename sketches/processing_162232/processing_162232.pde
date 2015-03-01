
size(500,500);
colorMode(HSB,360,100,100);
for (int i=0;i<500;i++){
  float j=map(i,0.0,500.0,0.0,100.0);
  float newHue=200-(j*0.8);
  stroke(newHue,90,80);
  line(i,0,i*1.2,500);
}


