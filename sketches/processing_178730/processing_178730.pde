
Ball b;
ArrayList<Ract> sawg = new ArrayList<Ract>();
boolean keyup,keyleft,keyright,keyspace,keydown;
void setup()
{
  size(700,700);
  b = new Ball(200,200,5,1);
  for(int i = 0;i < 10;i++){
    sawg.add(new Ract());
  }
}

void draw()
{
  background(0);
  b.drawBall();
  for (int i = 0; i < sawg.size(); i++){
    Ract r = sawg.get(i);
    r.Draw();
   if (keyleft)
  { 
    if(r.xp > 0){
      r.xp -= 10;
    }
  }
  if (keyright)
  {
    if(r.xp < width - r.sizet){
      r.xp += 10;
    }
  }
  if (keyup)
  {
    if(r.yp > 0){
       r.yp -= 10;
    }
  }
  if (keydown)
  {
    if(r.yp < height - r.size){
       r.yp += 10; 
    }
  }
  }
}

void keyPressed()
{
  if (keyCode == UP)   keyup = true;
  if (keyCode == LEFT) keyleft = true;
  if (keyCode == RIGHT)keyright = true;
  if (keyCode == DOWN) keydown = true;
  if (key == ' ')      keyspace = true;
}
void keyReleased()
{
  if (keyCode == UP)   keyup = false;
  if (keyCode == LEFT) keyleft = false;
  if (keyCode == RIGHT)keyright = false;
  if (keyCode == DOWN) keydown = false;
  if (key == ' ')      keyspace = false;
}

class Ball
{
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float s;
  
  Ball(float x, float y, float xv, float yv)
  {
    xpos = x;
    ypos = y;
    xvel = xv;
    yvel = yv;
    s = 30;
  }
  
  void drawBall()
  {
    xpos += xvel;
    ypos += yvel;
    
    if ((xpos < 0) || (xpos > width))  xvel *= -1;
    if ((ypos < 0) || (ypos > height))  yvel *= -1;
    
    fill(#8CAEB2);
    noStroke();
    ellipse(xpos,ypos,s,s);
  }
  float calculateDistance(float dx,float dy){
    //println(str(sqrt(pow(xpos - dx,2) + pow(ypos - dy,2))) + " " + str(dist(xpos,dx,ypos,dy)));
     return sqrt(pow(xpos - dx,2) + pow(ypos - dy,2));
     //return dist(xpos,dx,ypos,dy);
  }
}

class Ract{
  float xp;
  float yp;
  float size;
  float sizet;
  color c;
  color oldc;
  Ract(){
    xp = random(width);
    yp = random(height);
    size = random(20,40);
    sizet = random(40,20);
    c = color(random(255),random(255),random(255));
  }
  void Draw(){
    
    if(b.calculateDistance(xp,yp) < 30)
    {
       fill(255,0,0);
       stroke(255,0,0);
    } else { 
      fill(c);
      stroke(c);
    }
    rect(xp,yp,sizet,size);
  
  }
}
