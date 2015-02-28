
/*Processing Game Project 3 (Final Project)
Mouse/Keyboard Input

My ultimate goal is to use the potential of Processing to a dynamic game. And in fact the aim of the game is also scoring goals! 

Change the level of difficulty switching between speeds 1-5 (press the keyboard).


MOUSE
position x: ball x position
position y: ball y position
click: shot on goal

KEYS
1-5: goalkeeper velocity
del, backspace: reset score
s: save png
*/


// two images, net and goalkeeper
PImage net, goalkeeper; 

/*
ready=in position to score
left=goalkeeper moving left
goal=shoot in goal or defended
*/
boolean ready, left, goal;

/*
goals=number of goals
x/y=ball position
keeperX=goakkeeper X position
velocity=goalkeeper velocity
*/
int goals,x,y, keeperX, velocity;

void setup(){  
  goals=0;
  x=400;
  y=515;
  velocity=1;
  keeperX=320;
  ready=true;
  left=false;
  size(800,600);
  net=loadImage("net.jpg");
  goalkeeper=loadImage("goalkeeper.png");
  background(#000000);
}

void draw(){
    background(#000000);
    //net image
    image(net,100,0);
    
    //results marker
    stroke(#FFFFFF);
    fill(#867872);
    rect(100,0,600,100);
    fill(#FFFFFF);
    textSize(32);
    textAlign(CENTER);
    text("Goals: "+goals, 400, 60);
    
    //ball shooting position
    fill(#FFFFFF);
    ellipse(400,525,40,25);
    
    //left/right margin
    fill(#000000);
    rect(0,0,100,600);
    rect(700,0,100,600);
    
    //goalkeeper movement
    if(ready){
      if(keeperX+velocity<=100) left=false;
      if(keeperX+velocity>=550) left=true;
      if(left) keeperX-=velocity;
      if(!left) keeperX+=velocity;
    }
    
    //goalkeeper image
    image(goalkeeper,keeperX,225);
    
    //ball
    fill(#1A78E8);
    noStroke();
    ellipse(x,y,35,35);
    
    //text
    fill(#FFFFFF);

  if(!ready){
     text("(Click)", 150, 580);
     if(x<150 || x>650 || y<230 || y>385){
        text("Out!!!", 655, 580);
        textAlign(CENTER, CENTER);
        textSize(20); 
        text("X",x,y);
      } else if(goal) text("Goal!!!", 650, 580);
      else text("Defended!!!", 610, 580);    
  }
}

//sets the ball position and checks whether goal
void mouseClicked(){
  if(ready){
    ready=false;
    x=mouseX;
    y=mouseY;
    if(x>=150 && x<=655 && y>=230 && y<=385){
      if(x>=keeperX && x<=keeperX+151){
        goal=false;
      } else { 
        goals++;
        goal=true;
      }
    } else if(x>683 || x<117 || y<80 || y>515){
      x=-100;
      y=-100;
      text("Out!!!", 570, 580);
    }
  } else{
    ready=true;
    x=400;
    y=515;    
  }
}

//sight
void mouseMoved(){  
  stroke(#FFFFFF);
  fill(#FFFFFF);
  line(0,mouseY,100,mouseY);
  line(700,mouseY,800,mouseY);
}

void keyPressed(){
  if(key==DELETE || key==BACKSPACE){ 
    goals=0;
    ready=true;
    x=400;
    y=515; 
  }
  if(key=='s' || key=='S') saveFrame("screenshot.png");
  if(key=='1') velocity=1;
  if(key=='2') velocity=5;
  if(key=='3') velocity=10;
  if(key=='4') velocity=15;
  if(key=='5') velocity=20;
}


