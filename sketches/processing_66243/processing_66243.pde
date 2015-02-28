
int d = 20;
float x = random(d, width);
float y = random(d, height);
float vx = random(10);
float vy = random(10);



void setup(){
  size(500,500);
  fill(#000000);
  ellipse(width/2,height/2,d,d);
  rect(width/2,height/2,100,100);
}

void draw(){
  background(255);
  fill(#000000);
  rect(width/2,height/2,100,100);
  x += vx;
  y += vy;
  if(x>=(width-d) || x<=d){
    vx = -vx;
  }
  if(y>=(height-d) || y<=d){
    vy = -vy;
  }
  if(x>width/2-d && x<width/2+120){
    if(y>height/2-d && y<height/2+120){
      vx = -vx;
    }
  }
  
  if(y>height/2-d && y<height/2+120){
    if(x>width/2-d && x<width/2+120){
      vy = -vy;
    }
  }
  
  ellipse(x,y,d,d);
}

