
Flappy bird;
Pipe pipe;
ArrayList pipes,blocks;
int score = 0;
int hi_score = 0;
PFont font;
void setup()
{
  // font = loadFont("GillSans-48.vlw");
  font = createFont("GillSans", 48);
  size(1000, 600); 
  bird = new Flappy();  
  pipe = new Pipe();
  pipes = new ArrayList();
  blocks = new ArrayList();
  
  for(int i = 0;i < 80;i++)
  blocks.add(new Block());
  
  pipes.add(new Pipe());
}

void draw()
{
  background(#7AA1AF);
  fill(255);
  // pipe.update();
  // pipe.collide(bird.pos);
  // pipe.display();

for(int i = 0; i < blocks.size();i++)
{
 Block b = (Block) blocks.get(i);
b.update();
b.display();
}

  if (frameCount % 100 == 0)
    pipes.add(new Pipe());

  for (int i = 0; i < pipes.size (); )
  {
    Pipe p = (Pipe) pipes.get(i);
    if (p.pos.x < 0)
    {
      pipes.remove(i);
    } else
    {
      p.update();

      p.collide(bird.pos);
      if (p.collided)
        game_over();
      p.display(); 
      if (p.pos.x < bird.pos.x && !p.scored)
      {
        score++;
        p.scored = true;
      }
      i++;
    }
  }
  if (score > hi_score)
    hi_score = score;
  fill(255);
  bird.update();
  bird.display();
  if (bird.pos.y > height)
  {
    bird.pos.y = height/2-40;
    bird.vel.y = 0;
    game_over();
  }


pushMatrix();
scale(.5);
  fill(255, 160);
  rect(0, 0, 430, 55);
  translate(-20,0);
  fill(10);
  textFont(font, 32);
  text("score: ", 50, 50);
  fill(94, 93, 121);
  textFont(font);
  text(score, 150, 50);

  textFont(font, 32);
  fill(10);
  text("hi score: ", 215, 50);

  fill(94, 93, 121);
  textFont(font, 48);
  text(hi_score, 350, 50);
  popMatrix();
}

void game_over()
{
  background(255, 0, 0);
  pipes = new ArrayList();
  score = 0;
}
void keyPressed()
{
  bird.flap();
}



class Flappy
{
  PVector pos, vel;
  float grav;
  Flappy()
  {
    pos = new PVector(200, height/2, 0);
    vel = new PVector(0, 0, 0);
    grav = .41;
  }
  void update()
  {

    vel.y+=grav;
    vel.limit(10);
    pos.add(vel);
  }
  void flap()
  {
    vel.y = -8;
    //println("flapping");
  }
  void check_collisions()
  {
  }

  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    ellipse(0, 0, 30, 30);
    popMatrix();
  }
}



class Pipe
{
  PVector pos;
  float opening;
  float p_wide = 100;
  boolean scored = false;
  boolean collided = false;
  Pipe()
  {
    pos = new PVector(width+p_wide, random(height*.2, height*.8), 0);
    opening = 70;
    rectMode(CORNERS);
  } 

  void update()
  {
    pos.x-=3;
    if (pos.x < -p_wide)
      reset();
  }
  void reset()
  {
    pos.x = width+p_wide; 
    pos.y = random(height*.2, height*.8);
    collided = false;
  }

  void collide(PVector b_pos)
  {
    float y1 = pos.y-opening;
    float y2 = 0;
    if (pos.x-b_pos.x < p_wide && pos.x > b_pos.x && abs(pos.y-b_pos.y) > opening-15)
      collided = true;
  }
  void display()
  {
    rectMode(CORNERS);
    fill(#679D76);
    if (collided)
      fill(128, 0, 0);

    rect(pos.x-(p_wide), 0, pos.x, pos.y-opening);
    rect(pos.x-p_wide, pos.y+opening, pos.x, height);
  }
}

class Block
{
 PVector pos;
  float depth,w,h;
 Block()
{
 pos = new PVector(random(width*2),random(height),0);
 depth = random(0,1);
 w = depth*700;
 h = w;
 
 
}
void update()
{
 pos.x-=depth;

  if(pos.x < -w)
   pos.x = width+w;
   
  
}
  void display()
  {
   fill( 173,232,252,40);
   noStroke();
   rectMode(CENTER);
   rect(pos.x,pos.y,w,h);
    
  }
}



