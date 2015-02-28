
int x;
int y;
int d;
PFont font;
PImage hobbit;
PImage knight;
PImage alice;
PImage star;
PImage stranger;
PImage toy;
PImage dead;
PImage rises;
PImage skyfall;
PImage lotr;
PImage moon;
PImage hallows;
PImage avengers;
PImage titanic;
PImage avatar;

float [] rt = {.35, .06, .49, .43, .67, .01, .46, .13, .08, .06, .64, .04, .08, .12, .17};
int [] percent = {100, 90, 80, 70, 60, 50, 40, 30, 20, 10, 0};

void setup(){
  size(500,570);
  smooth();
  hobbit = loadImage("1 Hobbit.jpg");
  knight = loadImage("2 Dark Knight.jpg");
  alice = loadImage("3 Alice.jpg");
  star = loadImage("4 Star Wars.jpg");
  stranger = loadImage("5 On Stranger Tides.jpg");
  toy = loadImage("6 Toy Story.jpg");
  dead = loadImage("7 Dead Man's Chest.jpg");
  rises = loadImage("8 Dark Knight Rises.jpg");
  skyfall = loadImage("9 Skyfall.jpg");
  lotr = loadImage("10 Return of the King.jpg");
  moon = loadImage("11 Transformers.jpg");
  hallows = loadImage("12 Harry Potter.jpg");
  avengers = loadImage("13 Avengers.jpg");
  titanic = loadImage("14 Titanic.jpg");
  avatar = loadImage("15 Avatar.jpg");
  ellipseMode(CENTER);
  x = 50;
  y = 460;
  d = 15;
  background(255);
  font = loadFont("CopperplateGothic-Bold-48.vlw");
  fill(0);
  textAlign(CENTER);
  textFont(font);
  textSize(10);
//  textLeading(23);
  for(int i = 0; i < percent.length; i ++){
    text(percent[i], 50, i*(450/10));
    line(60, i*(450/10), 447, i*(450/10));
  }
  pushMatrix();
  textSize(23);
  translate(0, 450);
  rotate(HALF_PI);
  rotate(HALF_PI);
  rotate(HALF_PI);
  text("Rotten Tomatoes Rating", 200, 25);
  popMatrix();
}

void draw(){
 fill(0);
  ellipse(x, y, d, d);
}

void mouseDragged(){
  background(255);
  pushMatrix();
  textSize(23);
  translate(0, 450);
  rotate(HALF_PI);
  rotate(HALF_PI);
  rotate(HALF_PI);
  text("Rotten Tomatoes Rating", 200, 25);
  popMatrix();
  fill(0);
  ellipse(x, y, d, d);
//  translate(0, 10, -50);
  rectMode(CORNERS);
  textSize(10);
  for(int i = 0; i < percent.length; i ++){
    text(percent[i], 50, i*(450/10));
    line(60, i*(450/10), 447, i*(450/10));
  }
  textSize(25);
  textLeading(23);
  if((dist(x ,y,mouseX,mouseY) < 30/2 ) && (mouseX>50) && (mouseX<450)){
    x = x + (mouseX - pmouseX);
    if(x < 50 + width/19 && (x > 50)){
//      rect(100, 450*rt[0], 400, 425);
      image(hobbit, 100, 450*rt[0]);
      text("65%", width/2, (450*rt[0])-5);
      text("The Hobbit\n$1,001.4 billion", width/2, 490);
      }
      if( (x < 50 + width*2/19 && (x > 50 + width/19))){
//      rect(100, 450*rt[1], 400, 425);
      image(knight, 100, 450*rt[1]);
      text("94%", width/2, (450*rt[1])-5);
      text("The Dark Knight\n$1,004.6 billion", width/2, 490);
      }
  if( (x < 50 + width*3/19 && (x > 50 + width*2/19))){
//      rect(100, 450*rt[2], 400, 425);
      image(alice, 100, 450*rt[2]);
      text("51%", width/2, (450*rt[2])-5);
      text("Alice in Wonderland\n$1,024.3 billion", width/2, 490);
      }
  if( (x < 50 + width*4/19 && (x > 50 + width*3/19))){
//      rect(100, 450*rt[3], 400, 425);
      image(star, 100, 450*rt[3]);
      text("57%", width/2, (450*rt[3])-5);
      text("Star Wars: Episode I\nPhantom Menace\n$1,027.0 billion", width/2, 490);
      }
  if( (x < 50 + width*5/19 && (x > 50 + width*4/19))){
//      rect(100, 450*rt[4], 400, 425);
      image(stranger, 100, 450*rt[4]);
      text("33%", width/2, (450*rt[4])-5);
      text("Pirates of the Caribbean:\nOn Stranger Tides\n$1,043.9 billion", width/2, 490);
      }
  if( (x < 50 + width*6/19 && (x > 50 + width*5/19))){
//      rect(100, 450*rt[5], 400, 425);
      image(toy, 100, 450*rt[5]);
      text("99%", width/2, (450*rt[5])+20);
      text("Toy Story 3\n$1,063.2 billion", width/2, 490);
      }
  if( (x < 50 + width*7/19 && (x > 50 + width*6/19))){
//      rect(100, 450*rt[6], 400, 425);
      image(dead, 100, 450*rt[6]);
      text("54%", width/2, (450*rt[6])-5);
      text("Pirates of the Caribbean:\nDead Man's Chest\n$1,066.2 billion", width/2, 490);
      }
  if( (x < 50 + width*8/19 && (x > 50 + width*7/19))){
//      rect(100, 450*rt[7], 400, 425);
      image(rises, 100, 450*rt[7]);
      text("87%", width/2, (450*rt[7])-5);
      text("The Dark Knight Rises\n$1,081.0 billion", width/2, 490);
      }
  if( (x < 50 + width*9/19 && (x > 50 + width*8/19))){
//      rect(100, 450*rt[8], 400, 425);
      image(skyfall, 100, 450*rt[8]);
      text("92%", width/2, (450*rt[8])-5);
      text("Skyfall\n$1,108.3 billion", width/2, 490);
      }
  if( (x < 50 + width*10/19 && (x > 50 + width*9/19))){
//      rect(100, 450*rt[9], 400, 425);
      image(lotr, 100, 450*rt[9]);
      text("94%", width/2, (450*rt[9])-5);
      text("Lord of the Rings:\nThe Return of the King\n$1,119.9 billion", width/2, 490);
      }
  if( (x < 50 + width*11/19 && (x > 50 + width*10/19))){
//      rect(100, 450*rt[10], 400, 425);
      image(moon, 100, 450*rt[10]);
      text("36%", width/2, (450*rt[10])-5);
      text("Transformers:\nDark of the Moon\n$1,123.7 billion", width/2, 490);
      }
  if( (x < 50 + width*12/19 && (x > 50 + width*11/19))){
//      rect(100, 450*rt[11], 400, 425);
      image(hallows, 100, 450*rt[11]);
      text("96%", width/2, (450*rt[11]));
      text("Harry Potter and the\nDeathly Hallows Part 2\n$1,328.1 billion", width/2, 490);
      }
  if( (x < 50 + width*13/19 && (x > 50 + width*12/19))){
//      rect(100, 450*rt[12], 400, 425);
      image(avengers, 100, 450*rt[12]);
      text("92%", width/2, (450*rt[12])-5);
      text("Marvel's The Avengers\n$1,511.8 billion", width/2, 490);
      }
  if( (x < 50 + width*14/19 && (x > 50 + width*13/19))){
//      rect(100, 450*rt[13], 400, 425);
      image(titanic, 100, 450*rt[13]);
      text("88%", width/2, (450*rt[13])-5);
      text("Titanic\n$2,185.4 billion", width/2, 490);
      }
  if( (x < 50 + width*15/19 && (x > 50 + width*14/19))){
//      rect(100, 450*rt[14], 400, 425);
      image(avatar, 100, 450*rt[14]);
      text("83%", width/2, (450*rt[14])-5);
      text("Avatar\n$2,782.3 billion", width/2, 490);
      }
  }
}


