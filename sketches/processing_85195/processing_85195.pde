
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  noStroke();
  curposX = width/2;
  curposY = height/2;
  len     = 50;
  hue     = 100;
  amplitude = 10; 
}

void draw() {  //draw function loops 
  if (mousePressed) {
      hue = random(245)+10;
      amplitude = random(10)+3;
      fill(0);
      rect(0,0,width,height);     
  }
  counter+=1;
  curposX += counter;
  curposX = curposX % (width + len); 
  for(i=0; i<len; i++) {
      xbeg  = curposX + i;
      xend  = curposX + i - len;
      ybeg  = curposY + sin(xbeg*(hue/10.)/360*TWO_PI)*amplitude;
      yend  = curposY + sin(xend*(hue/10.)/360*TWO_PI)*amplitude;
      fill(hue,255,100-i, i);
      ellipse(xbeg, ybeg, 5, 5);
      fill(0,0,0,100);
      ellipse(xend, yend, 5, 5);
  }
}
