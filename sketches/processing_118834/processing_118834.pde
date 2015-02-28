
int smileyY = 256;
int smileyX = 256;
  color smileyColor = color(0);
color smileyColor1 = color(255,255,0)
void setup(){
  size(512, 512);
  background(255);
}
 
void draw(){
  if(!keyPressed) return;
 // Allows the Smiley to move
 
  
  if(key == 'q'){
    smileyX=smileyX -4;
    smileyY=smileyY -4;
  }

  if(key == 'r') smileyX=256;
  if(key == 'r') smileyY=256;
  
 //Sets a limit on where the smiley can travel 
  if(smileyX< -30 ) smileyX= 512;
  if(smileyX> 523 ) smileyX= -30;
  if(smileyY< -20 ) smileyY= 520;
  if(smileyY> 520 ) smileyY= -20;
  if(mouseClicked(smileyColor1=smileyColor));
  

  
  
  drawSmiley(smileyX, smileyY);
}
void drawSmiley(int x, int y)
{
  // Draw the string
   clear();

  // Draw a Balloon
  noStroke(); // Do not draw an outline of the balloon
  fill(smileyColor1); // The color of the balloon
   ellipse(x, y, 80, 80);
  
  fill(4, 0, 0); // The color of the balloon
  ellipse(x+14, y, 10, 10);
  
  fill(4, 0, 0); 
  ellipse(x-14, y, 10, 10);
  
  

  stroke(0);  // The color of the string
  strokeWeight(3); // The thickness of the string
  line(x-10, y+20, x+10, y+20);
  
  stroke(0);  // The color of the string
  strokeWeight(3); // The thickness of the string
  line(x-10, y+15, x+10, y+15);
  
  stroke(0);  // The color of the string
  strokeWeight(3); // The thickness of the string
  line(x-10, y+15, x+10, y+15);
  
}
