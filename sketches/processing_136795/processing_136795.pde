
int num=6;
int dia=10;
int value=0;
int x1=90;
int x2=90;
int y1=20;
int y2=100;
int wt=5;
int s1=90;
int le=50;
int st1=70;
int st2=150;
int wh=500;
int d1=255;
int d2=270;
int d3=285;
PImage pic1;
PImage pic2;
PImage pic3;
PImage pic4;
int t;
int ypos;
int xpos;
float opa;
int inc;
color col;
boolean el;
import ddf.minim.*;
Minim minim;
AudioPlayer player;

void setup() {
  size(550,600);
  smooth();
  noStroke();
//  rectMode(CENTER);
//  color1=color(#0052FF);
//  highlight1=color(51);
//  color2=color(#FF1500);
//  highlight2=color(204);
  pic1=loadImage("001.jpg");
  pic2=loadImage("002.jpg");
  pic3=loadImage("003.jpg");
  pic4=loadImage("004.jpg");
    ypos=300;//y position
  frameRate(120);//fps
  el=false;
    col=color(255);
  
  minim=new Minim(this);
  player =minim.loadFile("music.mp3");
  player.pause();

}
 
void draw() {
  background(0);
  stroke(255);
  fill(255);
  rect(240,240,60,1);//dice board
  rect(240,300,60,1);
  rect(240,240,1,60);
  rect(300,240,1,60);

  

  image(pic3,240,200,30,30);//bottom surface1
  image(pic4,275,200,30,30);
    
  noStroke();

    fill(#FFE203);
  rect(s1,st1,400,wt);//road1
  rect(440,st1+le,le,wt);
  rect(440,st1+le*2,le,wt);
  rect(440,st1+le*3,le,wt);
  rect(440,st1+le*4,le,wt);
  rect(440,st1+le*5,le,wt);
//  rect(440,st1+le*6,le,wt);
  rect(140,390,350,wt);
   
  rect(s1,st2,310,wt);
    rect(350,st2+le,le,wt);//road2
    rect(350,st2+le*2,le,wt);
    rect(350,st2+le*3,le,wt);
    rect(350,st2+le*4,le,wt);
    rect(350,st2+le*5,le,wt);
    rect(350,st2+le*6,le,wt);
    rect(350,st2+le*7,le,wt);
    rect(350,st2+le*8,le,wt);
  rect(s1,550,310,wt);
  
  fill(0);
  rect(s1+le,st1,wt,wh);
  rect(s1+le*2,st1,wt,wh);
  rect(s1+le*3,st1,wt,100);
  rect(s1+le*3,380,wt,200);
  rect(s1+le*4,st1,wt,100);
  rect(s1+le*4,380,wt,200);
  rect(s1+le*5,st1,wt,wh);
  rect(s1+le*6,st1,wt,10);
  rect(s1+le*6,390,wt,8);
  rect(s1+le*6,540,wt,18);
  rect(s1+le*7,st1,wt,wh);
  rect(s1+le*8,st1,wt,wh);

//  ellipse(100,60,100,20);//start 
//  ellipse(100,120,100,20);
//  fill(#FFE203);
//  ellipse(100,450,100,20);//stop
//  ellipse(100,510,100,20);
  textSize(30);
  fill(255);
  text("Start",5,110);
  text("Stop",5,480);
  image(pic1,x1,y1,50,50);//user surface
  image(pic2,x2,y2,50,50);
  
  
  
  
  fill(#FFE203);
  if(value == 1){
    ellipse(d2,d2,dia,dia);
  }
  if(value == 2){
    ellipse(d3,d3,dia,dia);
    ellipse(d1,d1,dia,dia);
  }
  if(value == 3){
    ellipse(d2,d2,dia,dia);
    ellipse(d3,d3,dia,dia);
    ellipse(d1,d1,dia,dia);
  }
  if(value == 4){
        ellipse(d3,d3,dia,dia);
        ellipse(d1,d3,dia,dia);
        ellipse(d3,d1,dia,dia);
        ellipse(d1,d1,dia,dia);
  }
  if(value == 5){
      ellipse(d2,d2,dia,dia);
      ellipse(d3,d3,dia,dia);
      ellipse(d1,d3,dia,dia);
      ellipse(d3,d1,dia,dia);
      ellipse(d1,d1,dia,dia);
  }
  if(value == 6){
      ellipse(d3,d3,dia,dia);
      ellipse(d1,d3,dia,dia);
      ellipse(d3,d2,dia,dia);
      ellipse(d1,d2,dia,dia);
      ellipse(d3,d1,dia,dia);
      ellipse(d1,d1,dia,dia);
//      println("six");
  }

println(mouseX +"  " + mouseY);

    if (mousePressed == true) {
      t=1;
      if(mouseX>240 && mouseX<270 && mouseY>200 && mouseY<230){
        
        value=int(random(7));
     if(x1<440 && y1==20){
       x1=x1+value;
       }else if(x1>=440 && y1<330){
         y1=y1+value;
      }else if( x1>140 &&y1>=330){
     x1=x1-value;
      }
      }
     
    if (mousePressed == true) {
       if(mouseX>275 && mouseX<305 && mouseY>200 && mouseY<230){
        value=int(random(7));
     if(x2<350 && y2==100){
       x2=x2+value;
       }else if(x2>=350 && y2<490){
         y2=y2+value;
      }else if( x2>90 &&y2>=490){
     x2=x2-value;
      }
       }

      if (mousePressed == true) {
       if(mouseX>90 && mouseX<140 && mouseY>500 && mouseY< 550){
           fill(random(255));
           text("You Win!!",150,500);
         }
         
     if (mousePressed == true) {
       if(mouseX>140 && mouseX<180 && mouseY>350 && mouseY< 400){
           if(el==true){
          col= color(int(random(255)),int(random(255)),int(random(255)));
    el=false;
  }    
    inc++;
  xpos=inc/12;
  opa= mouseY*2.5;
         fill(col,opa);
  text("y",2*xpos,ypos);
  text("o",3*xpos,ypos);
  text("u",4*xpos,ypos);
  text("W",5*xpos,ypos);
  text("I",6*xpos,ypos);
  text("N",7*xpos,ypos);
    text("!",8*xpos,ypos);
       }
     }
     if (mousePressed==true){
     if(mouseX>4 && mouseY>90){
        player.play();
     }
     }
      }
    }
    }
}


