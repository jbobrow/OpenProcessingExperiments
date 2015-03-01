
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


PImage image;
PImage image1;
Minim minim;
AudioSample song1;
AudioSample song2;
AudioSample song3;
AudioSample song4;

void setup() {
  size(800, 600);
  background(#110A89);
  image= loadImage("astro1.png");
  image(image, 20, 30);
  image1= loadImage("2015.jpg");
  image(image1, 20, 360);
  PFont curlz = loadFont("Agency.vlw");
  textFont(curlz);
  textAlign(CENTER);
  text("Click your sign", 3*width/4, height/2);
  minim = new Minim(this);
  song1 = minim.loadSample("son1.wav");
  song2 = minim.loadSample("son2.wav");
  song3 = minim.loadSample("son3.wav");
  song4 = minim.loadSample("son4.wav");
}

void draw() {
/*  stroke( 225 );
  for ( int i = 0; i < 64; i++ ) {
    line( i*50, 0, i*50, height );
  }
  for ( int i = 0; i < 48; i++ ) {
    line( 0, i*50, width, i*50 );
  } */
}
void mousePressed() {

  fill(250);
  if (mouseX < 100) { 

    if (mouseY < 140) {  
      song1.trigger();
      background (#110A89);
      image(image, 20, 30);
      image(image1, 20, 360);
      text("Your facebook account will be hacked.", 3*width/4, height/2);
    } else if (mouseY < 260) {
      song1.trigger();
      background (#110A89);
      image(image, 20, 30);
      image(image1, 20, 360);
      text("(S)he will cheat on you!", 3*width/4, height/2);
    } else if (mouseY<360) {
      song1.trigger();
      background (#110A89);
      image(image, 20, 30);
      image(image1, 20, 360);
      text("You'll be fired! ", 3*width/4, height/2);
    } else {
      background (#110A89);
      image(image, 20, 30);
      image(image1, 20, 360);
      text("Click your sign", 3*width/4, height/2);
    }
  } else if (mouseX<190) { 

    if (mouseY < 140) {  
      song2.trigger();
      background (#110A89);
      image(image, 20, 30);
      image(image1, 20, 360);
      text("You'll gain weight!", 3*width/4, height/2);
    } else if (mouseY < 260) {
      song2.trigger();
      background (#110A89);
      image(image, 20, 30);
      image(image1, 20, 360);
      text("You'll be realistic about your abilities", (3*width/4)-20, height/2);
      text("and you'll stop trying.", (3*width/4)-20, (height/2)+50);
    } else if (mouseY<360) {
      song2.trigger();
      background (#110A89);
      image(image, 20, 30);
      image(image1, 20, 360);
      text("You'll spend a lot of time on internet.", 3*width/4, height/2);
      text("You won't even notice that ", 3*width/4, (height/2)+50);
      text("your family have left you.", 3*width/4, (height/2)+100);
    } else {
      background (#110A89);
      image(image, 20, 30);
      image(image1, 20, 360);
      text("Click your sign", 3*width/4, height/2);
    }
  } else if (mouseX<270) {
    
    if (mouseY < 140) {  
      song3.trigger();
      background (#110A89);
      image(image, 20, 30);
      image(image1, 20, 360);
      text("Radical change in your life", 3*width/4, height/2);
      text("after joing a cult.", 3*width/4, (height/2)+50);
    } else if (mouseY < 260) {
      song3.trigger();
      background (#110A89);
      image(image, 20, 30);
      image(image1, 20, 360);
      text("You'll have to rely on your luck ", 3*width/4, height/2);
      text("since you have no talent. ", 3*width/4, (height/2)+50);
    } else if (mouseY<360){
      song3.trigger();
      background (#110A89);
      image(image, 20, 30);
      image(image1, 20, 360);
      text("You lack confidence", 3*width/4, height/2);
      text("and are generally a coward. ", 3*width/4, (height/2)+50);
      text("You won't change in 2015.", 3*width/4, (height/2)+100);
    }else {
      background (#110A89);
      image(image, 20, 30);
      image(image1, 20, 360);
      text("Click your sign", 3*width/4, height/2);
    }
  } else if (mouseX<360) {
    
    if (mouseY < 140) {  
      song4.trigger();
      background (#110A89);
      image(image, 20, 30);
      image(image1, 20, 360);
      text("Good year to start drinking!", 3*width/4, height/2);
    } else if (mouseY < 260) {
      song4.trigger();
      background (#110A89);
      image(image, 20, 30);
      image(image1, 20, 360);
      text("You don't need surgery, ", 3*width/4, height/2);
      text("you're ugly on the inside.", 3*width/4, (height/2)+50);
    } else if (mouseY<360){
      song4.trigger();
      background (#110A89);
      image(image, 20, 30);
      image(image1, 20, 360);
      text("You'll get a job...", 3*width/4, height/2);
      text("only for two weeks.", 3*width/4, (height/2)+50);
    }else {
      background (#110A89);
      image(image, 20, 30);
      image(image1, 20, 360);
      text("Click your sign", 3*width/4, height/2);
    }
  } else {
    background (#110A89);
    image(image, 20, 30);
    image(image1, 20, 360);
    text("Click your sign", 3*width/4, height/2);
  }
}


