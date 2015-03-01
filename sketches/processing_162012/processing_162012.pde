
void setup(){
 size(400,400); 
 frameRate(30);
}

void draw(){
  noStroke();
  fill(255,255);
 rect(0,0,width,height);
 
 for( int i = 0; i<1000; i++){
   fill(cos(frameCount * 0.5)*255);
   fill(0, 0, 127);
   ellipse((cos(frameCount*0.1 +i)*width/2.5)+ (width/2) ,(sin(frameCount*0.2+i)*width/2.5)+ (width/2),20,20);
   
 }
}
