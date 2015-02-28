
PFont font;

PImage summer;
PImage fall;
PImage winter;
PImage spring;

void setup (){
size (900,450);

smooth();
noStroke();
font = loadFont ("Andalus-24.vlw");



summer = loadImage("summer.jpg");
fall = loadImage("fall.jpg");
winter = loadImage("winter.jpg");
spring = loadImage("spring.jpg");


}

void draw (){
//background(0);
fill(0,50);
rect(0,0,900,450);


if (mouseX >= 50 && mouseX <= 250 && mouseY >= 375 &&  mouseY <= 405){
  image (summer,50,50);
}
if (mouseX >= 250 && mouseX <= 450 && mouseY >= 375 &&  mouseY <= 405){
  image (fall,250,50);
}
if (mouseX >= 450 && mouseX <= 650 && mouseY >= 375 &&  mouseY <= 405){
  image (winter,450,50);
}
if (mouseX >= 650 && mouseX <= 850 && mouseY >= 375 &&  mouseY <= 405){
  image (spring,650,50);
}




fill(255);
textFont(font);    
textAlign(CENTER);
text("verano",150,400);
text("otoño",350,400);
text("invierno",550,400);
text("primavera",750,400);
}

