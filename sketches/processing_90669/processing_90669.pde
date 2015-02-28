
int alpha = 15;
int Color_val = 0;
int xPos = 0;
int yPos = 0;
int draw_pos = 0;

void setup() {  // setup() runs once
  size(400, 400);
  background(255);
  frameRate(500);
}
 
void draw() { 
  if(xPos > width){
    xPos = 0;
    Color_val += 20;
    draw_pos += 1;  
  }
  if(yPos > height){
    yPos = 0;
    Color_val += 20;
    draw_pos += 1;
  }
  if(Color_val > 255){
    Color_val = 0;
  }   
  if (draw_pos > 3){
   draw_pos = 0;
  } 
  strokeWeight(random(10));
  stroke(Color_val,alpha);
  if (draw_pos == 0){
    line(0,yPos,random(width),random(height));
    yPos += 2;  
  }
  if (draw_pos == 1){
    line(xPos,height,random(width),random(height));
    xPos += 2;  
  }
  if (draw_pos == 2){
    line(width,height-yPos,random(width),random(height));
    yPos += 2;  
  }
  if (draw_pos == 3){
    line(width-xPos,0,random(width),random(height));
    xPos += 2;  
  }
}


