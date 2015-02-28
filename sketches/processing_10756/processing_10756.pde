
float c;

   float t=0;
void setup(){
    background(0);
  size(400,400,P3D);
 colorMode(HSB);
 smooth();

}

void draw(){

  

 c=random(255);

  
  translate(width/2,height/2);

  rotate(t);
  t-=0.1;
  stroke(c,255,255);
  line(t,50,300,300);
   
}
void mousePressed(){
  noLoop();
}
void mouseReleased(){
 loop(); 

}

