
float rd = 255;
float gr = 0;
float bl = 0;
float dir = 10;
float x = 0;
float y = 0;

void setup(){
  size(800,400);
  background(0,0,0);
  stroke(255);
}

void draw(){
  if(mousePressed){
  stroke(rd,gr,bl);
  fill(255,255,255);
  x = x + 0.2;
  y = y + 0.2;
  ellipse(mouseX,mouseY,x,y);
  }
  if (rd >= 255 && gr <= 0){
    bl = bl + dir;
  }
  if (gr <= 0 && bl >= 255){
    rd = rd - dir;
  }
  if (rd <= 0 && bl >= 255){
    gr = gr + dir;
  }  
  if (rd <= 0 && gr >= 255){
    bl = bl - dir;
  }
  if (gr >= 255 && bl <= 0){
    rd = rd + dir;
  }
  if (rd == 255 && bl == 0){
    gr = gr - dir;
  }
} 
  
  
void mouseReleased(){
  if (x > 30 && y > 30){
  ellipse(mouseX,mouseY,x,y);
  fill(0,0,255);
  ellipse((mouseX + 10),mouseY, 5,5);
  ellipse(mouseX,mouseY, 5,5);
  fill(255,0,0);
  arc((mouseX + 2), (mouseY + 10), 15, 15, 0, PI/2);
  }
  x = 0;
  y = 0;
}

