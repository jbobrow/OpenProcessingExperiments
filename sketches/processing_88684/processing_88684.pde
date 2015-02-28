

//hw6
//copyright jingjing chen jingjin1@andrew.cmu.edu

int radius=40;
float x=radius;
float speed = 1.5;
int dirc = 1;
PFont font;

void setup(){
 size(400,200);
 smooth();
 ellipseMode(RADIUS);
 rectMode(CENTER);
}

void draw(){
  screen();
  moveBean();
  beanSpeed(); 
  intro();
}

void screen()
{
fill(0);
rect(0, 0, 2*width, 2*height);
}

void moveBean(){
  x+=speed*dirc;
  if ((x>width+radius)||(x<-radius))
  {dirc=-dirc;}
    if (dirc==1){
      fill(255,0,0);      
       for(int j=10;j<=width;j+=25)
       {fill(random(255),random(255),random(255));
        noStroke();
        ellipse(j,0.5*height,8,8);
        fill(0);
        rect(-radius,0.5*height,2*x,radius);
       }
       
    fill(255,0,0);
    arc(x,0.5*height,radius,radius,0.52,5.8);
     }
     
  else{
       for(int j=10;j<=width;j+=25)
       {fill(random(255),random(255),random(255));
        noStroke();
        ellipse(j,0.5*height,8,8);
        fill(0);
        rect(-radius,0.5*height,-2*(x+radius),radius);
       }

    fill(0,255,0); 
    arc(x,0.5*height,radius,radius,3.62,8.9); 
}
}

void beanSpeed()
{        
  if (keyPressed && (key == CODED))
  {
    if (keyCode == LEFT){
    speed-=0.05;
    }
    else if(keyCode == RIGHT){
    speed+=0.01;
    }
  }
}

void intro()
{
  font = loadFont("ComicSansMS-48.vlw");
  textFont(font);
  textSize(15);
    fill(#EDEDED);
    text("try to press left/right arrow keys.",20,180);
}


