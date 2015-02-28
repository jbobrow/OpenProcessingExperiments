
float timer = 20; //////////////////////////////////////////
float fillChange = 0;

PFont Times;
PImage Galaxy;

void setup()
{
  size(800, 600);
  Times = createFont("Times New Roman", 32);
  Galaxy = requestImage("BGspace.jpg");
}

void draw()
{
  background(#000000);
  frameRate(30);
  
  image(Galaxy, 0,0, width,height);
  textFont(Times);
  textSize(14);
  textAlign(CENTER);
  fill(#FF0000);
  
  timer -= (1.0 / 30.0);
  
  if (timer <= 0)
  {
    fillChange = 1;
  }
  if (fillChange == 1)
  {
    fill(#FFFF00);
  }
  
  if (timer <= 18)
  {
    pushMatrix();
      translate((width/2),(height/2)-50);
      rotate(radians(270));
      text("Everyone's better than me", 0,0, 250,50);
    popMatrix();
  }
  if (timer <= 17)
  {
    pushMatrix();
      translate((width/2)+25,(height/2)-25);
      rotate(radians(315));
      text("My ideas are not unique", 0,0, 250,50);
    popMatrix();
  }
  if (timer <= 16)
  {
    pushMatrix();
      translate((width/2)+65,(height/2));
      rotate(radians(0));
      text("Everything I create is useless", 0,0, 250,50);
    popMatrix();
  }
  if (timer <= 15)
  {
    pushMatrix();
      translate((width/2)+25,(height/2)+25);
      rotate(radians(45));
      text("Will I succeed in my career?", 0,0, 250,50);
    popMatrix();
  }
  if (timer <= 14)
  {
    pushMatrix();
      translate((width/2),(height/2)+50);
      rotate(radians(90));
      text("Am I overreacting", 0,0, 250,50);
    popMatrix();
  }
  if (timer <= 13)
  {
    pushMatrix();
      translate((width/4)-25,(height/2)+200);
      rotate(radians(315));
      text("Will it be good? Will it be bad?", 0,0, 250,50);
    popMatrix();
  }
  if (timer <= 12)
  {
    pushMatrix();
      translate((width/4)-115,(height/2));
      rotate(radians(0));
      text("No one will enjoy what I create", 0,0, 250,50);
    popMatrix();
  }
  if (timer <= 11)
  {
    pushMatrix();
      translate((width/4)-25,(height/2)-215);
      rotate(radians(45));
      text("I am just average at what I do", 0,0, 250,50);
    popMatrix();
  }
  //----------------------------------------------------------------
  if (timer <= 8)
  {
    pushMatrix();
      translate(width/2-125, 20);
      rotate(radians(0));
      text("It will be okay!", 0,0, 250,50);
    popMatrix();
  }
  if (timer <= 7)
  {
    pushMatrix();
      translate(20, height/2+125);
      rotate(radians(270));
      text("We love it!", 0,0, 250,50);
    popMatrix();
  }
  if (timer <= 6)
  {
    pushMatrix();
      translate(width-20, height/2+125);
      rotate(radians(270));
      text("Make more!", 0,0, 250,50);
    popMatrix();
  }
  if (timer <= 5)
  {
    pushMatrix();
      translate(width/2-125, height-30);
      rotate(radians(0));
      text("Keep doing what you do!", 0,0, 250,50);
    popMatrix();
  }
  //----------------------------------------------------------------
  if (timer <= 1)
  {
    text("Even through the darkest thoughts, I have my friends, family, and feedback to help me stay up and become the best person I can be!",
    (width/2)-100,(height/2)-50, 200,200);
  }
}


