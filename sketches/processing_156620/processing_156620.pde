


int diameter=200;//diameter
float a=50;
float b=300;
void setup(){
  
size(600,600);
background(90,79,253);

}

void draw () {
 for(int y=150; y<550;y= y+ diameter/2){
   for(int x=150; x<550;x= x+ diameter/2){
       if (mousePressed == true) {
         
           float sinOfTime = sin( millis() * 0.007 );
          float sinMappedX = map( sinOfTime, -1.0, 1.0, a, b);
           float sinMappedY = map( sinOfTime, -1.0, 1.0, a, b);
           float sinMappedC =map(sinOfTime,-1.0,1.0,0,255);
           stroke(mouseX,mouseY,sinMappedC);
     ellipse(x,y,sinMappedX,sinMappedY);
       }else {
     
  
     noFill();
  smooth();
  stroke(253,230,79);
   ellipse(x,y,diameter,diameter);
       }

}
}
}




