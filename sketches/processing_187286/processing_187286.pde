
void setup(){
  
 size( 600, 600);
 colorMode(HSB) ;
}
void draw(){
 
for (int i =0; i <1000; i= i+1) {
  float x =random ( width);
float y =random ( height);
float d =dist(x,y, 300, 300);
float t =random (d);
stroke(t, 255, 255);
point( x, y);
}
}
