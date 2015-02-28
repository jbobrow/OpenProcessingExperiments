
           
int a=0;
void setup(){
  size(360,200);
  colorMode(HSB);
}
void draw(){
  background(255);
 for(int x=0; x<360; x=x+10){
 strokeWeight(3);
 stroke(x,200, 255);
 float y=sin(radians(x+a)*30)*10+mouseY;//150
 line(x,100,x,y);
 ellipse(100,100,10,10);
 
 }
 a=a+2;
println(frameCount);
}



                                
