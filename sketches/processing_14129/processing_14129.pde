
void setup(){
  size(360,200);
  colorMode(HSB);

}
 void draw(){
  background(0);
  noStroke();
  rotate(radians(20));
  translate(30,0);
  for(int x=0; x<400; x=x+20){
  float y=sin(radians(x+frameCount))*1.5*150+30;
  fill(random(10,50),200,255,100);
  rect(x+80,90,y,y);
 }
}

                
                
