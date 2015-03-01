
int value=0;
PImage photo;

void setup() {  //setup function called initially, only once
  size(600, 600);
  background(300,200,10);  //set background white
  photo=loadImage("https://i1.sndcdn.com/avatars-000003602025-igl3tr-t500x500.jpg?e76cf77")
    
    //colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
}

void draw() {  //draw function loops 
  image(photo, 50,50);
  ellipse(mouseX,300,mouseX,10);
  ellipse(300,mouseY,10,mouseY);
  //rect(400,400,100,100);
  noStroke();
  fill(random255)(0,20,200);
}

