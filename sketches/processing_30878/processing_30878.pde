
PImage Cool;
Game Pandamonium;
Catcher Coolness;
Timer Countdown;
void setup(){
  size(950,950);
  Pandamonium=new Game();
  Countdown=new Timer(60,0,40,20,color(20,40,190));
  Pandamonium.fill();
  }
  
void draw(){
  noStroke();
  Cool=loadImage("Screen shot 2011-07-08 at 10.15.37 AM.png");
  Cool.resize(950,950);
  image(Cool,0,0);
  Pandamonium.start();
  Countdown.display();
  textSize(50);
  text("Score: " + Pandamonium.score, 50,50);
}

class Game{
  int score;
  ArrayList stone;
  int max = 70;
  Catcher Coolness;
  Game(){
    stone =new ArrayList(70);
    Coolness=new Catcher(425,850);
    score = 0;
  }
  void fill(){
    for(int i=0;i<70;i++){
      stone.add(new Bricks(random(900),0,random(100)));
    }
  }
  void start(){
    fill();
    Coolness.roll();
    Coolness.appear();

    for(int i=0;i<70;i++){
      ((Bricks)stone.get(i)).fall();
      ((Bricks)stone.get(i)).display();
      
      if(dist(((Bricks)stone.get(i)).xpos, ((Bricks)stone.get(i)).ypos, Coolness.xpos, Coolness.ypos)< 50){
        stone.remove(i);
        score++;
        
        if(score==70){
         stop();
         textSize(50);
         text("You Win!!!", 425,425);
        }
       }
    }
  }
}


