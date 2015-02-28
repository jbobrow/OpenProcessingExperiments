
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
int count = 0;
int count2 = 0;
int count3 = 0;
int count4 = 0;
int count5 = 0;
PImage banner1;
PImage banner2;
PImage temp;
String state = "";

void setup(){
  size(200,900);
  noStroke();
  frameRate(30);
  banner1 = loadImage("banner.jpg");
  banner1.loadPixels();
  banner2 = loadImage("banner2.jpg");
  banner2.loadPixels();
  background(banner2);
  minim = new Minim(this);
  song = minim.loadFile("water.mp3");
}

void mouseDragged(){
  song.play();
  if (mouseX >0 && mouseX < width && mouseY >0 && mouseY < height-30){
    temp = banner1.get(mouseX,mouseY,60,60);
    image(temp,mouseX,mouseY);
    fill(255);
    for (int i = 0; i<75; i++){
      float siz = random(5);
      ellipse(mouseX-30+(random(120)),mouseY-30+(random(120)),siz,siz);
    }
  }
}

void mouseReleased(){
  song.pause();
  if (mouseX >0 && mouseX < width && mouseY >0 && mouseY < height-30){
    temp = banner1.get(mouseX,mouseY,60,60);
    image(temp,mouseX,mouseY);
    fill(255);
    for (int i = 0; i<75; i++){
      float siz = random(5);
      ellipse(mouseX-30+(random(120)),mouseY-30+(random(120)),siz,siz);
    }
  }
}

void mouseMoved(){
  if (state.equals("drop") || state.equals("splat") || state.equals("drip")){
  }
  else {
    state = "drop";
  }
}

void draw(){
  if (state.equals("drop")){
    if (count<60){
      background(banner2);
      fill(0,200,40);
      ellipse(25,25,100-count,100-count);
      ellipse(69,75,90-count,90-count);
      ellipse(118,30,110-count,110-count);
      ellipse(160,100,80-count,80-count);
      ellipse(194,50,90-count,90-count);
      ellipse(50,500,100-count,100-count);
      ellipse(25,250,90-count,90-count);
      ellipse(194,400,110-count,110-count);
      ellipse(120,600,80-count,80-count);
      ellipse(160,300,90-count,90-count);
      count+=2;
    }
    else{
      state = "splat";
    }
  }
  if (state.equals("splat")){
    if (count<61 && count>30){
      background(banner2);
      fill(0,200,40);
      ellipse(25,25,100-count,100-count);
      ellipse(69,75,90-count,90-count);
      ellipse(118,30,110-count,110-count);
      ellipse(160,100,80-count,80-count);
      ellipse(194,50,90-count,90-count);
      ellipse(50,500,100-count,100-count);
      ellipse(25,250,90-count,90-count);
      ellipse(194,400,110-count,110-count);
      ellipse(120,600,80-count,80-count);
      ellipse(160,300,90-count,90-count);
      for (int i = 0; i<500; i++){
        float siz = random(10);
        ellipse(random(200),(random(600)),siz,siz);
      }
      count-=10;
    }  
    else{
      count = 0;
      state = "drip";
    }
  }
  if (state.equals("drip")){
    fill(count5/5,200-count/5,40-count/5);
    ellipse(25,count+25,50,50);
    ellipse(69,count2+75,40,40);
    ellipse(118,count3+30,60,60);
    ellipse(160,count5+100,30,30);
    ellipse(194,count2+50,40,40);
    ellipse(50,count+500,50,50);
    ellipse(25,count2+250,40,40);
    ellipse(194,count3+400,60,60);
    ellipse(120,count5+600,30,30);
    ellipse(160,count2+300,40,40);
    count+=3;
    count2+=2;
    count3+=4;
    count5+=1;
  }
}

void stop(){
  song.close();
  minim.stop();
  super.stop();
}

