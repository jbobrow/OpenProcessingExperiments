
import rita.*;
import java.util.HashMap;

RiGrammar rg;
PFont font;
int time = 0;
int deadCount = 0;
String killer = "";
PShape knife, candlestick, gun, pipe, wrench, current_shape, killer_shape, current_killer, victim_shape, current_victim;
int panelW = 265;
int panelH = 200;
int colorVal = 190;
int redVal = 250;
HashMap dead;
PImage billiards, dining, kitchen, hall, lounge, library, study, current;
color plum = color(130,40,90);
color white = color(250,250,230);
color scarlet = color(190,30,50);
color greene = color(30,110,50);
color mustard = color(210,190,24);
color peacock = color(50,120,120);
color killer_color = color(5,0,0);
color victim_color = color(0,0,0);


void setup(){
  size(900,300);
  background(255);
  
  dead = new HashMap();
  dead.put("white","false");
  dead.put("plum","false");
  dead.put("scarlet","false");
  dead.put("green","false");
  dead.put("mustard","false");
  dead.put("peacock","false");
  
  billiards = loadImage("billiards.jpg");
  dining = loadImage("dining.jpg");
  kitchen = loadImage("kitchen.jpg");
  hall = loadImage("hall.jpg");
  lounge = loadImage("lounge.jpg");
  library = loadImage("library.jpg");
  study = loadImage("study.jpg");
  current = loadImage("mystery.png");
  
  knife = loadShape("knife.svg");
  candlestick = loadShape("candlestick.svg");
  gun = loadShape("gun.svg");
  pipe = loadShape("pipe.svg");
  wrench = loadShape("wrench.svg");
  current_shape = loadShape("blankShape.svg");
  current_killer = loadShape("blankShape.svg");
  killer_shape = loadShape("killer.svg");
  victim_shape = loadShape("victim.svg");
  current_victim = loadShape("blankShape.svg");
  
  rg = new RiGrammar(this,"murdergrammar.g");
  font = createFont("arial", 40);
}

void draw(){
  background(255);
  
  smooth();
  stroke(0);
  fill(255);
  strokeWeight(4);
  rect(25,40,panelW,panelH);
  rect(25*2+panelW,40,panelW,panelH);
  rect(25*3+2*panelW,40,panelW,panelH);
  insertImage(current);
  
  shape(current_shape,25*2+panelW+2,42,panelW-3,panelH);
  fill(killer_color);
  shape(current_killer,25,40,panelW,panelH);
  fill(victim_color);
  shape(current_victim,25*3+2*panelW,40,panelW,panelH);
}

void mousePressed(){
    String[] caption = synthText();
    if (caption.length == 0){
      current = loadImage("mystery.png");
      current_shape = loadShape("blankShape.svg");
    }
    else{
      String room = caption[7];
      String weapon = caption[caption.length-2];
      String killercolor = caption[1];
      String victimcolor = caption[4];
            
      if (room.equals("billiard")){
        current = billiards;
      }
      if (room.equals("dining")){
        current = dining;
      }
      if (room.equals("kitchen")){
        current = kitchen;
      }
      if (room.equals("hall")){
        current = hall;
      }
      if (room.equals("lounge")){
        current = lounge;
      }
      if (room.equals("library")){
        current = library;
      }
      if (room.equals("study")){
        current = study;
      }
      if (weapon.equals("pipe")){
        current_shape = pipe;
      }
      if (weapon.equals("revolver")){
        current_shape = gun;
      }
      if (weapon.equals("knife")){
        current_shape = knife;
      }
      if (weapon.equals("candlestick")){
        current_shape = candlestick;
      }
      if (weapon.equals("wrench")){
        current_shape = wrench;
      }
      if (killercolor.equals("white")){
        killer_color = white;
      }
      if (killercolor.equals("plum")){
        killer_color = plum;
      }
      if (killercolor.equals("scarlet")){
        killer_color = scarlet;
      }
      if (killercolor.equals("green")){
        killer_color = greene;
      }
      if (killercolor.equals("mustard")){
        killer_color = mustard;
      }
      if (killercolor.equals("peacock")){
        killer_color = peacock;
      }
      if (victimcolor.equals("white")){
        victim_color = white;
      }
      if (victimcolor.equals("plum")){
        victim_color = plum;
      }
      if (victimcolor.equals("scarlet")){
        victim_color = scarlet;
      }
      if (victimcolor.equals("green")){
        victim_color = greene;
      }
      if (victimcolor.equals("mustard")){
        victim_color = mustard;
      }
      if (victimcolor.equals("peacock")){
        victim_color = peacock;
      }
      
      time = millis();
      colorVal = colorVal - 40;
      redVal = redVal - 10;
    }
  }

void insertImage(PImage img){
  image(img,25+2,42,panelW-4,panelH-3);
  image(img,25*2+panelW+2,42,panelW-3,panelH-4);
  image(img,25*3+2*panelW+2,42,panelW-3,panelH-4);
}  

String[] synthText(){
  current_killer = killer_shape;
  current_killer.disableStyle();
  current_victim = victim_shape;
  current_victim.disableStyle();
  if (deadCount == 5) {
    String endgame = killer + " is alone.";
    current_killer = loadShape("blankShape.svg");
    current_victim = loadShape("blankShape.svg");
    tint(killer_color);
    RiText result = new RiText(this,endgame,450,280);
    result.textFont(font,20);
    result.textAlign(CENTER);
    String[] empty = {};
    return empty;
  } 
  RiText result = new RiText(this,rg.expand(),450,280);
  result.setVisible(false);
  String[] words = result.getWords();
  while (words[1].equals(words[4]) | dead.get(words[1]) == "true" | dead.get(words[4]) == "true"){
    result = new RiText(this,rg.expand(),450,280);
    result.setVisible(false);
    words = result.getWords();
  }
  dead.put(words[4],"true");
  result.setVisible(true);
  result.textFont(font,20);
  result.textAlign(CENTER);
  result.fadeOut(3);
  deadCount++;
  killer = words[0] + " " + words[1];
  tint(redVal,colorVal,colorVal);
  return words;
}

