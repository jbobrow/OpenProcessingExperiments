
/* 
 Daniel C. Young
 Microsoft Logo #3
 10/06/2011
 */

float xval,yval,x,y,alph;
color c1,c2,c3,c4,c5,c6,c7,c8,c9;
int hue1,hue2,sat1,sat2,bri1,bri2;

void setup(){
  size(800, 800);
  smooth();
  colorMode(HSB, 100);
  mousePressed();
}

void draw(){
  fill(20, 5);
  noStroke();
  rect(0, 0, width, height);
  
  x = map(mouseX,0,width,width/2-30,width/2+30);
  y = map(mouseY,0,height,height/2-30,height/2+30);
  
  strokeWeight(50);
  stroke(c1);
  line(x-150,y-245,x-200+xval,y+15+yval);
  stroke(c2);
  line(x-200+xval,y+15+yval,x-130-xval,y+80-yval);
  stroke(c3);
  line(x-130-xval,y+80-yval,x-145,y+185);
  
  stroke(c4);
  line(x+5,y-245,x+30+xval,y-125+yval);
  stroke(c5);
  line(x+30+xval,y-125+yval,x-25-xval,y-50-yval);
  stroke(c6);
  line(x-25-xval,y-50-yval,x,y+185);
  
  stroke(c7);
  line(x+145,y-245,x+140+xval,y-70+yval);
  stroke(c8);
  line(x+140+xval,y-70+yval,x+185-xval,y+15-yval);
  stroke(c9);
  line(x+185-xval,y+15-yval,x+145,y+185);
  
  xval = map(mouseX,0,width,-30,30);
  yval = map(mouseY,0,height,-30,30);
}

void mousePressed(){
  hue1 = 40;
  hue2 = 60;
  sat1 = 80;
  sat2 = 100;
  bri1 = 50;
  bri2 = 100;
  alph = 50;
  
  c1 = color(random(hue1,hue2),random(sat1,sat2),random(bri1,bri2),alph);
  c2 = color(random(hue1,hue2),random(sat1,sat2),random(bri1,bri2),alph);
  c3 = color(random(hue1,hue2),random(sat1,sat2),random(bri1,bri2),alph);
  c4 = color(random(hue1,hue2),random(sat1,sat2),random(bri1,bri2),alph);
  c5 = color(random(hue1,hue2),random(sat1,sat2),random(bri1,bri2),alph);
  c6 = color(random(hue1,hue2),random(sat1,sat2),random(bri1,bri2),alph);
  c7 = color(random(hue1,hue2),random(sat1,sat2),random(bri1,bri2),alph);
  c8 = color(random(hue1,hue2),random(sat1,sat2),random(bri1,bri2),alph);
  c9 = color(random(hue1,hue2),random(sat1,sat2),random(bri1,bri2),alph);
}

void keyPressed() {
  if (keyCode == 83) {
    saveFrame("ms03-##.tif");
  }
}

