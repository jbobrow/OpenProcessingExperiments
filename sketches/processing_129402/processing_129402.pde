
int x=0;
int y=0;

void setup(){

size(700,700);
background(255);
noLoop();
}
void draw(){
  while( y < height){
     
    fill (255, random(0,255), random(0,225), random(50,170));
    noStroke();
      while(x < width){
        noStroke();
        rect( random(0,700), random(0,700), random(10,100), random(10,100));
        stroke(255);
        
        x=x+20;
         
      }
       
   y=y+30;
   x=0;
  
    
  }
while(x < 350){
  line(0,350-x,0+x,0);
  line(0,350+x,0+x,700);
  line(0+x,350,350,350-x);
  line(350,700-x,350-x,350);
  x=x+10
  ;
}
x=0;
while(x < 350){
line(350+x,0,700,0+x);
line(700,350+x,700-x,700);
line(350,350+x,700-x,350);
line(350,0+x,350+x,350);
x=x+10;
}
x=0;

}


