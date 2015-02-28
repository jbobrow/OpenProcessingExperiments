
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
float targetX = random(600);
float targetY = random(400);
int score = 0;

void setup ()
{
    size (600,400);
    background(255,255,255);
}


void draw()
{
  background(255,255,255);
  fill(255,0,255);
  ellipse(targetX,targetY, 50,50);
  
  fill(0,0,200);
  ellipse(mouseX,mouseY,50,50);
  text("score: " + score, 50,50);
  
  if(frameCount%250 == 249)
  {
    score--;
  }
 if(score == 10)
 {
   background(255);
   text("You Win!",width/2,height/2);
   noLoop();
 }
   
}  

void mousePressed()
{
  if(mouseX<targetX+5 && mouseX>targetX-5 && mouseY<targetY+5 && mouseY>targetY-5)
  {
    targetX = random(width);
    targetY = random(height);
    ellipse(mouseX,mouseY,75,75);
    score++;
  }
  else
    score--;
}

