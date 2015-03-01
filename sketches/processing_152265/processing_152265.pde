
void setup() {
  background(255);
  size(500,500);
  strokeWeight(0.1);
  //line(width/2,height*.1,width/2,height*.9);
  //line(width*.1,height/2,width*.9,height/2);
}

int nlines=20;
int type=1;
int maxtypes=5;
int halfwidth=width/2;
int halfheight=height/2;
float dist;

void draw() {
  for (int nums=1; nums<3; nums++) {
    if (nums==2) {
      translate(width/2,(1-sqrt(2))*height/2);
      rotate(PI/4);
    }
    //print(nlines);
    if (type==1 || type==3) {
      for (int i=-1; i<nlines;i++) {
        dist=0.5/nlines;
        line(width/2,height*(i+1)*dist,(width/2)+width*(i+1)*dist,height/2);
        line(width/2,height-(height*(i+1)*dist),(width/2)+width*(i+1)*dist,height/2);
        line(width/2,height*(i+1)*dist,width-((width/2)+width*(i+1)*dist),height/2);
        line(width/2,height-(height*(i+1)*dist),width-((width/2)+width*(i+1)*dist),height/2);
      }
    }
    if ((type==2 || type==3) && nums==1) {  
      for (int i=-1; i<nlines;i++) {
        dist=0.5/nlines;
        line((width/2)+width*(i+1)*dist,0,width,(height*(i+1)*dist));
        line((width/2)+width*(i+1)*dist,height,width,height-(height*(i+1)*dist));
        line((width/2)-width*(i+1)*dist,0,0,(height*(i+1)*dist));
        line((width/2)-width*(i+1)*dist,height,0,height-(height*(i+1)*dist));
      }
    }
    if ((type==4 && nums==1) || type==5) {  
      for (int i=-1; i<nlines*2;i++) {
        dist=0.5/(nlines*2);
        line(0,height*(i+1)*dist*2,width*(i+1)*dist*2,height);
        line(width*(i+1)*dist*2,0,width,height*(i+1)*dist*2);
      }
    }
    if (type==5) {  
      for (int i=-1; i<nlines*2;i++) {
        dist=0.5/(nlines*2);
        line(0,height*(i+1)*dist*2,width-width*(i+1)*dist*2,0);
        line(width,height*(i+1)*dist*2,width-width*(i+1)*dist*2,height);
      }
    }
  }
}

void mouseClicked() {
  type=(type % maxtypes)+1;
  background(255);
} 

void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
      if (nlines<120) {
        background(255);
        nlines+=1;
      }
      break;
      case DOWN:
      if (nlines>=2) {
        background(255);
        nlines-=1;
      }
    }
  }
}
