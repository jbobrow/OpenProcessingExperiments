
/*
 * Curve Snake
 * (c) Andy Wallace
 * 2010
 *
 * Snake game with curves and some light psychedelia
 * Arrow keys move the snake
 */
 

Snake snake;
Food food;

//score info
int score=0;
ArrayList<Score> scores;  //possible to display more than one score if the player is quick
int finalScore=0;
float finalScoreAlpha=0;


//particles
ArrayList<Particle> particles;

//keys
boolean left=false;
boolean right=false;
float turnSpeed=0.1;

//background color
float bR, bG, bB;
float colorSpeed=2;  //how quickly the color changes

//spacing
float border=3;

void setup(){
  smooth();
  size(500,500);
  
  snake=new Snake();
  food=new Food();
  particles=new ArrayList<Particle>();
  scores=new ArrayList<Score>();
  
  //start the background color
  setBgColor();
}

void draw(){
  setBgColor();
  background(bR,bG,bB);
  //draw a white square over it to tint the color
  fill(255,200);
  rect(0,0,width,height);
  
  //draw the border
  fill(0);
  rect(0,0,border,height);
  rect(0,0,width,border);
  rect(width-border,0,border,height);
  rect(0,height-border,width,border);
  
  //check the keys
  //create particles
  if (left || right)
    particles.add(new Particle(snake.getX(), snake.getY(), snake.getA()-PI));
    
  //move the snake
  if (left)
    snake.turn(-turnSpeed);
  if (right)
    snake.turn(turnSpeed);
  
  
  //update/draw the parts
  if (finalScoreAlpha<=0){
    snake.update();
    food.display();
    for (int i=particles.size()-1; i>=0; i--){
      particles.get(i).update();
      if (particles.get(i).killMe)  particles.remove(i);
    }
  }
  
  
  //did the snake it the food
  if (dist(snake.getX(),snake.getY(), food.getX(),food.getY()) < food.getR()){
    //grow the snake
    snake.grow();
    //reset the food
    food.reset(); 
    //increase score
    score++;
    //create the display object for the score
    scores.add(new Score(score));
  }
  
  //is the snake dead?
  if (snake.dead){
    snake.dead=false;  //turn off the flag
    reset();
  }
  
  //show score
  for (int i=scores.size()-1; i>=0; i--){
    scores.get(i).update();
    //kil it if it is off screen
    if (scores.get(i).getY()>height+100)
      scores.remove(i);
  }
  
  //display final score if it is still visible
  textSize(400);
  fill(0,finalScoreAlpha);
  finalScoreAlpha-=2;
  text(finalScore,0,380);
    
  
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
  //set background as the opposit color of the snake
  if (bR>(snake.getCR()+126)%155)  bR-=colorSpeed;
  else                   bR+=colorSpeed;
  if (bG>(snake.getCG()+126)%155)  bG-=colorSpeed;
  else                   bG+=colorSpeed;
  if (bB>(snake.getCB()+126)%155)  bB-=colorSpeed;
  else                   bB+=colorSpeed;
  
}

//resets the game
void reset(){
  finalScore=score;
  finalScoreAlpha=200;
  score=0;         //reset score
  scores.clear();  //remove the score displays
  food.reset();    //put the food in a new place
}




