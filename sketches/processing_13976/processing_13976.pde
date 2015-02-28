

PFont font;
PImage photo;
PImage storm;
PImage jammer;
int s=second();
float x, y,     z,m;

void setup()
{
  size(640,480);
  smooth();
  font = loadFont( "Georgia-BoldItalic-16.vlw");
  textFont (font);
  noStroke();
  float z = second();
  float m= second();
  background(z,m*3,40);
  photo= loadImage("applehat.jpg");
  storm= loadImage("stormlogo.jpg");
  jammer= loadImage("jammers.jpg");
  imageMode(CENTER);
}

void draw()
{

  fill(204,24);
  rect(0,0,width,height);
  fill(0);
  if( s<=50)
  {
    text("attack", random(-100,600), random(-20,420)); 
    loop();
  }
  else
  {
    text("attack", random(-100,600), random(-20,420)); 
    noLoop();
  }


  //text("help", random(-100,100), random(-20,120));
  noLoop();

  //text
  pushMatrix();
  x= random(height);
  translate(90, x);
  scale(1);
  text("MASCOT", 0, 100);
  popMatrix();

  //jammers
  pushMatrix();
  x = random(height);
  translate(90, x);
  scale(0.25);
  image(jammer, 500, 200);
  popMatrix();

  pushMatrix();
  x = random(height);
  y = random(width);
  translate(y, x);
  scale(1);
  image(jammer, width/2,height/2);
  popMatrix();

  pushMatrix();
  y = random(height);
  translate(60, y);
  scale(1.5);
  image(jammer,400,90);
  popMatrix();






  //tincaps

  pushMatrix();
  x = random(height);
  translate(90, x);
  scale(0.5);
  image(photo, 500, 400);
  popMatrix();

  pushMatrix();
  x = random(height);
  translate(30, x);
  scale(1.5);
  image(photo, 100, 200);
  popMatrix();

  pushMatrix();
  x = random(height);
  translate(60, x);
  scale(1.5);
  image(photo, 10,90);
  popMatrix();

  //storm
  pushMatrix();
  y = random(width/2);
  x = random(height);
  translate(y, x);
  scale(.5);
  image(storm, 400, 300);
  popMatrix();


  pushMatrix();
  y = random(width/2);
  translate(y, 5);
  scale(1.5);
  image(storm, 10, 10);
  popMatrix();

  //text
  pushMatrix();
  x= random(height);
  y= random(width);
  translate(y, x);
  scale(2);
  text("MASCOT", 0, 100);
  popMatrix();

  pushMatrix();
  x= random(height);
  y= random(width);
  translate(y, x);
  scale(2.5);
  fill(255);
  text("Attack!", 0, 100);
  popMatrix(); 




  pushMatrix();
  x= random(height);
  y= random(width);
  translate(y, x);
  scale(x/100);
  fill(200,10,10);
  text("MASCOT", 0, 100);
  popMatrix();

  pushMatrix();
  x= random(height);
  y= random(width);
  translate(y, x);
  scale(y/50);
  fill(255);
  text("Attack!", 0, 100);
  popMatrix(); 

  pushMatrix();
  x= random(height);
  y= random(width);
  translate(y, x);
  scale(1);
  fill(200,200,200);
  text("Attack!", 0, 100);
  popMatrix(); 

  pushMatrix();
  x= random(height);
  y= random(width);
  translate(y, x);
  scale(.75);
  fill(10,10,200);
  text("MASCOT", width/2, height/2);
  popMatrix();

  pushMatrix();
  x= random(height);
  y= random(width);
  translate(y, x);
  scale(2);
  fill(190,30,60,40);
  text("Attack!", width/2, height/2);
  popMatrix();
}
























