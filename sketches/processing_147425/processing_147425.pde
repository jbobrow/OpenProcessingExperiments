
//Copyright Christopher Henley 2014
//ICE 16

int xCords[]={100,200,270,150};
int yCords[]={270,200,85,60};
int dims[]={50,70,100,20};

color colorListRect[]={color(200,0,0),
                       color(0,0,200),
                       color(0,200,0),
                       color(0,0,200),
};
color colorListEll[]={color(200,200,0),
                      color(0,200,200),
                      color(200,200,0),
                      color(0,200,200),
};

void setup(){
  size(400,400);
  strokeWeight(3);
  ellipseMode(CORNER);
}

void draw(){
  background(200);
  drawAllDesigns();
  noLoop();
}

void drawAllDesigns(){
  for(int i=0; i<xCords.length; i++){
    fill(colorListRect[i]);
    rect(xCords[i],yCords[i],dims[i],dims[i]);
    fill(colorListEll[i]);
    ellipse(xCords[i],yCords[i],dims[i]/2,dims[i]/2);
    line(xCords[i]+dims[i],yCords[i],xCords[i],yCords[i]+dims[i]);
  }
}




