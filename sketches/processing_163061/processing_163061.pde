
int w = 800;
int h = 800;
int r = 5;
int xVal = 5;
int yVal = 5;
float angle = 0.0;
float offset = 500;
float scalar = 141.3;
float speed = 0.07;

void setup()
{
size(w,h);
background(0);
noStroke();
frameRate (15);
}
  
void draw()
{
fill(0);
rect(300,300,700,700);

for(int y = -250; y < h+250; y = y+50)
{
  for (int x = -50; x < w+50; x = x+50)
{
  fill(random(0,255));
  stroke(0);
  ellipse (x+14, y+14, r, r); //stars
}
}
    float x = 550 + cos(angle) * scalar;
    float y = 440 + sin(angle) * scalar;       
    fill(150,35,206);
    ellipse(x, y, 45, 45); //planet's purple moon
    
    float k = 530 + cos(angle*2) * scalar+25;
    float l = 430 + sin(angle*2) * scalar+25;        
    fill(21,205,206);
    ellipse(k, l, 20, 20); //planet's blue moon
    angle+=speed;
    fill(random(0,45),0,0,25);
    rect(0, 0, width, height);
    noStroke();
    fill(250,205,40); 
    ellipse(600-frameCount*2, frameCount*2, 5, 5); //shooting star going down
  
      smooth();
      fill(137,172,227);
    ellipse(550, 440, 125, 125); //planet
    
      noStroke();
    fill(250,205,40); 
    ellipse(650-frameCount*3, 850-frameCount*2, 7, 7); //shooting star going up
    
    


}
 
