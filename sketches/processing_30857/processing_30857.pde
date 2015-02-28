
PImage Cool;
Game Pandamonium;
Bricks A;
Bricks B;
Bricks C;
Bricks D;
Bricks E;
Bricks F;
Bricks G;
Bricks H;
Bricks I;
Bricks J;
Bricks K;
Bricks L;
Catcher Coolness;
void setup(){
  size(950,950);
  Pandamonium=new Game();
  A=new Bricks(random(900),0,random(20));
  B=new Bricks(random(900),0,random(20));
  C=new Bricks(random(900),0,random(20));
  D=new Bricks(random(900),0,random(20));
  E=new Bricks(random(900),0,random(20));
  F=new Bricks(random(900),0,random(20));
  G=new Bricks(random(900),0,random(20));
  H=new Bricks(random(900),0,random(20));
  I=new Bricks(random(900),0,random(20));
  J=new Bricks(random(900),0,random(20));
  K=new Bricks(random(900),0,random(20));
  L=new Bricks(random(900),0,random(20));
  }
  
void draw(){
  noStroke();
  Cool=loadImage("Screen shot 2011-07-08 at 10.15.37 AM.png");
  Cool.resize(950,950);
  image(Cool,0,0);
  Pandamonium.start();
  Pandamonium.fill();
  A.fall();
  A.display();
  B.fall();
  B.display();
  C.fall();
  C.display();
  D.fall();
  D.display();
  E.fall();
  E.display();
  F.fall();
  F.display();
  G.fall();
  G.display();
  H.fall();
  H.display();
  I.fall();
  I.display();
  J.fall();
  J.display();
  K.fall();
  K.display();
  L.fall();
  L.display();
}

class Game{
  ArrayList stone;
  int max = 14400;
  Catcher Coolness;
  Game(){
    stone =new ArrayList(70);
    Coolness=new Catcher(425,850);
  }
  void fill(){
    for(int i=0;i<70;i++){
      stone.add(new Bricks(random(900),0,random(20)));
    }
  }
  void start(){
    fill();
    Coolness.roll();
    Coolness.appear();

    for(int i=0;i<70;i++){
      ((Bricks)stone.get(i)).fall();
      ((Bricks)stone.get(i)).display();
      
      if(dist(((Bricks)stone.get(i)).xpos, Coolness.xpos,((Bricks)stone.get(i)).ypos, Coolness.ypos)< 100){
        stone.remove(i);
      //((Bricks)stone.get(i)).xpos = Coolness.xpos;
      
      //((Bricks)stone.get(i)).ypos = Coolness.ypos;
      //((Bricks)stone.get(i)).yspeed = 0;
       }
    }
  }
}


