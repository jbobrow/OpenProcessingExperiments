
//variables//
PImage cat;
PFont font;


void setup(){
  size(600, 534);
  smooth();
  
  cat= loadImage("cat-200px.png");
  font= loadFont("SueEllenFrancisco-48.vlw");
}

void draw(){
  background(0);
  
//changing colored boxes if mouse clicked//
  if (mousePressed == true){
    coloredBoxes2();
  } else {
    coloredBoxes1();
  }  
  
  //display quote when key pressed//
  if (keyPressed == true){
  textFont(font); 
  text("art is what you can get away with.", 50, 230);
  text("-andy warhol", 200, 320);
  }
}

void coloredBoxes1(){
  tint(0, 153, 214, 500);
  image(cat, 0, 0, 200, 267);
  tint(253, 10, 10, 500);
  image(cat, 200, 0, 200, 267);
  tint(227, 253, 10, 500);
  image(cat, 400, 0, 200, 267);
  tint(10, 253, 21, 700);
  image(cat, 0, 267, 200, 267);
  tint(227, 10, 253, 700);
  image(cat, 200, 267, 200, 267);
  tint(253, 136, 10, 700);
  image(cat, 400, 267, 200, 267);

}

void coloredBoxes2(){
  tint(193, 109, 198, 700);
  image(cat, 0, 0, 200, 267);
  tint(109, 198, 117, 400);
  image(cat, 200, 0, 200, 267);
  tint(236, 89, 44, 500);
  image(cat, 400, 0, 200, 267);
  tint(243, 57, 110, 400);
  image(cat, 0, 267, 200, 267);
  tint(47, 223, 196, 500);
  image(cat, 200, 267, 200, 267);
  tint(243, 210, 57, 500);
  image(cat, 400, 267, 200, 267);

}
  

