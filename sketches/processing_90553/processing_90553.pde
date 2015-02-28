
int ellipse_num = 200;
int alpha = 100;
color c = color(int(random(255)),int(random(255)),int(random(255)));

void setup(){
  size(700,400);
  smooth();
  noStroke();
  noLoop();
}

void draw(){
  background(0);
  int x,y=0;
  int last_x=0,last_y=0;
  int radius=0;
  for(int i=0;i<ellipse_num;i++){
    radius = int(random(1,width/100));
    x=int(random(width));
    y=int(random(height));
    fill(255,alpha);
    ellipse(x,y,radius,radius);
    if(i>0){
      noFill();
      stroke(c,alpha);
      strokeWeight(random(2));
      bezier(last_x,last_y,x,y,width/2,height/2,width/2,height/2);     
  }
    last_x=x;
    last_y=y;
  }
}

void mousePressed(){
  c=color(int(random(255)),int(random(255)),int(random(255)));
  redraw();
}




