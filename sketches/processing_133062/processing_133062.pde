
PImage photo;
PFont f;

void setup() {
  size(330, 150);
  photo =loadImage("pattern doodle.png");
  smooth();
}

void draw(){
 background(photo);
 
 if(mousePressed) {
  filter(INVERT);
  
   f = loadFont("Eraser_Regular-30.vlw");
  textFont(f);
  textAlign(CENTER, CENTER);
  //textSize(30);
  fill(0,255,0);
 text("Accademia di", 180,37);
 text("Belle Arti", 211,68);
  text("Catania", 232,100);
      
fill(255,0,0);
noStroke();
translate(95,95);
rotate(frameCount/1.1);
rect(-1,-15,5,45);

}else{
  
  f = loadFont("Eraser_Regular-30.vlw");
  textFont(f);
  textAlign(CENTER, CENTER);
  //textSize(30);
  fill(255,0,0);
  text("Accademia di", 180,37);
  text("Belle Arti", 211,68);
   text("Catania", 232,100);
  
  filter(BLUR,random(2));
  
fill(5,57,230);
noStroke();
translate(95,95);
rotate(frameCount/1.1);
rect(-1,-15,5,45);

}
 
}


