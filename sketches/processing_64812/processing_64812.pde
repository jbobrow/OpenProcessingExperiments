
PImage shade;

void setup()
{
  size(800,200);
  smooth();
  noLoop();
  imageMode(CENTER);
  shade = loadImage("shade1.png");
}
 
void draw()
{
  background(240);
  fill(150);
  noStroke();
  rect(0,height-10, width, 10);
 
  for(int i = -50; i<= width+50; i+=100)
  { 
    float rw = random(0.5,1.5);
    float rh = random(0.5,1.5);
    int rs = int(random(100));
    int rsb = int(random(30,80));
    int rsc = int(rsb/2);
    int rst = int(random(10,50));
    int rtp = int(random(10,60));
    int rss = int(random(60, 100));
    
    lamp(i, height-100, 1,1, rs, rsb, rsc, rst, rtp, rss);
  }
}
 //x translate xy
 //y
 //w scale xy
 //h
 //s stroke color
 
 //sb stalk base meeting point
 //sc stalk center
 //st leg stance
 //tp stalk top pivot
 //ss shade diameter
 
void lamp(float x, float y, float w, float h, int s, int sb, int sc, int st, int tp, int ss)
{
   pushMatrix();
  translate(x,y);
  scale(w,h);
  stroke(s);
  
  strokeWeight(3);
 
 
 
  //center stalk
  line(0, -tp, 0, sb+10);
  
  //LEGS
  //left leg
  line(0, sc, -st, 90);
  //center leg
  line(0, sc, -st/3, 90);
  //right leg
  line(0, sc, st, 90);
  
  
  //BRACES LEGS
  strokeWeight(2);
    //left leg
  line(0, sb, 2*-st/3, 2*90/3+10);
  //center leg
  line(0, sb, 2*-(st/3)/3, 2*90/3+10);
  //right leg
  line(0, sb, 2*st/3, 2*90/3+10);
  
  //cap
  line(0-st, -tp-st, 0+st, -tp+st);
  ellipse(0,-tp,5,5);
  tint(255-(s/10));
  image(shade,0,-tp, ss,ss);
  popMatrix();
}
void mousePressed() {
 redraw();
}



