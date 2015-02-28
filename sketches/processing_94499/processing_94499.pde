

Snake snake;
Snake snake_2;
Food food;

int score=0;
ArrayList<Score> scores;
int finalScore=0;
float finalScoreAlpha=0;

boolean left=false;
boolean right=false;
float turnSpeed=0.1;


float bR, bG, bB;
float colorSpeed=2;

float border=3;

void setup(){
  smooth();
  size(500,500);
  
  snake_2= new Snake();
  snake=new Snake();
  food=new Food();
  scores=new ArrayList<Score>();
  
  setBgColor();
}

void draw(){
  setBgColor();
  background(bR, bG, bB);
  fill(255,200);
  rect(0,0,width,height);
  
  fill(0);
  rect(0,0,border,height);
  rect(0,0,width,border);
  rect(width-border,0,border,height);
  rect(0,height-border,width,border);

  if (left)
    snake.turn(-turnSpeed);
  if (right)
    snake.turn(turnSpeed);
  
  switch (key) {
    case 'a':
      snake_2.turn(-turnSpeed);
      break;
    case 'd':
     snake_2.turn(turnSpeed);
      break;     
   }
  
  if (finalScoreAlpha<=0){
    snake.update();
    snake_2.update();
    food.display();
  }
  
 
  if (dist(snake.getX(),snake.getY(), food.getX(),food.getY()) < food.getR()){
    food.reset(); 
    score++;
    scores.add(new Score(score));
  }
  
  if (snake.dead){
    snake.dead=false;
    reset();
  }
  if (snake_2.dead){
    snake_2.dead=false; 
    reset();
  }
  
  for (int i=scores.size()-1; i>=0; i--){
    scores.get(i).update();
    if (scores.get(i).getY()>height+100)
      scores.remove(i);
  }
  
  String str = "Wait for Start";
  textSize(40);
  fill(0,finalScoreAlpha);
  text(str,width/2 - 150,height/2 - 50);
  fill(0,finalScoreAlpha);
  finalScoreAlpha-=2;
  text(finalScore,width/2 - 150,height/2);
    
  
}


void keyPressed(){
  if (keyCode==37)  left=true;
  if (keyCode==39)  right=true;
}

void keyReleased(){
  if (keyCode==37)  left=false;
  if (keyCode==39)  right=false;
}


void setBgColor(){
  if (bR>(snake.getCR()+126)%155)  bR-=colorSpeed;
  else                   bR+=colorSpeed;
  if (bG>(snake.getCG()+126)%155)  bG-=colorSpeed;
  else                   bG+=colorSpeed;
  if (bB>(snake.getCB()+126)%155)  bB-=colorSpeed;
  else                   bB+=colorSpeed;
  
}


void reset(){
  finalScore=score;
  finalScoreAlpha=200;
  score=0;
  scores.clear();  
  food.reset();    
}



class Food{
  private float x,y;
  private float r = 20;
  
  public float getX()  {return x;}
  public float getY()  {return y;}
  public float getR()  {return r;}
  
  public Food(){
    reset();
  }
  
  public void display(){
    fill(0,155);
    ellipse(x,y,r,r);
  }
  
  public void reset(){
    x=random(r+border,width-r-border);
    y=random(r+border,height-r-border);
    r = 20;
  }
  
}
class Score{
  private int val;
  private float x,y;
  private float alph;
  
  public float getY() {  return y;}
  
  public Score(int _val){
    val=_val;
    x=random(10,width-150);
    y=-50;
    alph=70;
  }
  
  public void update(){
  }
}
class Snake{
  ArrayList<PVector> points;
  
  private float a;
  private float x,y; 
  private float speed=2.5;
  
  private float pDist=30;
  
  private boolean growing=false;
  private int growTimer=0;
  
  public boolean dead=false;
  
  private float cR,cG,cB;
  
  
  public float getX()  {return x;}
  public float getY()  {return y;}
  public float getA()  {return a;}
  public float getCR()  {return cR;}
  public float getCG()  {return cG;}
  public float getCB()  {return cB;}
  
  public Snake(){
    points=new ArrayList<PVector>();
    reset();
    
  }
  
  public void update(){
    float lastX=points.get(points.size()-1).x;
    float lastY=points.get(points.size()-1).y; 
    points.get(0).set(x,y,0);
    for (int i=points.size()-1; i>0; i--){
       points.get(i).set(points.get(i-1).x,points.get(i-1).y,0);
    }
    
    x+=speed*cos(a);
    y+=speed*sin(a); 
    
    if (growing){
      points.add(new PVector(lastX,lastY));
      if (--growTimer==0) 
        growing=false;
    }
   
    if (checkDeath())
      reset();
    display();
  }

  public void  turn(float x){
    a+=x; 

  }

  public void  grow(){
    growing=true;
    growTimer+=pDist;
  }

  public void display(){
    stroke(0);
    strokeWeight(1);
    line(x,y, points.get(0).x,points.get(0).y); 
    for (int i=0; i<points.size()-1; i++)
      line(points.get(i).x,points.get(i).y,points.get(i+1).x,points.get(i+1).y);

   noStroke();
    fill(cR,cG,cB,40);
    beginShape();
    vertex(x,y);
    endShape(CLOSE);
    
  }
  
  public boolean checkDeath(){
    if (x>width-border || x<border || y>height-border || y<border)
      return true;
      
    float minDist=speed*0.9;
    for (int i=0; i<points.size(); i++){
      if (dist(x,y,points.get(i).x,points.get(i).y)<minDist)
        return true;
    }

    return false;
  }
  
  public void reset(){
    dead=true;
    points.clear();

    a=random(TWO_PI);
    x=width/2;
    y=width/2;

    cR=random(255);
    cG=random(255);
    cB=random(255);

    for (int i=0; i<pDist*2; i++)
      points.add(new PVector( x+i*cos(a-PI), y+i*sin(a-PI)) );
  }

}


