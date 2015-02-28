
int x=0;
int y=0;



void setup(){
  size (800,600);
  background(255);
  
}

void draw(){
  
  while( y < height){
    
    fill (255, random(0,255), random(0,225), random(50,170));
    noStroke();
      while(x < width){
        noStroke();
        rect( random(100,600), random(100,450), random(10,100), random(10,100));
        stroke(255);
       
        x=x+20;
        
      }
      
   y=y+30;
   x=0;
 
   
  }
}


