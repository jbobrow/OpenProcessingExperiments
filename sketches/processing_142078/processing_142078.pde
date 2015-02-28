
void setup(){
  size(600,600);
  background(43,217,194);
  noFill();
  frameRate(9);
  stroke(255,0,255);
  strokeWeight(2);
  
  
  
}
int i=0;
int x=0;
int y=0;

void draw(){
  
  i++;
  
  if(i==50){
    i=0;
    x=(int)random(width);
    y=(int)random(height);
  }
    ellipse(x,y,i*50+20, i*50);
    ellipse(x,y,i*50, i*50+20);
    fill(43,217,194,128);
    ellipse(x,y,i*50-200,i*50-200);
    noFill();
   
  
  
}


