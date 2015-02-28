
PImage myImage;
Audience myAudience;



void setup(){
  size(800,800);
   myImage=loadImage("rock.jpg");
   myAudience=new Audience();
}

void draw(){
  background(0);
  tint(random(0,255));
  image(myImage, 105, 30, 600, 480);
  myAudience.display();
  myAudience.move();
  myAudience.bounce();
}

class Audience{
  color c;
  int xpos;
  int ypos;
  int yspeed;


Audience(){
  c= color(255);
  xpos= 100;
  ypos=490;
  yspeed=1;
}

void display(){
  fill(c);
 ellipse(xpos, ypos, 60, 60);
}

void move(){
  ypos= ypos+ yspeed;
}

void bounce(){
  if((ypos>height) || (ypos< 500)){
    yspeed= yspeed*-1;
  }
}
}









