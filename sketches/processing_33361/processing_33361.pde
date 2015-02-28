
//variables
int x=10;
int y=0;
 
void setup(){
  size(200,300);
  noStroke();
  smooth();
  frameRate(50);
}
 
void draw(){
  background(0);
  for (int i=10; i<=width; i+=25){
    
    float colorValor = map(i,0,width,0,255);
    
    fill(colorValor,0,0,100);
    ellipse(x*4,i*1.4,i/3,i/3);
    
    fill(0,colorValor,0,200);
    ellipse(x*2,i*2,80,80);
    
    fill(00,00,colorValor,200);
    ellipse(x*3,i*2,60,60);
  }
  x++;
  if ((x*2)-50 > width){
    x=0;
  }
  
}



