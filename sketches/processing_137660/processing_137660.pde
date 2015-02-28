
int shift = 90;
int yshift = 160;
int j = 0;
int x=0;
int y=0;

public void setup(){
  size(640,640);
  background(50,150,150);
  noStroke();
  smooth();
}

public void draw(){
  figure();
  while(j<height){
    pushMatrix();
    for(int i = 0; i<=width; i = i+shift){
      translate(shift,0);
      figure();
      circle();
      for(int k = 0; k<=width; k = k+shift){
      translate(shift,0);
      rotate(PI/4);
      fill(0);
      figure();
      circle();
    }
    }
    popMatrix();
    translate(0,yshift);
    figure();
    j = j+yshift;
  }
  translate(0,-640);
  for(int i = 0; i<=width; i = i+shift){
      translate(shift,0);
      rotate(PI/4);
      fill(0,200,100);
      figure();
      circle();
    }
}

public void figure(){
  fill(204);
  triangle(12, 12, 19, 160, 81, 130);
}

public void circle(){
   fill(0, 190,130);
   ellipse(x, 80, 20, 40);
}
