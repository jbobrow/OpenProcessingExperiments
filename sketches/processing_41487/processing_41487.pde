
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer p;

color start=color(134,48,178);
color finish;
float amt = 0.0;

void setup(){
  size(700,400);
  background(0);
}

void draw(){
  
  if (mousePressed && (mouseButton == LEFT)){
     stroke(start);
     finish = color(random(255),random(255),random(255));
     line(mouseX,mouseY,height,width);
     mouseY = mouseY + 5;
     mouseX = mouseX - 5;
     { m = new Minim(this);
       p = m.loadFile("bassdrum3.wav");
      p.play();}
  }
  
  amt+=.01;
  if (amt >= 1) {
    amt = 0.0;
    start = finish;
    finish = color(random(255),random(255),random(255));
  }
  
  /*if (mousePressed && (mouseButton == LEFT)){
     stroke(255);
     line(mouseX,mouseY,height,width);
     mouseY = mouseY + 5;
     mouseX = mouseX - 5;
     { m = new Minim(this);
       p = m.loadFile("bassdrum10.wav");
      p.play();}
  }
  
  if (mousePressed && (mouseButton == LEFT)){
     stroke(255);
     line(mouseX,mouseY,height,width);
     mouseY = mouseY + 5;
     mouseX = mouseX - 5;
     { m = new Minim(this);
       p = m.loadFile("bassdrum2.wav");
      p.play();}
  }
  
  if (mousePressed && (mouseButton == LEFT)){
     stroke(255);
     line(mouseX,mouseY,height,width);
     mouseY = mouseY + 5;
     mouseX = mouseX - 5;
     { m = new Minim(this);
       p = m.loadFile("bassdrum5.wav");
      p.play();}
  }*/
  
  if (mousePressed && (mouseButton == RIGHT)){
    background(0);
    { m = new Minim(this);
      p = m.loadFile("explosion-02.wav");
     p.play();}
  }
  
}

