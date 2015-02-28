
void setup(){
size(1100,900);
smooth();
 
}
 
void draw(){
  background(255,0,153);
  int R=10;
  ellipseMode(RADIUS);
for (int x=R;x<=width-R;x+=4*R){
  for (int y=R;y<=height-R;y+=4*R){
    float d=dist(x,y,900,150);
    float crece=d/30;
    if(crece>R){
      fill(250, 255,0);
      noStroke ();
        ellipse(x,y,crece,crece);
     }else{
         fill(250, 255,0);
      noStroke ();
       ellipse(x,y,crece,crece);
    }
  }
 }
}


