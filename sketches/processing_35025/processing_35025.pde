
float X;

void setup(){
 size(600,400);
 background(255);
 X=0;
}

void draw(){
 if(mouseButton==RIGHT){
  background(255);
 }
 stroke(random(100,200),0,0,30);  
  switch(key){
  case'r':
   stroke(random(100,200),0,0,30);  
  break;
  
  case'g':
    stroke(0,random(100,200),0,30);  
  break;
  
  case'b':
     stroke(0,0,random(100,200),30);  
  break; 
 } 
}

void mouseDragged(){
 X+=3;
 if(X>height) X=0;
 noFill(); 
 strokeWeight(2);
 bezier(0,X,mouseX,mouseY,mouseX,mouseY,width,X);
}               
                                                                                                                                                                                                                
