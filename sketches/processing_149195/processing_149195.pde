
/* @pjs font="BLACKOAKSTD.otf"; */

float l_move, pop, type_size, blue, incrementor, xpos, ypos;
PImage lake, jay;
PFont times, arial, blackoak;

void setup(){
  size(700,700);
  times = createFont("Times New Roman",32);
  arial = createFont("Arial",32);
  blackoak = createFont("Blackoak Std",32);
  
  lake = loadImage("lake.jpg");
  jay = loadImage("walrus.jpg");
}

void draw(){
  
  background(0);
  textFont(times,38);
  
  if (pop<=200) {
    if (l_move<=100){
      l_move++;
      blue= map(cos(incrementor), -1, 1, 0, 255);
      fill(0, 0, blue);
      ellipse(600,100, 150, 150);
      incrementor +=0.05;
    }
    textFont(arial,38);
    text("Life, friends, is boring",l_move,100);
    
    if (l_move>100 && pop<=200){
      pop++;
    }
    
    if (pop>=20){
      text("We",100,140);
    }
      
    if (pop>=40) {
      text("must",170,140);
    }
      
    if (pop>=60) {
      text("not",260,140);
    }
      
    if (pop>=80) {
      text("say",320,140);
    }
    
    if (pop>=100) {
      text("so.",385,140);
    }
    
    if (pop<=100){
      image(lake,0,250);
    }
  }
  
  if (pop>=200 && type_size<=200){
    image(jay,0,300);
    textFont(blackoak,type_size);
    fill(255,0,0);
    text("AHHHHHHHHHHHH!",100,100);
    
    textFont(blackoak,40);
    text("GERBILS",100,0+ypos);
    text("FUDGE!",50,120+ypos);
    text("TOM SELLECK!",200,250+ypos);
    text("MADNESS",300,340+ypos);
    text("FLUIDS",400,470+ypos);
    text("NONSENSE",500,140+ypos);
    type_size++;
    ypos++;
  } else if (pop>=200 && type_size>=200) {
    blue= map(cos(incrementor), -1, 1, 0, 255);
    fill(0, 0, blue);
    ellipse(width/2, width/2, 150, 150);
    incrementor +=0.05;
  }
  
  
  
}


