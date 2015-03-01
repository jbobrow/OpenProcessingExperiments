
Maxim maxim;
AudioPlayer player;

void setup()
{
  size(1024, 512);
  background(0);
  maxim = new Maxim(this);
  player = maxim.loadFile("rain.wav");
  player.setLooping(true);
  
  rectMode(CENTER);
}

void draw()
{
  ellipse(0, 0, 30, 30);            
  fill(255, 200, 200, 100);
}

void mouseDragged()
{ 
  float green = map(mouseX, 0, width/2, 0, 100);        
  float blue = map(mouseY, 0, height/2, 0, 255);        
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  
  player.play();   
  player.volume(mouseX/width);
  
  float alpha = map(speed, 0, 20, 0, 5);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 0, 5);
  
  stroke(0, green, blue, 125);
  strokeWeight(lineWidth);
  
  flow(mouseX, mouseY, speed, speed, lineWidth);      
  spray(mouseX, mouseY, speed, speed, lineWidth);      
}

void flow(int x,int y, int px, int py, int lineWidth) 
{
  strokeWeight(lineWidth);
  line(x,y,px,py); 
  
  return;
}

void spray(int x,int y, int px, int py, int lineWidth) 
{
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  point(0+random(50),0+random(50),10,10); 
  popMatrix();
  return;
}





