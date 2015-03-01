
//By Richard
//Labyrinth generator
//Up to increase number of levels
//Down to decrease number of levels
//Credit to http://www.wikihow.com/Draw-a-Labyrinth for teaching me how to draw one!

int a=500;

void setup() {
  size(a,a);
}

int nlevels=5;

void draw() {
  translate(0,20);
  background(255);
  noFill();
  if (nlevels<33) {
      strokeWeight(3);
    }
    else if  (nlevels<50) {
      strokeWeight(2);
    }
    else {
      strokeWeight(1);
    }
  print(nlevels);
  float dist=a/nlevels*0.8;
  //1
  line(a/2,(a/2)-dist/2,a/2,(a/2)+dist/2);
  line((a/2)-dist/2,a/2,(a/2)+dist/2,a/2);
  //2
  arc(a/2+dist/4,a/2-dist/2,dist/2,dist/2,PI,TWO_PI);
  for (int i=0;i<nlevels;i++) {
    arc(a/2-dist/2,a/2-dist/2,(dist*i),(dist*i),PI/2,PI);
    arc(a/2+dist/4,a/2-dist/2,(1.5*dist)+(dist*i),(1.5*dist)+(dist*i),PI,TWO_PI);
    arc(a/2+dist/2,a/2-dist/2,dist+(dist*i),dist+(dist*i),0,HALF_PI);
    line(a/2,(a+dist*(i-1))/2,a/2,(a+dist*i)/2);
    if (i%2==0) {
      if (i!=nlevels-1) {
        line(a/2-dist/2,a/2+(i*dist/2),a/2+dist/2,a/2+(i*dist/2));
      }
      else {
        line(a/2,(a+dist*i)/2,a/2+dist/2,(a+dist*i)/2);
      } 
    }
  } 
}

void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
      nlevels=min(83,nlevels+1);
      break;
      case DOWN:
      nlevels=max(5,nlevels-1);
      break;
    }
  }
}
