
// Tyler Ocwieja
// DMS110
// 2-12-15

int x,y;
float r,g,b; // will be used for colors, use float for random

void setup(){ // executed only once
 size(500,500); 
 frameRate(30);
}

void draw(){ // executed forever
  background(255);
  strokeWeight(5);
  stroke(0);
  line(width/2, 0, width/2, height);  //(point1x ,point1y, point2x, point2y)
  line(0, height/2, width, height/2);
  x = mouseX;
  y = mouseY;
  fill (r,g,b);
  if(x < width/2 && y < height/2){
      fill(r,0,0);
      rect(0,0,width/2, height/2);
    }else if (x < width/2 && y > height/2){
      fill(0,g,0);
      rect(0, height/2, width/2, height/2);
    }else if (x > width/2 && y < height/2){
      fill(0,0,b);
      rect(width/2,0, width/2, height/2);
    }else if (x > width/2 && y > height/2){
      fill(r,g,0);
      rect(width/2,height/2, width/2, height/2);
  } 
}

void mouseClicked(){
r = random(255);
g = random(255);
b = random(255);
}
  
