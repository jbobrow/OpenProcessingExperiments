
int color1 = 0;
int color2 = 0;
int color3 = 0;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(0);  //set background white
  counter = 0;
}

void draw() {  //draw function loops
if(mousePressed == true){
color1 = random(150,255);
color2 = random(150,255);
color3 = random(150,255);
}
stroke(color1, color2, color3);
strokeWeight(2);
line(0,0,mouseX,mouseY);
line(250,0,mouseX,mouseY);
line(0,250,mouseX,mouseY);
line(250,250,mouseX,mouseY);
}
