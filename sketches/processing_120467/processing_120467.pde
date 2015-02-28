

float hue=0;

void setup(){
 size(300,300); 
 colorMode(HSB);
 noStroke();
}

void draw(){
  fill(hue,255,255);
  rect(0,0,width,height);
  hue++;
  if(hue>255) hue=0;
}


