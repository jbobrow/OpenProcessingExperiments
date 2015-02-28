
void setup(){
  size(100,100);
  colorMode(HSB);
 
}
 void draw(){
  background(0);
  noStroke();
  rotate(radians(100));
  translate(50,50);
  for(int x=0; x<200; x=x+0.5){
  float y=sin(radians(x+frameCount))*1.5*520+110;
  fill(random(100,10),180, 255, 50);
     triangle(x+10,1,x+100,10, y,y);
 }
}
 
                
                                                                
