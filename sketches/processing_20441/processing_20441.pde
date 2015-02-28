
PFont font;
PImage img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11;


void setup(){
  size(640,480);
  smooth();
  font = loadFont ("Goudy.vlw");
  img1 = loadImage ("1_image.png");
  img2 = loadImage ("2_image.png");
  img3 = loadImage ("3_image.png");
  img4 = loadImage ("4_image.png");
  img5 = loadImage ("5_image.png");
  img6 = loadImage ("6_image.png");
  img7 = loadImage ("7_image.png");
  img8 = loadImage ("8_image.png");
  img9 = loadImage ("9_image.png");
  img10 = loadImage ("10_image.png");
  img11 = loadImage ("nostalgic.png");
  
}    

void draw(){
  background(#dac8bf);
  image(img11,0,0);
 
// Spell it out for me...
if(keyPressed){
if(key =='n'){
image(img1,0,0);
}
else if (key == 'o'){
image(img2,0,0);
}
if(keyPressed){
if(key =='s'){
image(img3,0,0);
}
else if (key == 't'){
image(img4,0,0);
}
if(keyPressed){
if(key =='a'){
image(img5,0,0);
}
else if (key == 'l'){
image(img6,0,0);
}
if(keyPressed){
if(key =='g'){
image(img7,0,0);
}
else if (key == 'i'){
image(img8,0,0);
}
if(keyPressed){
if(key =='c'){
image(img9,0,0);
}
else if (key == '.'){
image(img10,0,0);


}   
//  TEXT 
  fill(0);
  textFont(font);
  textSize(65);
  text("n",17,422,100,100);
  text("o",80,422,100,100);
  text("s",144,422,100,100);
  text("t",209,422,100,100);
  text("a",278,422,100,100);
  text("l",347,422,100,100);
  fill(250);
  text("g",408,422,100,100);
  fill(0);
  text("i",475,422,100,100);
  text("c",537,422,100,100);
  text("...",585,422,100,100);
}
 
  }
}
}
}
}

