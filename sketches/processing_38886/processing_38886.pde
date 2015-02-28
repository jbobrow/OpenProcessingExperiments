
float time =0.0;
float increment = 0.01;
int x;
int y;

void setup(){
  size(450,450);
  smooth();
}
    
void draw(){
  background(255);
 noStroke();
  
  float n = noise(time)*60;
  time+=increment;
  
  fill(0,60);
  for(int x=20;x<width;x+=50){
    for(int y=20;y<height;y+=50){
  ellipse(x,y,random(n),n);
    }
  }
}

                
                
