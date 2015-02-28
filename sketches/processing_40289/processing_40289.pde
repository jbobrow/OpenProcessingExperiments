
size(500,700);

PImage hide; //I'm declaring the photo...uh I think
hide= loadImage("hide.jpg");//here is the photo
image(hide,CENTER,CENTER);//I want it in the middle puhleez

PFont font;
font =loadFont ("Anythingyouwant-45.vlw");
textFont(font);//i dont know what this step is it looks stupid

fill(206,130,234);

String s ="Hide and Seek";
text (s, 100,100,700,100);

//colorMode(HSB);
//for(int i=0; i<100;i++){
 // stroke(132,108,i*2);
 // point(1,100);
//stroke(5-100);
smooth();
for(int i=30; i<100; i++) {
  float r = random(i+width);
  stroke((r*10)+15);
  ellipse(r, r+10*r, r+45, 10);
  strokeWeight(2);
}

