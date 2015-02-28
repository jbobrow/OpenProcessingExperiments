
int levels=10;
int numColumns=20;
float w;
float h;

void setup() {
  size(500,200);
  w=width/2.;
  h=height/2.;
  colorMode(HSB,1);
}

void draw() {
  
  background(0);
  for (float i=0; i<levels; i++) {
     for(float n=0; n<numColumns; n++) {
        float x=lerp(w,(lerp(0,width,n/numColumns)+millis()/15.)%width,(i+10)/levels);
        float y=lerp(0,sin(millis()/500.)*h,(i+1)/levels); 
        stroke(x/width/1,1,i/levels);     
        line(x,h-y,x,h+y);
     } 
  }
}


