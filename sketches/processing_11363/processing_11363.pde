
import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.*;

private BezTube btube;
private Box borg;
private Rot rot;
private Ellipsoid universe;

private float speed = 0.06f;
private float t = 0, dt = speed;
float camDist = 100;
float uxSpeed, uySpeed, uzSpeed;

private int state;
private float tScale, deltaScale;

long sTime, cTime, eTime, lTime;

PVector start, end, p, c, n;

void setup(){
  size(300,300, P3D);
  btube = makeBezTube();

  // Pre-load images to prevent slow down in animation
  Textures.loadImage(this, "wh3_borg_3.jpg");
  Textures.loadImage(this, "wh_star_1.jpg");
  Textures.loadImage(this, "wh_star_2.jpg");
  Textures.loadImage(this, "wh_pic2.jpg");

  borg = new Box(this,25);
  borg.setTexture("wh3_borg_3.jpg");
  borg.drawMode(Shape3D.TEXTURE);

  universe = new Ellipsoid(this, 16,16);
  universe.setRadius(2000);
  universe.drawMode(Shape3D.TEXTURE);
  universe.fill(color(0,255,0));

  changeToState(0);
}

public void changeToState(int s){
  state = s;
  switch(s){
  case 0:
    p = btube.getPoint(0);
    c = btube.getTangent(0);
    n = btube.getNormal(0);
    sTime = cTime = lTime = millis();
    universe.setTexture("wh_star_1.jpg",2,2);
    universe.drawMode(Shape3D.TEXTURE);
    universe.moveTo(start);
    universe.visible(true);
    uxSpeed = radians(1.59f);
    uySpeed = radians(1.137f);
    uzSpeed = radians(1.2557f);
    borg.moveTo(start);
    btube.visible(false);
    break;
  case 1:
    tScale = 0.5f;
    deltaScale = 0.25f;
    btube.scale(tScale);
    btube.visible(true);
    break;
  case 2:
    t = 0;
    universe.visible(false);
    universe.setTexture("wh_star_2.jpg",2,2);
    break;
  case 3:
    uxSpeed = radians(-1.311f);
    uySpeed = radians(0.843f);
    uzSpeed = radians(-0.977f);
    universe.moveTo(end);
    universe.visible(true);
    break;
  case 4:
    p = btube.getPoint(1);
    c = btube.getTangent(1);
    n = btube.getNormal(1);
    rot = new Rot(n,c,new PVector(0,1,0), new PVector(1,0,0));
    rot.applyTo(n);
    borg.shapeOrientation(n, null);
    borg.moveTo(p);
  }	
}

void draw(){
  cTime = millis();
  eTime = cTime - lTime;
  lTime = cTime;
  float seconds = eTime/1000.0f;

  background(0);
  lights();

  switch(state){
  case 1:
    if(tScale < 1){
      tScale += deltaScale * eTime / 1000.0f;
      btube.scale(tScale);
    }
    else {
      tScale = 1;				
      btube.scale(tScale);
      changeToState(2);
    }		
    break;
  case 2:
    t += dt * eTime / 1000.0f;
    p = btube.getPoint(t);
    c = btube.getTangent(t);
    n = btube.getNormal(t);
    rot = new Rot(n,c,new PVector(0,1,0), new PVector(1,0,0));
    rot.applyTo(n);
    borg.shapeOrientation(n, null);
    // The next 2 lines are required due to a bug in library 
    // which will be fixed in versions > 1.9.0
    borg.setTexture("wh3_borg_3.jpg");
    borg.drawMode(Shape3D.TEXTURE);
    borg.moveTo(p);
    if(t >= 0.89f)
      changeToState(3);
    break;
  case 3:
    t += dt * eTime / 1000.0f;
    p = btube.getPoint(t);
    c = btube.getTangent(t);
    n = btube.getNormal(t);
    rot = new Rot(n,c,new PVector(0,1,0), new PVector(1,0,0));
    rot.applyTo(n);
    borg.shapeOrientation(n, null);
    // The next 2 lines are required due to a bug in library 
    // which will be fixed in versions > 1.9.0
    borg.setTexture("wh3_borg_3.jpg");
    borg.drawMode(Shape3D.TEXTURE);
    borg.moveTo(p);
    if(t >= 1.0f)
      changeToState(4);
    break;
  }

  universe.rotateBy(uxSpeed * seconds, uySpeed * seconds, uzSpeed * seconds);
  camera(p.x+camDist*c.x, p.y+camDist*c.y, p.z+camDist*c.z, 
  p.x, p.y, p.z, n.x, n.y, n.z);

  btube.draw();
  borg.draw();
  universe.draw();
}

public void mouseClicked(){
  if(state == 0)
    changeToState(1);
  if(state == 4)
    changeToState(0);
}


public BezTube makeBezTube(){
  float[] prf = new float[] {
    128f, 104f, 94f, 96f, 95f, 93.4f, 88.7f, 128f
  };
  prf = new float[]{
    200  };
  PVector[] p = new PVector[] {
    new PVector(-570f, 76.5f, -552.5f), 
    new PVector(-650f, 302.6f, 187.5f), 
    new PVector(-270f, 206.6f, -127.5f), 
    new PVector(-40f, -130.4f, -57f), 
    new PVector(170f, -2.4f, -222.5f), 
    new PVector(325f, -287.4f, 67.5f), 
    new PVector(-55f, -332.4f, 607.5f), 
    new PVector(670f, 142.6f, 752.5f)
    };
    // Make the tube 4 times longer
    for(int i = 0; i < p.length; i++)
      p[i].mult(4);

  // The greater segs the smoother the curve
  // slices must be >= 3 
  int segs = 96, slices = 8;

  BezTubeRadius btr = new BezTubeRadius(prf);
  BezTube bt = new BezTube(this, new Bezier3D(p, p.length), btr, segs, slices);
  bt.setTexture("wh_pic2.jpg",4,12);
  bt.drawMode(Shape3D.TEXTURE);
  bt.visible(false, BezTube.BOTH_CAP);
  bt.scale(1.0f);

  start = bt.getPoint(0);
  end = bt.getPoint(1);

  return bt;
}



