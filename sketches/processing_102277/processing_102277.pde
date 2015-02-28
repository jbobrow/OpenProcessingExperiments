
//import codeanticode.gsvideo.*;
import gifAnimation.*;
import ddf.minim.*;

public int upgradeInterval = int(random(3000,4000));
int upgradeCounter = upgradeInterval-1000;
PVector vel = new PVector();
PVector loc = new PVector(30,50);
boolean playing = false;
boolean titleScreen = true;
boolean falling = true;
boolean gameover = false;
float score;
int lifes = 5;
//int n;
PFont font;
ArrayList upgrades = new ArrayList();
PImage bk, ball, notmyfault;
Minim minim;
AudioSample blewit, ping, pong, whip;
//GSMovie movie;
Gif nonLoopingGif;
//PImage[] animation;
void setup()
{
  size(328,500);
  frameRate(60);
  falling = true;
  lifes = 5;
  score = 0;
  vel.x = random(1,3);
  vel.y = random(5,7);
  font = loadFont("BoltBoldITCbyBT-Regular-28.vlw");
  noStroke();
  fill(0);
  textFont(font);
  background(255,133,14);
  playing = false;
  titleScreen = true;
  gameover = false;
  cursor(ARROW);
  loc.x = width/2;
  loc.y = height/2; 
  bk = loadImage("TKOH.jpg");
  ball = loadImage("Angrydsp.png");
  notmyfault = loadImage("notmyfault.png");
  minim = new Minim(this);
  blewit = minim.loadSample("Blewit.wav");
  ping = minim.loadSample("ping.wav");
  pong = minim.loadSample("pong.wav");
  whip = minim.loadSample("whip.wav");
  //movie = new GSMovie(this, "Blewit.avi");
  nonLoopingGif = new Gif(this, "Blewit.gif");
  nonLoopingGif.ignoreRepeat();
  //animation = Gif.getPImages(this, "Blewit.gif");
}
/*
void movieEvent(GSMovie movie) {
  movie.read();
}
*/
void draw()
{
  background(255,133,14);
  if (titleScreen) {
    textAlign(CENTER, CENTER);
    fill(48, 17, 15);
    text("PLAY DSP's PONG",width/2,height/2);
    textAlign(LEFT);
  }
  else if (playing)
    play();
  else if (!playing&&!titleScreen) {
    background(255,133,14);
    textFont(font, 40);
    textAlign(CENTER, CENTER);
    fill(255, 0, 0);
    text("Game Over!",width/2,height/4);
    text("You Blew It!",width/2,3*height/4);
    image(notmyfault, 20, 5*height/6);
    if(!gameover)
        {
          gameover = true;
          delay(1000);
          //movie.play();
          //movie.jump(0);
          nonLoopingGif.play();
          blewit.trigger();
          //n=0;
        }
        //else if(movie.time()<movie.duration())
        else if(nonLoopingGif.isPlaying()) {
        //else if(n<animation.length) {
          //image(movie, 0, height/2-174/2);
          image(nonLoopingGif, 0, height/2-174/2);
          //image(animation[n++], 0, height/2-174/2);
          //delay(34);
        }
        else {
          nonLoopingGif.stop();
          delay(2000);
          setup();
        }    
  }
}
void ellipse()
{
  //noStroke();
  //fill(0);
  //ellipse(loc.x,loc.y,40,40);
  image(ball, loc.x-20, loc.y-20);
}
void rect()
{
  noStroke();
  fill(0, 0, 128);
  rect(mouseX-40,height-40,80,20);
}
void update()
{
  loc.x+=vel.x;
  loc.y+=vel.y; 
}
void play()
{
  if (upgradeCounter <= upgradeInterval)
  { 
    upgradeCounter++;
  }
  else
  {
    upgradeCounter = 0;
    upgrades.add(new Upgrade(random(30,270)));
    for (int num = 0; num < upgrades.size(); num++)
    {
      ((Upgrade)upgrades.get(num)).fall(); 
    }
  }
  image(bk, 0, 0);
  textFont(font, 20);
  fill(253, 236, 208);
  text("Score: " + int(score),170,30);
  text("Lifes: " + lifes,20,30);
  noCursor();
  ellipse();
  rect();
  update();
  if (get(int(loc.x),int(loc.y+20)) == color(0, 0, 128))
  {
    if (falling)
    {
      score+=(6*abs(vel.y));
      vel.y*=-1.02;
      if (vel.x < 0)
        vel.x = -(random(1,10));
      else if (vel.x > 0)
        vel.x = random(1,10);
      falling = false;
      pong.trigger();
    }
  }
  else if (loc.y-20<3)
  {
    vel.y*=-1;
    falling = true;
    ping.trigger();
  }
  else if (loc.x-20<3) {
    vel.x*=-1;
    ping.trigger();
  }
  else if (loc.x+20>width-3) {
    vel.x*=-1;
    ping.trigger();
  }
  else if (loc.y-20>height)
    if (lifes>1)
    { 
      lifes--;
      loc.x = 30;
      loc.y = 50;
      vel.x = random(1,3);
      vel.y = random(5,7);
      score-=score/2;
      whip.trigger();
    }
    else
    {
      whip.trigger();
      playing = false;
      titleScreen = false;
    }
}
void mousePressed()
{
  if (titleScreen)
  {
    if (mouseX >= 0 && mouseY >= height/2-20 && mouseX < width && mouseY < height/2+20)
    {
      titleScreen = false;
      playing = true;
    }
  }
  /*
  if (!titleScreen)
  {
    if (vel.y > 0)
      vel.y+=2;
    else if (vel.y < 0)
      vel.y-=2;   
  }
  */
}
void keyPressed()
{
  if (key == 'r')
    setup();
}

void stop()
{
  // always close Minim audio classes when you are done with them
  blewit.close();
  ping.close();
  pong.close();
  whip.close();
  // always stop Minim before exiting
  minim.stop();
  super.stop();
}

