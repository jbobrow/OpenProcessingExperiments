
ArrayList agents;
ArrayList frozen;
float diameter = 5;
int stickiness = 8;
int speed = 2;
int numAgents = 50;
int maxAgents = 1000;
int numPoints = 10000;
float radius;
int bandWidth = 150;

void setup(){
  size (800,800);
  background(255);
  frameRate(120);

  agents = new ArrayList();
  frozen = new ArrayList();

  radius = 0;

  fill(0);
  stroke(0,10);
  pushMatrix();
  translate(width/2, height/2);
  ellipse(0,0,diameter,diameter);
  popMatrix();

  frozen.add(new Point(width/2,height/2));

  for (int i=0; i<numAgents; i++){
    agents.add(new Agent());
  }
}

void draw(){
  background(255);
  println("frameCount="+frameCount+" frameRate="+frameRate + " particles=" +frozen.size()+"  agents="+agents.size()+"  radius="+radius);
  stroke(255,0,0,30);
  noFill();
  ellipse(width/2,height/2,2*(radius+10),2*(radius+10));
  ellipse(width/2,height/2,2*(radius+bandWidth),2*(radius+bandWidth));

  if (agents.size() < maxAgents && frameCount%30==0) agents.add(new Agent());

  for (int i=0; i<agents.size(); i++){
    Agent a = (Agent)agents.get(i);
    a.run();
  }
  for (int i=0; i<frozen.size(); i++){
    Point p = (Point)frozen.get(i);
    float[] pos = p.getPoint();
    fill(0);
    ellipse(pos[0],pos[1],diameter,diameter);
  }
}



class Agent{
  float x,y;
  boolean reset = false;

  Agent(){
    if (radius<width/2){
      float r = random(radius+10,radius+bandWidth);
      float theta = random(TWO_PI);
      x = r * cos(theta) + width/2;
      y = r * sin(theta) + height/2;
    }
    else {
      x = round(random(1)*width);
      y = round(random(1)*height);
    }
  }

  void run(){
    if (reset){
      if (radius<width/2){
        float r = random(radius+10,radius+bandWidth);
        float theta = random(TWO_PI);
        x = r * cos(theta) + width/2;
        y = r * sin(theta) + height/2;
      }
      else {
        x = round(random(1)*width);
        y = round(random(1)*height);
      }
      reset = false;
    }
    x+=random(-1,1)*speed;
    y+=random(-1,1)*speed;

    if (dist(x,y,width/2,height/2)>radius + bandWidth) reset = true;

    fill(255,0,0,50);
    noStroke();
    ellipse(x,y,3,3);

    float prox = diameter+stickiness+1;
    float cdist = dist(x,y,width/2,height/2);

    if (cdist < radius+10){
      for (int i=0; i<frozen.size(); i++){
        Point a = (Point)frozen.get(i);
        float[] pos = a.getPoint();
        prox = min(prox,dist(x,y,pos[0],pos[1]));
        if (prox <= diameter+stickiness) {
          x = pos[0] + (diameter*(x-pos[0]))/dist(x,y,pos[0],pos[1]);
          y = pos[1] + (diameter*(y-pos[1]))/dist(x,y,pos[0],pos[1]);
          fill(0);
          stroke(0,10);
          pushMatrix();
          translate(x,y);
          //sphere(diameter);
          //point(0,0,0);
          ellipse(0,0,diameter,diameter);
          popMatrix();

          frozen.add(new Point(x,y));

          reset = true;

          break;
        }
      }
    }
  }
}





class Point{
  float[] c = new float[2];

  Point(float _x, float _y){
    c[0]=_x;
    c[1]=_y;
    float d = dist(_x,_y,width/2,height/2);
    radius = max(radius,d);
    if (radius > width/2) radius = width/2;
  }

  float[] getPoint(){
    return c;
  }
}


