
int i,j=0;
void setup(){
  size(600,600);
  background(0);
  frameRate(3080);
  noStroke();
  
  
}
 
void draw(){
   
   stroke(0,255,0);
   line(j,i,300,300);
 
    i+=10;
    if(i>height){
     j=j+10;
     i=0;
    }
    if(j>=width){
      i=0;
      j=0;
    }
    if(key == 't'){
      PImage b = loadImage("trebol.png");
      image(b,0,0,150,150);
    }
  

      while(i!=i);{}   /*bucle infinit*/ 
      
      
    
}    




