
int m=-30;
int n=-30;
int o=-30;
int p=-30;
int xz=1;

void setup () {
  size (500,400);
  smooth();
  noFill();
}

void draw (){
  stroke(0);
  background(255);
  rMovingCircles ();
  lMovingCircles ();
  lMovingOvals ();
  rMovingOvals ();
  
  if (mousePressed) {
    xz=xz+1;
  }
  if (mousePressed && xz>width/3){
    xz=1;
  }

}


void rMovingCircles (){
  strokeWeight(3);
for (int x=m; x<530; x=x+30){
    for(int y=10; y<height+100; y=y+50){
      ellipse(x,y,25,25);
    }
  }
  m=m+1;
  if (m>0){
  m=-30;
  }
}

void lMovingCircles (){
  strokeWeight(2);
  for (int x=n; x<530; x=x+30){
    for(int y=10; y<height+100; y=y+50){
      ellipse(x,y,45,45);
    }
  }
  n=n-1;
  if (m>0){
  n=-30;
  }
}

void lMovingOvals (){
    strokeWeight(3);
  for (int x=o; x<530; x=x+30){
    for(int y=-40; y<height+100; y=y+50){
      ellipse(x,y,5+xz,65+(xz/2));
    }
  }
  o=o-1;
  if (m>0){
  o=-30;
  }
}

void rMovingOvals (){
  strokeWeight(2);
  stroke(255);
  for (int x=p; x<530; x=x+30){
    for(int y=-40; y<height+100; y=y+50){
      ellipse(x,y,15+xz,35+xz);
    }
  }
  p=p+1;
  if (p>0){
  p=-30;
  }
}
  

