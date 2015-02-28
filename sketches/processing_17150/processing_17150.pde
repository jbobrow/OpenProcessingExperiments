
int sc = 10;

void setup() {
  size(600,600);
  background(255);

  // GRID OF LINES
  for (int i=0;i<11;i++) { 
    stroke(0);
    strokeWeight(1);
    line(0,0+i*(height/sc),width,0+i*(height/sc));
    line(0+i*(height/sc),0,0+i*(height/sc),width);
    line(0,0+i*(height/sc*2),width,height+i*(height/sc*2));
    line(0,0-i*(height/sc*2),width,height-i*(height/sc*2));
    line(0+i*(height/sc*2),height,width,0+i*(height/sc*2));
    line(0-i*(height/sc*2),height,width,0-i*(height/sc*2));
  }
  // BLACK SURFACES
  fill(0);
  noStroke();
  quad(width/sc*2,0,width/sc*7,height/sc*5,width/sc*8,height/sc*4,width/sc*4,0);
  quad(width/sc*2,height,width/sc*4,height,width,height/sc*4,width,height/sc*2);
  quad(width/sc*6,height/sc*8,width/sc*5,height/sc*9,width/sc*6,height,width/sc*8,height);

  // THICK LINES
  for (int i=0;i<20;i++) {
    noFill();
    stroke(0);
    strokeWeight(2);
    line(0,0+i*(height/sc*2),width/sc*6,height/sc*6+i*(height/sc*2));
    line(width-i*(width/sc*2),0,width/sc*7-i*(width/sc),height/sc*3-i*(height/sc));
    line(width-i*(width/sc*2),0,width/sc*7-i*(width/sc),height/sc*3-i*(height/sc));
    line(width/sc*6+i*(width/sc*2),height,width,height/sc*6+i*(height/sc*2));
    rect(0,0,width,height);
  }
  // WHITE THIN LINES
  stroke(255);
  strokeWeight(1);
  line(width/sc*7,height/sc*5,width/sc*8,height/sc*4);
  line(width/sc*5,height/sc*9,width/sc*6,height/sc*8);
}

