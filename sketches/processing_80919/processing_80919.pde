
float vx = 2;
float vy = 0;
float x = 0;
float y = 10;
float frictionx = .998;
float frictiony = -.75;
float gravity = .05;
float time;
PImage baby;
PImage game;
PImage diaper;
PImage cry;
PImage happy;
PImage hungry;
PImage greenbeans;
PImage squash;
PFont font;
PFont fonttime;
//boolean happy1 = false;
float happy1;


void setup(){
  size(800,800);
  imageMode(CENTER);
  baby = loadImage("baby.png");
  game = loadImage("game.png");
  diaper = loadImage("diaper.png");
  cry = loadImage("cry.png");
  happy = loadImage("happy.png");
  hungry = loadImage("hungry.png");
  greenbeans = loadImage("greenbeans.png");
  squash = loadImage("squash.png");
  font = loadFont("Babycakes-48.vlw");
  fonttime = loadFont("Monospaced-200.vlw");
  
}

void draw(){
  background(254,180,255);
  happy1 = 0;
 //controls 
  textFont(font,48);
  text("keep me happy!",250,40); 
  textFont(font,24);  
  text("controls: left- a  right- d  up- left mouse", 200,70);
  //timer
 textFont(fonttime,200);
 //stroke(245,236,138);
 text(time,0,width/2);

 
  vy += gravity;
  vx *= frictionx;
  x += vx;
  y += vy;
  if(y > height - 60){
    y = height - 60;
    vy *= frictiony;
  }
  if(x > width - 20){
    vx *= -1;
    //rightwall
  }
  if(x < 0){
    vx *= -1;
    //leftwall
  }
  if(y <  10){
    vy *= -1;
    //top
  }
  
 
  //images  
  image(baby,x,y);
  image(game,height/2,width/2);
  if(dist(x,y,height/2,width/2) < 80){
    baby = loadImage("happy.png");
    //timer++;
    happy1 = 1;
  }//else{
   // happy1 = false;
  //}
 
// if(
 
  if(happy1 == 1){
    time += .02;
  }
 
  
  image(diaper,100,200); 
  if(dist(x,y,100,200) < 80){
    baby = loadImage("cry.png");
    happy1 = 0;
  }
   image(diaper,700,200); 
  if(dist(x,y,700,200) < 80){
    baby = loadImage("cry.png");
    happy1 = 0;
  }
  image(diaper,400,200); 
  if(dist(x,y,400,200) < 80){
    baby = loadImage("cry.png");
    happy1 = 0;
  }
    image(diaper,100,600); 
  if(dist(x,y,100,600) < 80){
    baby = loadImage("cry.png");
    happy1 = 0;
  }
   image(diaper,700,600); 
  if(dist(x,y,700,600) < 80){
    baby = loadImage("cry.png");
    happy1 = 0;
  }
  image(diaper,400,600); 
  if(dist(x,y,400,600) < 80){
    baby = loadImage("cry.png");
    happy1 = 0;
  }
  image(greenbeans,200,400);
  if(dist(x,y,200,400) < 30){
    baby = loadImage("hungry.png");
    happy1 = 0;
}
  image(greenbeans,550,100);
  if(dist(x,y,550,100) < 30){
    baby = loadImage("hungry.png");
    happy1 = 0;
}
 image(greenbeans,550,700);
  if(dist(x,y,550,700) < 30){
    baby = loadImage("hungry.png");
    happy1 = 0;
}
image(squash,200,100);
  if(dist(x,y,200,100) < 30){
    baby = loadImage("hungry.png");
    happy1 = 0;
}
image(squash,200,700);
  if(dist(x,y,200,700) < 30){
    baby = loadImage("hungry.png");
    happy1 = 0;
}
image(squash,600,400);
  if(dist(x,y,600,400) < 30){
    baby = loadImage("hungry.png");
    happy1 = 0;
}
if(happy1 == 0){
  time = 0;
}
//if(happy1 = true){
 // time += 1;
/*}else{
  time = 0;*/
//}



}

void mouseReleased(){
  vy -= 2;
}

void keyPressed(){
  if(key =='a'){
    vx -= 2;
  }
  if(key == 'd'){
  vx -= -2;
}
}

