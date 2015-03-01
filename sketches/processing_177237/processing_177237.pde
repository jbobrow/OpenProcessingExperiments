

float x;
float ypos = 0;

float col = 0;

int count = 1;

void setup(){
  size(500, 500);
  smooth();
  noStroke();
  frameRate(400);
  fill(255);
  rect(0, 400, width, height-400);
  x = 0;
}

void draw(){
  el(x);
  if(x>width){
    x = 0;
    count++;
  }
   }

void el(float xpos){
  
  ellipse(xpos, ypos, 30, 30);
  col += 0.1;
  ypos+=5;
  
  if(ypos>500-count*100){
    rect(0, 400, width, height-400);
    ypos = 0;
    if(count%3 == 1){
    fill(250-x*0.5, 0, 0);
    x+=10;
    }else if(count%3 == 2){
      fill(0, 250-x*0.5, 0);
      x+=10;
    }else if(count%3== 0){
        fill(0, 0, 250-x*0.5);
        x+=10;
      }
  }
  
}

 


