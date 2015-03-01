
slider points, ray1, ray2;
float angle=0;

void setup(){
  size(500,700);
  points = new slider(20, 550, 420, 3, 90, 3);
  ray1 = new slider(20, 600, 420, 1, width/2, width*0.45);
  ray2 = new slider(20, 650, 420, 1, width/2,  width*0.15);
  PFont f=createFont("arial", 12);
  textFont(f, 12);
  background(0);
}

void draw(){
  background(0);
  angle+=PI/180;
  points.draw();
  ray1.draw();
  ray2.draw();
  translate(250,250);
  int n=int(points.val);
  float section=TWO_PI/n;
  noStroke();
  beginShape();
  for(int a=0;a<n;a++){
    vertex(cos(a*section+angle)*ray1.val, sin(a*section+angle)*ray1.val);
    vertex(cos(a*section+angle+section*0.5)*ray2.val, sin(a*section+angle+section*0.5)*ray2.val);
  }
  endShape(CLOSE);
} 


class slider{
  boolean tenu=false;
  float x,y,xend,val, min,max,xs;
  slider(float _x, float _y, float _l, float _min, float _max, float _val){ 
    x=_x;y=_y;xend=x+_l;val=_val;min=_min;max=_max;
    xs=map(val,min,max,x,xend);
  }
  void draw(){
    stroke(255);
    line(x,y,xend,y);
    if(tenu){
      xs=constrain(mouseX, x, xend);
      val = map(xs,x,xend,min,max);
    }else{
       xs=map(val,min,max,x,xend);
    }
    ellipse(xs,y, 14, 14);
    text(int(val), xend+20,y);
  }
  void check(){
    float d=dist(mouseX,mouseY,xs,y);
    if(d<22){
      tenu=true;
    }
  }
}

void mousePressed(){
  points.check();ray1.check();ray2.check();
}

void mouseReleased(){
  points.tenu=ray1.tenu=ray2.tenu=false;
}
