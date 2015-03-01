
float a=500;

void setup(){
   
size(600,600);
background(255);
 
}
 
void draw () {
 //left and right "array"?
  for(int y=100; y<500;y= y+height/2){
 for(int x=100; x<500;x= x+width/2){
 
   //mouse press to initiate action
 if (mousePressed == true) {
          
           float sinOfTime = sin( millis() * 0.020 );
           float sinMappedX = map( sinOfTime, 0, -2.0, 0, a);
           float sinMappedY = map( sinOfTime, 0, 2.0, 0, -a);
           
           stroke(mouseX,mouseY,x,y);
     rect(x,y,sinMappedX,sinMappedY);
       }else {
      
     noFill();
  smooth();
  stroke(255);
   rect(width,height,width,height);
       }
}
}
}



