
void setup()
{
  size(700,600);
  smooth();
  frameRate(200);
  noStroke();
}

float pos = 0;
float spikeHeight;
int width = 800;
float pt;

void draw()
{
  
  //background(255);
  fill(0,0,0, 5);
  rect(0,0,700,600);
  fill(255);
  float heartSpeed = map(mouseX, 0, 700, 1, 9);
  pos = pos + heartSpeed;
  //ellipse(pos, 300, 25,25);
  //line(0, 300, pos, 300);
  
   if(pos >= 200 & pos <= 300)
  {
    spikeHeight = spikeHeight + 2;
    //line(pos,300, pos,spikeHeight);
    fill(255);
    ellipse(pos,300-spikeHeight,10,10);  
  }
  else if(300 < pos && pos <= 400)
  {
    spikeHeight = spikeHeight - 3;
    ellipse(pos,300-spikeHeight,10,10);
  }
  else if(400 < pos && pos <= 500)
  {
    spikeHeight = spikeHeight + 1;
    ellipse(pos,300-spikeHeight,10,10);
  }
  else if(mouseX > 500 )
  {
    spikeHeight = spikeHeight + random(10,20);
    ellipse(pos,300-spikeHeight, 10,10);
    spikeHeight = spikeHeight - random(10,20);
    ellipse(pos,300-spikeHeight, 10,10);  
    fill(255,0,0);
    stroke(255,0,0);
    pt = random(0,700);
    line(pt, 0, pt, 600);
    noStroke();
    textSize(100);
    text("WARNING!", 100, 100); 
  }
  else
  {
    ellipse(pos, 300, 10,10);
  }
  
  if(pos > width) {
    pos = 0;
    spikeHeight = 0;
  }

}
