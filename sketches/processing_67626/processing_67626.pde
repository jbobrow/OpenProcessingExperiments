
PImage img;

void setup(){
  size(600,450);
  img = loadImage("me.jpg");
}

void draw(){
  image(img,0,0);
  fill(#3B2619);
  quad(200,100,300,100,300,400,200,400);
  triangle(200,100,300,100,250,50);
  triangle(200,400,140,400,200,300);
  triangle(300,400,360,400,300,300);
  line(250,400,250,300);
  stroke(#F00000);
  line(250,400,random(200,300),random(400,450));
  line(250,400,random(200,300),random(400,450));
  line(250,400,random(200,300),random(400,450));
  line(250,400,random(200,300),random(400,450));
  line(250,400,random(200,300),random(400,450));
  line(250,400,random(200,300),random(400,450));
  line(250,400,random(200,300),random(400,450));
  line(250,400,random(200,300),random(400,450));
  line(250,400,random(200,300),random(400,450));
  line(250,400,random(200,300),random(400,450));
  line(250,400,random(200,300),random(400,450));
  line(250,400,random(200,300),random(400,450));
}

