
PImage underwater;
PImage gameover;


int score= 0;
int lives= 4;

String Score;
String Lives;
String Game_Over;
String Omnom;

PFont myfont;
PFont myfont2;
PFont font2;
PFont font3;

//turtle position
float Xpos=0;
float Ypos=0;
float speed= 2;
float speed2=3;

//jellies
float x1= random(770);
float x2= random(525);
float x3= random(770);
float x4= random(525);

PImage s;
PImage jelly;

int texttime;

void setup(){
  underwater= loadImage("underwater.gif");
  size(800,600);
  noStroke();
  s = loadImage("babyturt.gif");
  jelly=loadImage("jellyfish.gif");
  gameover=loadImage("gameover.gif");


  myfont= loadFont("LucidaSans-20.vlw");
  myfont2= loadFont("LucidaSans-40.vlw");
  font2= loadFont("LucidaSans-Typewriter-70.vlw");
  font3= loadFont("ComicSansMS-Bold-15.vlw");
}

void draw(){
  background(underwater);

  texttime=texttime-1;

  Xpos=Xpos+speed;
  Ypos=Ypos+speed2; 


  image(s,Xpos-20,Ypos-10);

  fill(201,61,129);
  rect(mouseX,575,100,20);


  image(jelly,x1,x2);


  if (Xpos>800 && Ypos<600) {
    speed=speed*-1;
  }
  else if (Xpos<0) {
    speed=speed*-1;
  }

  if (Ypos<0) {
    speed2=speed2*-1;
  }

  if (Ypos>600){
    Xpos=0;
    Ypos=0;
    speed=2;
    speed2=3;
    score=score-10;
    lives=lives-1;
  }


  if (Xpos>mouseX && Xpos<mouseX+50 && Ypos>575) {
    speed=speed*1.1;
    speed2=speed2*-1.2;
    score= score+5;
  }

  if(Xpos>mouseX+50 && Xpos<mouseX+100 && Ypos>575){
    speed=speed*1.2; 
    speed2=speed2*-1;
    score=score+5;
  }

  if(Xpos>x1 && Xpos<x1+50 && Ypos>x2 && Ypos<x2+70){
    x1=random(770);
    x2=random(525);
    score=score+100;
    texttime=30;
  }

  if(score>500){ 
    //fill(random(255),0,random(255));
    image(jelly,x3,x4);
  }

  if(Xpos>x3 && Xpos<x3+50 && Ypos>x4 && Ypos<x4+70 && score>500){
    x3=random(770);
    x4=random(525);
    score= score+100;
    texttime=30;
  }
  if(texttime>0){
    fill(255);
    Omnom="Om nom";
    textFont(font3);
    text(Omnom,Xpos-20,Ypos-10);
  }

  Score= "score:  "+score+"  points";
  Lives= "lives:  "+lives;
  fill (255);
  textFont(myfont);
  text(Score,20,20);
  text(Lives,600,20);

  if(lives<0){ 
    Xpos=0;
    Ypos=0;
    background(gameover);
    textFont(font2);
    Game_Over= "GAME OVER";
    text(Game_Over,200,75); 
    textFont(myfont2);
    Score="score:"+score+" points";
    text(Score,225,580);
  }



}




