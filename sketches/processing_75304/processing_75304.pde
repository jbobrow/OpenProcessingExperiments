
import controlP5.*;

Display display = new Display();
Ball[] ball = new Ball[100];
Physics physics = new Physics();

ControlP5 cp5;
Accordion accordion;
Textlabel title, labelVect;
DropdownList ddl;
Slider sliderSize, sliderElast, sliderGrav, sliderChar;
Toggle toggleLock, toggleForces, togglePath;
RadioButton radioVectors;

public void setup() {
  size(1000, 500);
  frameRate(60);
  smooth();

  display.setWindowDim();

  // Initialize balls
  float ballSize = min(25, max(1.5, ((ball.length * ball.length * 0.0009907) - (ball.length * 0.353) + 28.435)));
  for (int i =0;i<ball.length;i++) {
    ball[i] = new Ball(0, ballSize, i);
  }

  // Corrects overlapping
  boolean conflict = true;
  while (conflict) {
    conflict = false;
    for (int i = 0;i<ball.length;i++) {
      for (int j = 0;j<ball.length;j++) {
        if (i!=j&&dist(ball[i].pos.x, ball[i].pos.y, ball[j].pos.x, ball[j].pos.y)<(ball[i].rad+ball[j].rad)) {
          conflict = true;
          ball[i].pos.x= random(display.dispLeft+ball[i].rad, display.dispRight-ball[i].rad);
          ball[i].pos.y= random(display.dispTop+ball[i].rad, display.dispBottom-ball[i].rad);
        }
      }
    }
  }

  gui();
}

public void draw() {
  display.drawWindow();
  
  println(frameRate);

  boolean conflict = true;
  int iTemp=-1;
  int counter=0;
  while (conflict) {
    conflict = false;
    counter++;
    for (int i=0;i<ball.length;i++) {
      ball[i].tempPos();
    }
    for (int i=0;i<ball.length;i++) {
      for (int j=i+1;j<ball.length;j++) {

        if (dist(ball[i].tempPos.x, ball[i].tempPos.y, ball[j].tempPos.x, ball[j].tempPos.y)<(ball[i].rad+ball[j].rad)) {
          PVector speedI = new PVector();
          PVector speedJ = new PVector();
          speedI = physics.collision(ball[i].speed, ball[j].speed, PVector.sub(ball[i].pos, ball[j].pos), ball[i].mass, ball[j].mass, ball[j].locked);
          speedJ = physics.collision(ball[j].speed, ball[i].speed, PVector.sub(ball[j].pos, ball[i].pos), ball[j].mass, ball[i].mass, ball[i].locked);
          ball[i].speed = speedI;
          ball[j].speed = speedJ;
          conflict = true;
          ball[i].collided = true;
          ball[j].collided = true;
        }
      }
      if (ball[i].tempPos.x>=display.dispRight-ball[i].rad||ball[i].tempPos.x<=display.dispLeft+ball[i].rad) {
        ball[i].speed.x=ball[i].speed.x*-1*sliderElast.getValue();
        conflict = true;
        ball[i].collided = true;
      }
      if (ball[i].tempPos.y>=display.dispBottom-ball[i].rad||ball[i].tempPos.y<=display.dispTop+ball[i].rad) {
        ball[i].speed.y=ball[i].speed.y*-1*sliderElast.getValue();
        conflict = true;
        ball[i].collided = true;
      }
    }
    if (counter>50) {
      conflict=false;
    }
  }

  for (int i =0;i<ball.length;i++) {
    ball[i].accel.set(0, 0, 0);
    if (toggleForces.getState()) {
      for (int j=0;j<ball.length;j++) {
        if (i!=j) {
          PVector d =PVector.sub(ball[j].pos, ball[i].pos);
          PVector dn =PVector.sub(ball[j].pos, ball[i].pos);
          dn.normalize();
          ball[i].accel.add(physics.gravity(ball[i].mass, ball[j].mass, d, dn));
          ball[i].accel.add(physics.charge(ball[i].mass, ball[j].mass, d, dn));
        }
      }
    }
  }

  for (int i =0;i<ball.length;i++) {
    ball[i].refreshBall();
    ball[i].moveBall();
    ball[i].displayBall();
    ball[i].speedBall();
    ball[i].collided=false;
  }

  if (togglePath.getState()) {
    stroke(0);
    fill(0);
    for (int i=0 ;i<display.path.length-1;i++) {
      point(display.path[i].x, display.path[i].y);
    }
  }

  //float tempKinetic= physics.calcKinetic();
  //float tempPotential=physics.calcPotential();
  //float tempTotal = tempKinetic + tempPotential;
  //println("Total Kinetic Energy: " +tempKinetic + " - Total Potential Energy: " + tempPotential+ " - Total Energy: " + tempTotal);
}

public void gui() {

  cp5 = new ControlP5(this);

  title = cp5.addTextlabel("title")
    .setText("PARTICLE SIMULATOR")
      .setPosition(15, 26)
        .setColorValue(color(255))
        .setSize(30,30)
          .setFont(ControlP5.grixel)
            ;

  int groups = 3;

  Group g1 = cp5.addGroup("control");
  g1.setBackgroundColor(color(0));
  //.setBackgroundHeight(PApplet.parseInt(display.dispBottom-display.dispTop+20-(groups*10)))
  g1.setBackgroundHeight(PApplet.parseInt(135));

  sliderSize = cp5.addSlider("sliderSize");
  sliderSize.setPosition(20, 50);
  sliderSize.setSize(100, 20);
  sliderSize.setRange(0, 25);
  sliderSize.setLabel("Ball Size");
  sliderSize.moveTo(g1);

  toggleLock = cp5.addToggle("lock");
  toggleLock.setPosition(20, 85);
  toggleLock.setSize(40, 20);
  toggleLock.setValue(false);
  toggleLock.setLabel("PRESS TO LOCK");
  toggleLock.moveTo(g1);

  ddl = cp5.addDropdownList("select Ball");
  ddl.setPosition(20, 35);
  ddl.setSize(150, 100);
  ddl.setBackgroundColor(color(190));
  ddl.setItemHeight(20);
  ddl.setBarHeight(20);
  ddl.captionLabel().set("select ball");
  ddl.captionLabel().style().marginTop = 3;
  ddl.captionLabel().style().marginLeft = 3;
  ddl.valueLabel().style().marginTop = 3;
  for (int i=0;i<ball.length;i++) {
    ddl.addItem("Ball "+i, i);
  }
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
  ddl.moveTo(g1);           

  Group g2 = cp5.addGroup("physics");
  g2.setBackgroundColor(color(0));
  //g2.setBackgroundHeight(PApplet.parseInt(display.dispBottom-display.dispTop+20-(groups*10)));
  g2.setBackgroundHeight(PApplet.parseInt(165));

  toggleForces = cp5.addToggle("forces");
  toggleForces.setPosition(20, 15);
  toggleForces.setSize(57, 20);
  toggleForces.setValue(true);
  toggleForces.setMode(ControlP5.SWITCH);
  toggleForces.setLabel("ON FORCES OFF");
  toggleForces.moveTo(g2);

  sliderGrav=cp5.addSlider("grav");
  sliderGrav.setPosition(20, 60);
  sliderGrav.setSize(100, 20);
  sliderGrav.setRange(0, 2);
  sliderGrav.setLabel("Gravity");
  sliderGrav.setValue(1);
  sliderGrav.moveTo(g2);

  sliderChar=cp5.addSlider("char");
  sliderChar.setPosition(20, 95);
  sliderChar.setSize(100, 20);
  sliderChar.setRange(0, 2);
  sliderChar.setLabel("Charge");
  sliderChar.setValue(1);
  sliderChar.moveTo(g2);

  sliderElast=cp5.addSlider("elast");
  sliderElast.setPosition(20, 130);
  sliderElast.setSize(100, 20);
  sliderElast.setRange(0, 1);
  sliderElast.setLabel("Elasticity");
  sliderElast.setValue(1);
  sliderElast.moveTo(g2);

  Group g3 = cp5.addGroup("display");
  g3.setBackgroundColor(color(0));
  //g3.setBackgroundHeight(PApplet.parseInt(display.dispBottom-display.dispTop+20-(groups*10)));
  g3.setBackgroundHeight(PApplet.parseInt(100));

  radioVectors = cp5.addRadioButton("radioButton");
  radioVectors.setPosition(20, 25);
  radioVectors.setSize(20, 20);
  radioVectors.setColorForeground(color(120));
  radioVectors.setColorLabel(color(255));
  radioVectors.setNoneSelectedAllowed(false);
  radioVectors.setItemsPerRow(1);
  radioVectors.setSpacingColumn(30);
  radioVectors.addItem("none", 0);
  radioVectors.addItem("selected", 1);
  radioVectors.addItem("all", 2);
  radioVectors.activate(0);
  radioVectors.moveTo(g3);

  togglePath = cp5.addToggle("SHOW PATH");
  togglePath.setPosition(100, 45);
  togglePath.setSize(57, 20);
  togglePath.setValue(false);
  togglePath.setMode(ControlP5.SWITCH);
  togglePath.setLabel("ON PATH OFF");
  togglePath.moveTo(g3);

  accordion = cp5.addAccordion("acc")
    .setPosition(display.dispRight+10, display.dispTop-10)
      .setWidth(PApplet.parseInt(width-(display.dispRight+10)))
        .addItem(g1)
          .addItem(g2)
            .addItem(g3)
              ;

  accordion.setCollapseMode(Accordion.MULTI);
}

public void controlEvent(ControlEvent theEvent) {

  if (theEvent.isFrom(ddl)) {
    // check if the Event was triggered from a ControlGroup
    for (int i=0;i<ball.length;i++) {
      ball[i].selected=false;
    }
    sliderSize.setValue(ball[PApplet.parseInt(theEvent.getGroup().getValue())].rad);
    toggleLock.setState(ball[PApplet.parseInt(theEvent.getGroup().getValue())].locked);
    ball[PApplet.parseInt(theEvent.getGroup().getValue())].selected=true;

    for (int i =0;i<display.path.length;i++) {
      display.path[i].x=0;
      display.path[i].y=0;
    }
  }

  if (theEvent.isFrom(toggleLock)) {
    for (int i =0;i<ball.length;i++) {
      if (ball[i].selected==true) {
        ball[i].locked=toggleLock.getState();
      }
    }
  }
}

void mousePressed() {

  if (mouseX>display.dispLeft&&mouseX<display.dispRight&&mouseY>display.dispTop&&mouseY<display.dispBottom) {
    int test=0;
    boolean clicked = false;
    for (int i =0; i<ball.length;i++) {
      if (dist(ball[i].pos.x, ball[i].pos.y, mouseX, mouseY)<ball[i].rad) {
        sliderSize.setValue(ball[i].rad);
        if (ball[i].selected) {
          ball[i].selected=false;
          ddl.setLabel(ddl.getName());
          sliderSize.setValue(0);
        }
        else {
          ball[i].selected=!ball[i].selected;
          ddl.setValue(i);
          clicked = true;
        }
      }
      else {
        ball[i].selected=false;
      }
    }
    if (clicked==false) {
      ddl.setLabel(ddl.getName());
      sliderSize.setValue(0);
    }
  }
}

class Ball {
  float mass, rad, closest;
  int col, index;
  PVector pos, speed, accel, tempPos;
  Boolean selected, in, locked, collided, moveConflict;
  float ro = 11340;

  // Constructor
  Ball(float speed_, float rad_, int index_) {
    pos = new PVector (random(display.dispLeft+rad_, display.dispRight-rad_), random(display.dispTop+rad_, display.dispBottom-rad_));
    tempPos = new PVector();
    float angle=random(0, 2*PI);
    speed = new PVector(speed_*cos(angle), speed_*sin(angle));
    accel = new PVector (0, 0.05);
    rad=rad_;
    index=index_;
    mass = ro*PI*rad*rad;
    col = color(0, 60, 60);
    in = true;
    locked=false;
    selected=false;
    collided = false;
    tempPos=PVector.add(pos, speed);
  }

  // Refresh Ball
  public void refreshBall() {
    mass = ro*(4/3)*PI*rad*rad*rad;
    // Checks if ball is selected and adjusts
    if (selected) {
      if(sliderSize.getValue()>rad){
        rad+=0.1;
      }else if(sliderSize.getValue()<rad){
        rad-=0.1;
      }
      col=color(90, 0, 0);
    } 
    else if (collided) {
      col = color(1, 108,158);
    }
    else
    {
      col = color(2, 52, 77);
    }
    // Checks if ball is locked and adjusts
    if (locked) {
      speed.x=0;
      speed.y=0;
      accel.x=0;
      accel.y=0;
    }
  }

  // Calculates next position
  public void tempPos() {
    tempPos = PVector.add(pos, PVector.mult(speed,1/frameRate));
  }

  // Speed Ball
  public void speedBall() {
    //if (PVector.add(speed, accel).mag()<height*0.05 || PVector.add(speed, accel).mag()<speed.mag() ) {
      speed.add(PVector.mult(accel,1/frameRate));
    //}
  }

  // Move Ball
  public void moveBall() {
    pos.add(PVector.mult(speed,1/frameRate));
  }

  // Display Ball
  public void displayBall() {
    noStroke();
    fill(col);
    ellipse(pos.x, pos.y, 2*rad, 2*rad);
    if ((radioVectors.getState(1)&&selected)||radioVectors.getState(2)) {
      stroke(0, 255, 0);
      line(pos.x, pos.y, pos.x+1*speed.x, pos.y+1*speed.y);
      stroke(255, 0, 0);
      line(pos.x, pos.y, pos.x+1*accel.x, pos.y+1*accel.y);
    }
    if (selected&&togglePath.getState()) {
      //Shifts and Updates Path
      for (int i=0;i<display.path.length-1;i++) {
        display.path[i].x=display.path[i+1].x;
        display.path[i].y=display.path[i+1].y;
      }
      display.path[display.path.length-1].x =pos.x;
      display.path[display.path.length-1].y =pos.y;
    }
  }
}

class Display {

  float dispLeft, dispRight, dispTop, dispBottom, dispFrame;
  PVector[] path = new PVector [1000];

  Display() {
    for (int i=0;i<path.length;i++) {
      path[i] = new PVector(0, 0);
    }
  }

  public void setWindowDim() {
    dispFrame = width*0.01;
    dispLeft = dispFrame;
    dispRight = width*0.8;
    dispTop = height*0.15;
    dispBottom = height - dispFrame;
  }

  public void drawWindow() {
    background(0);
    fill(2,52,77);
    stroke(60,60,60);
    strokeWeight(2);
    rect(10, 20, width+10, 40);
    rectMode(CORNERS);
    noStroke();
    fill(60,60,60);
    rect(dispLeft-dispFrame, dispTop-dispFrame, dispRight+dispFrame, dispBottom+dispFrame);
    noStroke();
    fill(255);
    rect(dispLeft, dispTop, dispRight, dispBottom);
  }
}

class Physics {

  float g = 6.674*pow(10, -3);
  float e = 6.674*pow(10, -2);
  float elast=1;
  
      
  Physics() {
  }

  /* Collision function
   ** Returns the resultant velocity vector for particle A after a 
   collision with particle B
   ** Args ( initial velocity vector of particle A,
   ** initial velocity vector of particle B,
   ** distance vector between center of A to center of B,
   ** mass of A, mass of B)
   */
  public PVector collision(PVector vi1, PVector vi2, PVector d21, float m1, float m2,boolean locked) {
    elast=sliderElast.getValue();
      PVector d21n = new PVector();
      d21n = d21;
      d21n.normalize();
      float vi1r;
      float vi2r;
      PVector vf1r = new PVector();
      //vi1r = vi1.dot(d21)/ d21.mag();
      //vi2r = vi2.dot(d21)/ d21.mag();
      PVector vi1_=vi1;
      vi1r = vi1_.dot(d21n);
      vi2r = vi2.dot(d21n);
    if(!locked){
      vf1r = PVector.mult(d21n, (elast*m2*(vi2r-vi1r)+m1*vi1r+m2*vi2r)/ (m1+m2));
      //vf1r = PVector.mult(d21n, (((vi1r*(m1-m2))/ (m1+m2))+(vi2r*2*m2/ (m1+m2))));
    }
      else{
        vf1r= PVector.mult(d21n,vi1r*-1);
      }
      PVector temp = PVector.sub(vi1, PVector.mult(d21n, vi1r));
      return PVector.add(vf1r, temp);
      
  }

  public PVector gravity(float m1, float m2, PVector d,PVector dn) {
    float coef =sliderGrav.getValue();
    return PVector.mult(dn, (coef*g*m2) / (d.mag()*d.mag()));
  }

  public PVector charge(float m1, float m2, PVector d,PVector dn) {
    float coef =sliderChar.getValue();
    dn.mult(-1);
    return PVector.mult(dn, (coef*e*m2) / (d.mag()*d.mag()*d.mag()));
  }

  public float calcKinetic(){
    float temp=0;
    for (int i=0;i<ball.length;i++){
      temp=temp+0.5*ball[i].mass*ball[i].speed.mag()*ball[i].speed.mag();
    }
    return temp;
  }

  public float calcPotential(){
    float temp=0;
    for (int i=0;i<ball.length-1;i++){
      for (int j=i+1;j<ball.length;j++){
        temp=temp+((g*ball[i].mass*ball[j].mass) * ((1/(ball[i].rad+ball[j].rad))-(1/dist(ball[i].pos.x,ball[i].pos.y,ball[j].pos.x,ball[j].pos.y))));
      }
    }
    return temp;
  }
        
}




