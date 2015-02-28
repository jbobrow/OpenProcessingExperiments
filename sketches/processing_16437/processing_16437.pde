
/* 
 [][][][][][][][][][][][][][][]Snake5 
 use W/S/A/D to control your snake 
 vinjn.z@gmail.com 
 */

float s = 6;//default moving speed of snake 
float r = 14;//the size 
ArrayList snake = new ArrayList(); 
PVector food = new PVector(); 
PVector vel = new PVector(s,0); 
PVector prev_food = null;
float FADE_MAX = 30.0;
int fade_count = (int)FADE_MAX;

void newFood() 
{ 
  prev_food = food;
  food = new PVector(random(width), random(height));
} 

void draw_food(PVector pos, float rad)
{
    fill(color(0,122,200));
    noStroke(); 
    rect(pos.x, pos.y, rad,rad); 
    noFill();
    stroke(0);
    strokeWeight(1); 
    rect(pos.x, pos.y, rad*1.3,rad*1.3);
}
    
void setup() 
{ 
  //some boring setup 
  size(400, 400); 
  smooth(); 
  frameRate(30); 
  rectMode(CENTER); 

  snake.add(new PVector(width/2, height/2));//the first one is the HEAD 
  snake.add(new PVector());//body 1 
  snake.add(new PVector());//body 2 
  newFood();
} 

void draw() 
{ 
  background(200); 

  if (prev_food != null)
  {
    fade_count --;
    float fade_r = r*1.5f/FADE_MAX*fade_count;
    draw_food(prev_food,fade_r);
    if (fade_count < FADE_MAX*0.4)
    {
      prev_food = null;
      fade_count = (int)FADE_MAX;
    } 
  }

  //keyboard w/s/a/d
  if (keyPressed)
  {
    if (vel.x == 0) 
    { 
      if (key == 'a') 
        vel = new PVector(-s,0); 
      else if (key == 'd') 
        vel = new PVector(s,0);
    } 
    if (vel.y == 0) 
    { 
      if (key == 'w') 
        vel = new PVector(0,-s); 
      else if (key == 's') 
        vel = new PVector(0,s);
    }
  }

  //[update & draw snake's head] 
  PVector head = (PVector)snake.get(0); 
  head.add(vel); 
  if (head.x > width) head.x -= width; 
  else if (head.x < 0) head.x += width; 
  if (head.y > height) head.y -= height; 
  else if (head.y < 0) head.y += height; 

  fill(color(200,0,0));
  stroke(0);
  strokeWeight(3); 
  ellipse(head.x, head.y, r*1.5,r*1.5); 

  //[update & draw snake's bodies] 
  for (int i=snake.size()-1;i>0;i--) 
  { 
    PVector cur = (PVector)snake.get(i); 
    fill(color(100));
    noStroke(); 
    ellipse(cur.x, cur.y, r,r); 
    noFill();
    stroke(0);
    strokeWeight(1); 
    ellipse(cur.x, cur.y, r*1.3,r*1.3); 

    //make latter ones follow previous ones 
    PVector prev = (PVector)snake.get(i-1); 
    cur.x = prev.x; 
    cur.y = prev.y;
  } 
  if (head.dist(food) < r)//if near enough, EAT the food 
  { 
    snake.add(new PVector(head.x, head.y));//Yummy!! 
    newFood();//giv me more food!!
  } 
  else 
  {//just draw the food 
    draw_food(food, r);
  }
}
                
