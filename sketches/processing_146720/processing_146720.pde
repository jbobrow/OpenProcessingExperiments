
float [ ] x = { 50, 110, 120, 205, 230, 320, 360 };
float [ ] y = { 56, 200, 100, 300, 245,  78, 345 };
float []dim={1,1,1,1,1,1,1};
color red=color(250,0,0);
color green=color(0,250,0);
color blue=color(0,0,250);
color yellow=color(250,250,0);
color pink=color(255,240,245);
color lightBlue=color(175, 238, 238);
color grey=color(30);
color []col={red,green,blue,yellow,pink,lightBlue,grey};

void setup(){
  size(400,400);
  rectMode(CENTER);
}

void draw(){
  drawFigures();
 // moveFigures();
}

void drawFigures(){
  for(int i=0; i<x.length ; i++){
    noFill();
    stroke(col[i]);
    dim[i]++;
    rect(x[i],y[i],dim[i],dim[i]);
  }
  
}



