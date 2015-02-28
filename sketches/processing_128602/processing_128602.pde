
int x=0;
int y=0;



void setup(){
  size (800,600);
  background(255);
  
}

void draw(){
  
  while( y < height){
    
    fill (random(0,255), random(0,255), 255, random(0,170));
    noStroke();
      while(x < width){
        noStroke();
        rect( random(100,600), random(100,450), random(10,100), random(10,100));
        stroke(255);
        line(200,x,700,600);
        line(600,x,100,600);
        line(200,x,100,600);
        line(600,x,700,600);
        x=x+20;
        
      }
      
   y=y+30;
   x=0;
 
   
  }
}


