
int x=0;
int y=0;

void setup(){
  size (800,600);
  background(255);
  
}

void draw(){
  
while(x < width){
  
   stroke(0);
        line(200,x,700,600);
        line(600,x,100,600);
        line(200,x,100,600);
        line(600,x,700,600);
        line(780,x,700,600);
        line(780,x,1380,600);
        line(20,x,100,600);
        line(20,x,-560,600);
        x=x+20;
        
}}


