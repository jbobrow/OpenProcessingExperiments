
float a = 0;
float b = .361;
float aS = .0174;
float bS = .0223;

void setup(){
  size(1200,1000); 
  smooth();
  background(255);
  noFill();
  stroke(0,200);
  frameRate(100);
  
}
 void draw(){
   translate(width/2,height/2);
   translate(cos(a)*500,sin(b)*500);
   ellipse(0,0,100+80*tan(b),100);
   if(frameCount%15==0)   filter(BLUR,1);
   
   
   a+=aS;
   b+=bS;
  println(frameRate);

}

