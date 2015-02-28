
/* @pjs font="Belleza-Regular.ttf"; */

int x = 0;
PFont bell;
PImage tree;

void setup() {

size (960, 640);
tree = loadImage("Tree.jpg");
bell=loadFont("Belleza-Regular.ttf");
}

void draw() {
  background(50);

image(tree, 0, 0);


textFont(bell, 80);
fill(#6F0827);
text("And as the years go by", 0, 350);

textFont(bell, 50);

fill(#393939);
text("Our", 30, 413);

fill(#585151);
text("friendship", 124, 413);

fill(#717070);
text("will", 348, 413);

fill(#B7B7B7);
text("never", 431, 413);

fill(#D3D3D3);
text("die", 555, 413);


textFont(bell, 100);
fill(#DE285F);
text("You're gonna see", 80, 490);

textFont(bell, 70);
fill(#6F0827);
text("it's our destiny", 300,555);

textFont(bell, 45);
fill(#7C7979);
text("You've got a friend in me", 12, 610);

noStroke();
fill(#141D2C);
ellipse(x,25,45,30);
ellipse(x+20,25,25,20);
fill(#59606C);
ellipse(x,35,28,8);
noStroke();
fill(#FCCA5C);
triangle(x+32, 30, x+32, 25, x+40, 27);
stroke(20);
fill(#141D2C);
triangle(x-10, 25, x+10, 25, x-15, 45);
x=x+5;

if (x>width) {
  x=0;
}

}



