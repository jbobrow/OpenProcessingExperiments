
ArrayList history = new ArrayList();
float distthresh = 200;
import ddf.minim.*;

AudioPlayer player;
Minim minim;

PImage myBG;

//LIGHT THEME
PImage snap_light;
PImage info_light;

//DARK THEME
PImage snap_dark;
PImage info_dark;


boolean info_switch = true;
boolean theme_switch = true;


void setup(){
  size(1000,600);
  smooth();
  snap_light = loadImage("snap_light.png");
  snap_dark = loadImage("snap_dark.png");
  
  info_light = loadImage("info_light.png");
  info_dark = loadImage("info_dark.png");
  
  
  image(info_dark,0,0);
  minim = new Minim(this);
  player = minim.loadFile("flash.wav");

}

void draw(){  

}

//LINES------------ADAPTED FROM HARMONY_WEB_REMAKE by MICTCHELL WHITELAW
//http://openprocessing.org/visuals/?visualID=8168

void mouseDragged(){
   stroke(0,random(150,255),random(150,255),random(50,255));
    PVector d = new PVector(mouseX,mouseY);
    history.add(0,d);
     
    for (int p=0; p<history.size(); p++){
      PVector v = (PVector) history.get(p);
      float joinchance = p/history.size() + d.dist(v)/distthresh;
      if (joinchance < random(0.7))  line(d.x,d.y,v.x,v.y);
    }
    
    stroke(255);
    noFill();
    rectMode(CENTER);
    ellipse(d.x,d.y,6,6);
    
}


void mousePressed(){
  stroke(random(150,255),0,random(150,255));
  PVector d = new PVector(mouseX,mouseY,0);
  history.add(0,d);
   
  for (int p=0; p<history.size(); p++){
    PVector v = (PVector) history.get(p);
    float joinchance = p/history.size() + d.dist(v)/distthresh;
    if (joinchance < random(0.75))  line(d.x,d.y,v.x,v.y);
  }
  
  stroke(255);
  fill(255,255,255,50);
  rectMode(CENTER);
  rect(d.x,d.y,15,15);
  
}
//END LINES---------------------------

//MY OWN CODE 
void keyPressed(){
  //THEME SELECTION
  if(key=='w'){
    theme_switch=true;
    background(255);
    history.clear();
  }
  if(key=='b'){
    theme_switch=false;
    println(theme_switch);
    background(0);
    history.clear();
  }
  
  //THEME SETTINGS
  if(theme_switch==true){
    
    if(key=='f'){
       history.clear();
       fill(255,255,255,125);
       noStroke();
       rectMode(CORNER);
       rect(0,0,width,height);
    }
    else if(key=='s'){
      save("mySketch.jpg");
      image(snap_dark,0,0);
      player.play();
    }
    else if(key==' '){
      noStroke(); 
      fill(255,255,255,125);
      rectMode(CORNER);
      rect(0,0,width,height);
    }
    else if(key=='i'){
      if(info_switch==true){
        save("myBG.jpg");
        image(info_light,0,0);
        info_switch=false;
      }
      else if(info_switch==false){
        myBG = loadImage("myBG.jpg");
        image(myBG,0,0);
        info_switch=true;
      }
    }
  }
  if(theme_switch==false){
    println(theme_switch);
    if(key=='f'){
       history.clear();
       fill(0,0,0,125);
       noStroke();
       rectMode(CORNER);
       rect(0,0,width,height);
    }
    else if(key=='s'){
      save("mySketch.jpg");
      image(snap_light,0,0);
      player.play();
    }
    else if(key==' '){
      noStroke(); 
      fill(0,0,0,125);
      rectMode(CORNER);
      rect(0,0,width,height);
    }
    else if(key=='i'){
      if(info_switch==true){
        save("myBG.jpg");
        image(info_dark,0,0);
        info_switch=false;
        println("HI");
      }
      else if(info_switch==false){
        myBG = loadImage("myBG.jpg");
        image(myBG,0,0);
        info_switch=true;
      }
    }
  }
}
  
 
 











