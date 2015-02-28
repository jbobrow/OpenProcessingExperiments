
public final static int FORWARD = 1;
public final static int BACKWARD = 2;
public final static int RIGHTWARD = 4;
public final static int LEFTWARD = 8;
public final static int UPWARD = 16;
public final static int DOWNWARD = 32;
public int direction = 0;
public int last_direction = 0;
public float lmx,lmy,dx,dy;
public final static float MAX_SPEED = 5.0f;
public final static float MIN_SPEED = 1.0f;
public float speed = 5.0f;
public float wd = 1600;
public float hh = 900;
public float dp = 1000;
public PVector forward_heading;
public PVector back_heading,left_heading,right_heading,up_heading,down_heading;
public PVector straight_up, straight_left, straight_down, straight_right, straight_forward, straight_back;
public ArrayList boxes;
public ArrayList lines;

class Line {
  public PVector another;
  public PVector yetanother;
  public color lc;

  public Line( float ax, float ay, float az, float tx, float ty, float tz ) {
    another = new PVector(ax,ay,az);
    yetanother = new PVector(tx,ty,tz);
    lc = color (180,200,200,200);
  }  
  
  public void draw() {
     stroke(lc);
     line(another.x,another.y,another.z,yetanother.x,yetanother.y,yetanother.z);  
  }
}

class Plane {
  public PVector pos;
  public color pc;

  public Plane() {
    pos = new PVector(0,0,0);
    pc = color(70,200,200,255);
  }  
  
  public void draw() {
    translate(pos.x,pos.y,pos.z);
    fill(pc);
    box(wd,3,dp);  
  }
}


class Box {
  public PVector pos;
  public color bc;
  public int bradius;
  public float sum;
  public int tag;
  
  public Box() {
    bradius = 300;
    pos = new PVector(random(2*wd)-wd,0,random(2*dp)-dp);
    bc = color(random(360),200,200,180);
  }  
  
  public void draw() {
    translate(pos.x,pos.y,pos.z);
    fill(bc);
    box(bradius);
  }
}

public ArrayList acopy( ArrayList b ) {
  ArrayList acopy = new ArrayList(b.size());
  int as = acopy.size();
  for(int i = 0; i < as;i++) {
    acopy.add(b.get(i));
  }  
  return acopy;
}

    

public void setup() {
  colorMode(HSB,360,255,255,255);
  background(0);
  size(808,500,P3D);
  //size(808,500,"SpecialRender");
  //size((int)wd,(int)hh,P3D);
  hint(DISABLE_DEPTH_TEST);
  hint(DISABLE_DEPTH_SORT);
  make_boxes();
  make_grid();
  dvals();
}

public void make_grid() {
  float spacing = 100;
  lines = new ArrayList((int)(2*(wd+dp)/spacing + 1));
  stroke(200,255,255,255);
  for(float i = -wd; i <= wd; i+=spacing) {
    Line nl = new Line(i,0,-dp,i,0,dp);
    lines.add(nl);
  }
  for(float i = -dp; i <= dp; i+= spacing) {
    Line nl = new Line(-wd,0,i,wd,0,i);
    lines.add(nl);
  }  
  stroke(0,0,0,255);
}

public void make_boxes() {
  int boxnum = 300;
  boxes = new ArrayList(boxnum);
  for(int i = 0; i < boxnum;i++) {
    Box b = new Box();
    boxes.add(b);
    if(i == 0)
      b.tag = 1;
  }  
}


public void draw_boxes() {
 int boxnum = boxes.size();
 for(int i = boxnum-1; i > -1;i--) {
   Box box = (Box)boxes.get(i);
   box.draw();
  }
}

public void draw_grid() {
 
  int linum = lines.size();
  for(int i = 0; i < linum;i++) {
    Line lin = (Line)lines.get(i);
    lin.draw();
  }  
}

public void draw() {
  background(0);
  //draw_info();
  draw_grid();
  draw_boxes();
  update_heading();
}


public void keyPressed(){
  if(key != CODED)
    switch(key) {
      case('w'):case('W'):direction |=FORWARD; last_direction = FORWARD; break;
      case('d'):case('D'):direction |=RIGHTWARD; last_direction = RIGHTWARD; break;
      case('s'):case('S'):direction |=BACKWARD; last_direction = BACKWARD; break;
      case('a'):case('A'):direction |=LEFTWARD; last_direction = LEFTWARD; break;
      case(' '):direction |=UPWARD; last_direction = UPWARD; break;
    }
  else {
    switch(keyCode) {
       case(CONTROL):direction |=DOWNWARD; last_direction = DOWNWARD; break;
       case(SHIFT):
         if(speed > MIN_SPEED) {
           speed = MIN_SPEED; 
           break;
         }
    }
  }
}
 
public void keyReleased(){  
  if(key != CODED)
    switch(key) {
      case('w'):case('W'):direction ^=FORWARD; last_direction = FORWARD; break;
      case('d'):case('D'):direction ^=RIGHTWARD; last_direction = RIGHTWARD; break;
      case('s'):case('S'):direction ^=BACKWARD; last_direction = BACKWARD; break;
      case('a'):case('A'):direction ^=LEFTWARD; last_direction = LEFTWARD; break;
      case(' '):direction ^=UPWARD; last_direction = UPWARD; break;
    }
  else
    switch(keyCode) {
       case(CONTROL):direction ^=DOWNWARD; last_direction = DOWNWARD; break;
       case(SHIFT):
         if(speed < MAX_SPEED) {
           speed = MAX_SPEED; 
           break;
         }
    }
}

public void update_heading() {
  input();
  //update_v(plane.pos);
  int boxnum = boxes.size();
  for(int i = boxnum-1; i > -1;i--) {
    Box box = (Box)boxes.get(i);
    update_v(box.pos);
    box.sum = box.pos.mag();
  }  
  int linum = lines.size();
  for(int i = 0; i < linum;i++) {
    Line lin = (Line)lines.get(i);
    update_v(lin.another);
    update_v(lin.yetanother); 
  }
}

public void update_v(PVector pos) {
 switch(direction) {
      case FORWARD:pos.sub(forward_heading); break;
      case BACKWARD:pos.sub(back_heading); break;
      case LEFTWARD:pos.sub(left_heading); break;
      case RIGHTWARD:pos.sub(right_heading); break;
      case UPWARD:pos.add(up_heading); break;
      case DOWNWARD:pos.add(down_heading); break;
      case FORWARD|LEFTWARD:pos.sub(forward_heading);pos.sub(left_heading); break;
      case FORWARD|RIGHTWARD:pos.sub(forward_heading);pos.sub(right_heading);  break;
      case BACKWARD|LEFTWARD:pos.sub(back_heading);pos.sub(left_heading);  break;
      case BACKWARD|RIGHTWARD:pos.sub(back_heading);pos.sub(right_heading);  break;
      case UPWARD|FORWARD:pos.sub(forward_heading);pos.add(up_heading);  break;
      case UPWARD|BACKWARD:pos.sub(back_heading);pos.add(up_heading);  break;
      case UPWARD|LEFTWARD:pos.add(up_heading);pos.sub(left_heading);  break;
      case UPWARD|RIGHTWARD:pos.add(up_heading);pos.sub(right_heading);  break;
      case DOWNWARD|FORWARD:pos.sub(forward_heading);pos.add(down_heading);  break;
      case DOWNWARD|BACKWARD:pos.sub(back_heading);pos.add(down_heading);  break;
      case DOWNWARD|LEFTWARD:pos.add(down_heading);pos.sub(left_heading);  break;
      case DOWNWARD|RIGHTWARD:pos.add(down_heading);pos.sub(right_heading);  break;
      case LEFTWARD|RIGHTWARD: 
        if(last_direction==LEFTWARD)
         pos.sub(left_heading);
        else
         pos.sub(right_heading);  
        break;
      case FORWARD|BACKWARD: 
        if(last_direction==FORWARD)
         pos.sub(forward_heading);
        else
         pos.sub(back_heading);
        break;
      case UPWARD|DOWNWARD:
        if(last_direction==UPWARD)
         pos.add(up_heading);
        else
         pos.add(down_heading);
        break;
      case UPWARD|FORWARD|RIGHTWARD:pos.sub(forward_heading);pos.add(up_heading);pos.sub(right_heading);break;
      case UPWARD|FORWARD|LEFTWARD:pos.sub(forward_heading);pos.add(up_heading);pos.sub(left_heading);  break;
      case UPWARD|BACKWARD|RIGHTWARD:pos.sub(back_heading);pos.add(up_heading);pos.sub(right_heading);  break;
      case UPWARD|BACKWARD|LEFTWARD:pos.sub(back_heading);pos.add(up_heading);pos.sub(left_heading);  break;
      case DOWNWARD|FORWARD|LEFTWARD:pos.sub(forward_heading);pos.add(down_heading);pos.sub(left_heading);  break;
      case DOWNWARD|FORWARD|RIGHTWARD:pos.sub(forward_heading);pos.add(down_heading);pos.sub(right_heading);  break;
      case DOWNWARD|BACKWARD|LEFTWARD:pos.sub(back_heading);pos.add(down_heading);pos.sub(left_heading); break;
      case DOWNWARD|BACKWARD|RIGHTWARD:pos.sub(back_heading);pos.add(down_heading);pos.sub(right_heading);  break;
    } 
    if(pos.y < 10)
      pos.y = 10;
}

public void input() {
 float mxx = mouseX;
 float myy = mouseY;
 //if(result < height*height/4 ) {
 cursor(CROSS);  
 float mx = map(mxx, 0, width, -1, 1);
 float my = map(myy, 0, height, -1, 1); 
 //}
 //else {
 // cursor(HAND);
 // return; 
 //}
 //cam.lookAt(forward_heading.x, forward_heading.y, forward_heading.z, 1.0f);
 if(mxx > 20 && mxx < width-20) {
   camera(0,0,0, forward_heading.x, forward_heading.y, forward_heading.z, 0.0, 1.0, 0.0);
   float xang = mx * Math.abs(mx) / (8*PI);
   float yang = my * Math.abs(my) / (10*PI);
   right_heading.mult(speed*sin(xang));
   forward_heading.mult(cos(xang));
   forward_heading.add(right_heading);
   straight_up.mult(speed*sin(yang));
   forward_heading.mult(cos(yang));
   forward_heading.add(straight_up);
 }
 forward_heading.normalize();
 forward_heading.mult(speed);
 update_normals();
}

public void make_normals() {
    back_heading = new PVector(-forward_heading.x, -forward_heading.y, -forward_heading.z);
    up_heading = new PVector(0,speed,0);
    down_heading = new PVector(0,-speed,0);
    right_heading = forward_heading.cross(up_heading);
    left_heading = forward_heading.cross(down_heading);
}

public void update_normals() {
  back_heading.set(-forward_heading.x, -forward_heading.y, -forward_heading.z); 
  up_heading.set(0,speed,0);
  down_heading.set(0,-speed,0);
  straight_left.set(-1,0,0);
  straight_right.set(1,0,0);
  straight_forward.set(0,0,1);
  straight_back.set(0,0,-1);
  straight_up.set(0,1,0);
  straight_down.set(0,-1,0);
  right_heading = forward_heading.cross(straight_up);
  left_heading = forward_heading.cross(straight_down);
  }

public void mouseClicked() {
  if(mouseEvent.getClickCount() == 3) { 
    dvals();
  }
}

public void draw_info() {
  textMode(SCREEN);
  text(forward_heading.x+", "+forward_heading.y+", "+forward_heading.z, 20, 20);
  text(dx+", "+dy,20,50);
}

public void dvals() {
  lmx = 0.0f; lmy = 0.0f;
  int boxnum = boxes.size();
  forward_heading = new PVector(250,10,250);
  straight_up = new PVector(0,1,0);
  straight_down = new PVector(0,-1,0);
  straight_left = new PVector(-1,0,0);
  straight_right = new PVector(1,0,0);
  straight_forward = new PVector(0,0,1);
  straight_back = new PVector(0,0,-1);
  make_normals();
  //cam.lookAt(forward_heading.x, forward_heading.y, forward_heading.z, 1.0f);
 
  camera(0,0,0, forward_heading.x, forward_heading.y, forward_heading.z, 0.0, 1.0, 0.0);
}




