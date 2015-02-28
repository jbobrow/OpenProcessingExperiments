
PFont f;
  
void setup() {
  size(600, 600);
  // printArray(PFont.list());
  f = createFont("Courier-Bold", 20);
  textFont(f);
}

void draw() {
  background(0);
  textAlign(LEFT);
  drawType(width*0.01);
  
  
}

void drawType(Float x) {
  
  noStroke();
  int R = width-mouseX;
  float fR=(width-mouseX)/10;
  frameRate(fR+1);
  fill(R,0,0);
  rect(0, 0, width, height);
  int d=20;
  float xR=random(x,width-x);
  
 
  
  fill(0,0,0);
  text("35th MAY,1989 - Don Tsang",x, height-29*d);
  fill(random(0,width-mouseX),0,0);
  text("Nothing happened in the year before 90s.",random(x,width-x), height-28*d);
  fill(random(0,width-mouseX),0,0);
  text("Fireworks were in the square.",random(x,width-x), height-27*d);
  fill(random(0,width-mouseX),0,0);
  text("They lighted firecrackers.",random(x,width-x),height-26*d);
  fill(random(0,width-mouseX),0,0);
  text("Students gathered and cheered,",random(x,width-x),height-25*d);
  fill(random(0,width-mouseX),0,0);
  text("Headed up to the ever greatest.",random(x,width-x),height-24*d);
  fill(random(0,width-mouseX),0,0);
  text("A fantasy for the red sun, the ever reddest sun.",random(x,width-x),height-23*d);
  fill(random(0,width-mouseX),0,0);
  text("Roses filled the ground.",random(x,width-x),height-22*d);
  fill(random(0,width-mouseX),0,0);
  text("The wall was red, roses were dead.",random(x,width-x),height-21*d);
  fill(random(0,width-mouseX),0,0);
  text("No guns, no bullets.",random(x,width-x),height-20*d);
  fill(random(0,width-mouseX),0,0);
  text("No guns, no bullets.",random(x,width-x),height-19*d);
  fill(random(0,width-mouseX),0,0);
  text("And they stepped on the roses",random(x,width-x),height-17*d);
  fill(random(0,width-mouseX),0,0);
  text("",random(x,width-x),height-16*d);
  fill(random(0,width-mouseX),0,0);
  text("It was 5th June, 1989.",random(x,width-x),height-15*d);
  fill(random(0,width-mouseX),0,0);
  text("Walking along the road, what a sunny day.",random(x,width-x),height-14*d);
  fill(random(0,width-mouseX),0,0);
  text("The greatest city was peace and never ever so clean",random(x,width-x),height-13*d);
  fill(random(0,width-mouseX),0,0);
  text("They told me the truth, ",random(x,width-x),height-12*d);
  fill(random(0,width-mouseX),0,0);
  text("And hear them whispering to us:",random(x,width-x),height-11*d);
  fill(random(0,width-mouseX),0,0);
  text("",random(x,width-x),height-10*d);
  fill(random(0,width-mouseX),0,0);
  text("'You should keep silence and listen.",random(x,width-x),height-9*d);
  fill(random(0,width-mouseX),0,0);
  text("Cuz I am the one.",random(x,width-x),height-8*d);
  fill(random(0,width-mouseX),0,0);
  text("You should obey.",random(x,width-x),height-7*d);
  fill(random(0,width-mouseX),0,0);
  text("I give you all you need.",random(x,width-x),height-6*d);
  fill(random(0,width-mouseX),0,0);
  text("You should be controlled.",random(x,width-x),height-5*d);
  fill(random(0,width-mouseX),0,0);
  text("I the authority with harmony.'",random(x,width-x),height-4*d);
  fill(random(0,width-mouseX),0,0);
  text("",random(x,width-x),height-3*d);
  fill(random(0,width-mouseX),0,0);
  text("Yes I love this land,",random(x,width-x),height-2*d);
  fill(random(0,width-mouseX),0,0);
  text("But she is always the coldest land of red.",random(x,width-x),height-1*d);
  
}


