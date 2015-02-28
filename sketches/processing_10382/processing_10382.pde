
boolean[] keys;
ArrayList balls,removeThese;
int score,highScore;
float diff = 1;
float death;
float raid = 50;
float[][] xs;
PFont scorefont;
boolean lost,drawAvg;
char[] chars = {'0','1','2','3','4','5','6','7','8','9','S','C','O','R','E',':'};
int posy = 240;
boolean twoplay = false;

void setup()
{
  size(320,480);
  lost = false;
  drawAvg = false;
  keys = new boolean[4];
  balls = new ArrayList();
  removeThese = new ArrayList();
  scorefont = createFont("standard 07_53", 12, true, chars);
  textFont(scorefont,12);
}

void draw()
{
  if(lost)
  {
  if(score>highScore)
    highScore = score;
    death = 0;
    raid = 10;
    balls.clear();
    removeThese.clear();
    xs = new float[320/1][2];
    score = 0;
    diff = 0;
    lost = false;
  }
  diff+=.002;
  death+=.02;
  raid+=.04;
  background(150);
  if((int)random(50)<diff)
    balls.add(new Sphere());
  render();
  if(mouseX<death)
    lost = true;
  fill(0);
  translate(320/2, 480/2);
  rotate(4.725);
  textFont(scorefont, 18);
  text("SCORE: "+score,-225,death-145);
  fill(50,50,50,50);
  textFont(scorefont, 175);
  text(highScore,-225,150);
}

void keyPressed()
{
  switch(key)
  {
    case '1': posy = 45; break;
    case 'q': posy = 90; break;
    case 'w': posy = 135; break;
    case 'a': posy = 180; break;
    case 'z': posy = 225; break;
    case 'x': posy = 310; break;
    case 'n': twoplay = true; break;
    case 'm': twoplay = false; break;
  }
}

void render()
{
  noFill();
  ellipse(mouseX,mouseY,40,40);
  for(int i=0;i<balls.size();i++)
  {
    Sphere temp = (Sphere) balls.get(i);
    temp.h = map(dist(temp.pos.x,temp.pos.y,mouseX,480-20),0,200,0,180);
    temp.update(xs);
    for(int x=0;x<=10;x+=10)
      if(dist(temp.pos.x,temp.pos.y,mouseX,mouseY)<temp.radius+20)
        lost = true;
    if(temp.pos.x>320+temp.radius)
    {
      score++;
      removeThese.add(0,i);
    }
  }
  for(int i=0;i<removeThese.size();i++)
  {
    Integer index = (Integer) removeThese.get(i);
    balls.remove(index.intValue());
  }
  removeThese.clear();
  fill(0);
  noStroke();
  rect(0,0,death,480);
  noFill();
  stroke(0);
}

class Sphere
{
  PVector pos,vel,acc;
  float radius;
  float gravity = 0;
  float h;
  Sphere()
  {
    radius = random(10,raid);
    if(twoplay == true){
    pos = new PVector(0,random(posy,posy+10));
    }else{pos = new PVector(0,random(1,mouseY+10));
    
  }
    
    vel = new PVector(random(0,1.5),random(0,1.5));
    acc = new PVector(.25,gravity);
  }
  void update(float[][] inxs)
  {
    pos.add(vel);
    vel.add(acc);
    render();
    if((int)pos.x%1==0 && (int)pos.x>0 && (int)pos.x<320)
    {
      inxs[(int)pos.x/1][0] +=pos.y;
      inxs[(int)pos.x/1][1] ++;
    }
  }
  void render()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    noFill();
    ellipse(0,0,radius,radius);
    popMatrix();
  }
}

