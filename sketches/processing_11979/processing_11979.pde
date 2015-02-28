
int xCount=5, yCount=5, xMax=20, yMax=20;
color[] palette = new color[11];


void setup() {
  colorMode(HSB,360,100,100);
  size(800,600);
  //  int lineLength=int(sqrt(sq(width)+sq(height)));
  //  int offY=(lineLength-height)/2;
  //  int offX=(lineLength-width)/2;
  palette[0]=color(225,71,30);
  palette[1]=color(222,70,43,0);
  palette[2]=color(222,70,43,60);
  palette[3]=color(220,61,56,75);
  palette[4]=color(220,46,72,75);
  palette[5]=color(220,38,80,50);
  palette[6]=color(220,25,80,10);
  palette[7]=palette[5];
  palette[8]=palette[5];
  palette[9]=palette[5];
  palette[10]=palette[5];
  
  background(palette[0]);
  drawLines();
}

void draw() {
}

void drawLines() {
  background(palette[0]);

  for (int k=1;k<palette.length;k++) {
    stroke(palette[k]);
    strokeWeight((1.0/pow(2,k))*(height/(yCount+.01))*6);
    yLines();
    strokeWeight((1.0/pow(2,k))*(width/(xCount+.01))*6);
    xLines();
  }
  
}



void mouseMoved() {
  xCount=floor(map(mouseX,0,width,0,xMax));
  yCount=floor(map(mouseY,0,height,0,yMax));
  palette[0]=color(225,71,int(map(mouseX+mouseY,0,height+width,30,2)));
  drawLines();
}


void yLines() {
  for (int i=1;i<yCount;i++) {
    line(0,i*height/yCount,width,i*height/yCount);
  }
}
void xLines() {
  for (int j=1;j<xCount;j++) {
    line(j*width/xCount,0,j*width/xCount,height);
  }
}


