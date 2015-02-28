

void setup () {
  size(900,550); 
  colorMode(HSB,900);
  background(0xFFFFFF);
  smooth();
  noStroke();
  fill(#333333);
  
}
int j = 0;
int c = 0;
int margen = 600;
void draw () {
 background(c++,900,900);
 
 translate(width/2,height/2);
  for (int i = 0; i < width; i++){
   pushMatrix();
   rotate(radians(i*j++/20000));
   float a = map(cos(i),-1,1,-20,20);
   float b = map(sin(i),-1,1,-20,20); 
 //  float a = map(cos(i),-1,1,0,height);
 //  float b = map(sin(i),-1,1,0,height);
   //stroke(i,800,800);
   //fill(0x333333);
   ellipse (i,a,25,25);
   //line(i,a,i,b);
   ellipse(i,b,10,10);
   popMatrix();
 }
 if(c > 900){
   c = 0;
 }
}

