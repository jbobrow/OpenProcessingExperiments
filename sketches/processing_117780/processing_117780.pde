
import ddf.minim.*;

Minim minim;
AudioSample a,i,u,e,o;

PFont font1,font2;
PImage bg,snow;
PImage ch[]=new PImage[5];
char hiragana[]={'あ','い','う','え','お','か','き','く','け','こ','さ','し','す','せ','そ','た','ち','つ','て','と','な','に','ぬ','ね','の','は','ひ','ふ','へ','ほ','ま','み','む','め','も','や','ゆ','よ','ら','り','る','れ','ろ','わ','を'};
float x,y;
int n,sy;
boolean aover=false;

float x1=100;
float x2=100;
float w=180;
float h=180;

void setup(){
  size(960,640);
  smooth();
  noStroke();
  bg=loadImage("bg.jpg");
  background(bg);

  
  snow=loadImage("snow.gif");
  
  ch[0]=loadImage("a.png");
  ch[1]=loadImage("i.png");
  ch[2]=loadImage("u.png");
  ch[3]=loadImage("e.png");
  ch[4]=loadImage("o.png");
  
  minim=new Minim(this);
  a=minim.loadSample("a.mp3");
  i=minim.loadSample("i.mp3");
  u=minim.loadSample("u.mp3");
  e=minim.loadSample("e.mp3");
  o=minim.loadSample("o.mp3");  
}

void time(){
  fill(random(255),random(255),random(255));
   text(year()+"/"+month()+"/"+day(),10,10);

}

void display(int n){ //japanese characters in the background
  x=random(1000);
  y=random(800);
  text(hiragana[n],x,y,90);
}



void draw(){
  time();
  
  fill(157,33,48);
  font1=loadFont("Ounen-mouhitsu-48.vlw");//font for English character
  textFont(font1); 
  textSize(36);
  text("Let's learn Japanese together!",230,40);
  
  fill(255,98,135,50);
  font2=loadFont("Ounen-mouhitsu-362.vlw");//font for Japanese character
  textFont(font2);
  textSize(36);
  
  

  for (int i=0; i<44; i++){ //there are a total of 45 characters in string "hiragana"
    display(n=i);
    noLoop();
  }
  
  image(ch[0],100,100);
  image(ch[1],400,100);
  image(ch[2],700,100);
  image(ch[3],250,350);
  image(ch[4],550,350);
  


}

void mousePressed(){
  if(mouseX>100 && mouseY>100 && mouseX<280 && mouseY<280){
    a.trigger();
  }else if(mouseX>400 && mouseY>100 && mouseX<580 && mouseY<280){
    i.trigger();
  }else if(mouseX>700 && mouseY>100 && mouseX<880 && mouseY<280){
    u.trigger();
  }else if(mouseX>250 && mouseY>350 && mouseX<430 && mouseY<530){
    e.trigger();
  }else if(mouseX>550 && mouseY>350 && mouseX<730 && mouseY<530){
    o.trigger();
  }
}


//http://www.wallng.com/blossom-hawthorne-desktop-walpaper-background/#.Umre05FMQzk

