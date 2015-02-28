

void setup(){
  size(300,300);
  colorMode(HSB, 360,100,100);
}
void draw(){
  background(0,0,0);
   
  for(int a=0; a<300; a=a+30){
    for(int b=0; b<300; b=b+5){
    float y= sin(radians(a+frameCount)*0.1)*100;
     float z= cos(radians(a+frameCount)*0.1)*100;
    noStroke();
    fill(180,random(100),random(100));
    rect(b,z*2,y*2,300);
  }
}
}

