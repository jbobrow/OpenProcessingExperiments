
String hw="hungry wednesday";
float d=100;

void setup(){
  size(600,600);
  colorMode(HSB,360,100,100);
  frameRate(10);
}

void draw(){
  
  float spectrum = map(mouseX, 0,width,0,360);
  background(spectrum,20,100);
  
  for(float i=0; i<50; i++){
    for (float x=0;x<width;x+=d){
      float y=random(0,height);
      float textsz=random(10,48);
      int substrbegin = (int)random(0,hw.length()-1);
      int substrend = (int)random(substrbegin, hw.length());
      
textSize(textsz);
text(hw.substring(substrbegin,substrend), x,y);
    }
  }
}

