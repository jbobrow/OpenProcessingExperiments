
int counter;
int[] xpos = new int[50];
int[] ypos = new int[50];
 
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  smooth();
  for (int i =0; i < xpos.length; i++){
    xpos[i] =0;
    ypos[i] =0;
  }
 
}
 
void draw() {  //draw function loops
  counter++;
    for (int i = 0; i< xpos.length-1; i++){
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
}
 xpos[xpos.length-1] = mouseX;
 ypos[ypos.length-1] = mouseY;
 
  stroke(0);
 // rectMode(CENTER);
 // rect(130,175,100,100);
//  rect(130,75,100,100);
strokeWeight(10);
noFill();
beginShape();
  arc(130,175,100,100, -PI /2, PI/2);
  arc(130,75,100,100, -PI / 2, PI/2);
  line(130, 225, 80, 225);
  line(80, 225, 80, 25);
  line(80, 25, 130, 25);
  line(115, 185, 115, 165);
  line(115, 60, 115, 85);
  arc(120, 175, 20, 20, -PI / 2, PI/2);
  arc(120, 72, 20, 24, -PI / 2, PI/2);
  endShape();
 
  noStroke();
     
  if(mousePressed == true) { //add some interaction
    for (int i=0; i< xpos.length; i++){
   noStroke();
   fill(mouseX,mouseY,150);
   ellipse(mouseX,mouseY,20,20);
 }
 
  }
  else {
 //   ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}

