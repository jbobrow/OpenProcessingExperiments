
float r;
float g;
float b;
PImage bg;

void setup(){
  frameRate(30);
  size(720,480);
  bg = loadImage ("Gradient.jpg");
}

void draw(){
background(bg);
  fill(0);
  rect(height/2-10,width/2-10,300,300);
  fill(r,g,b);
  r =random(255);
  g =random(255);
  b =random(255);
 rect(height/2,width/2,300,300);
   fill(255);
 ellipse(height/2+60,width/2,50,50);
 ellipse(height/2+240,width/2,50,50);
   fill(0);
 ellipse(height/2+50,width/2,30,30);
 ellipse(height/2+248,width/2,30,30);
 noFill();
 noStroke();
 fill(r,g,b);
    ellipse(random(720),random(255),random(140),random(140));
 arc(height/2+120, width/2+80, 50, 50, 0, PI+QUARTER_PI);
  

}

