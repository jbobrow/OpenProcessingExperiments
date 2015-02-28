
//This code was made by Mariam Osman, depending upon concepts, codes or both introduced in AAC morphogenetic class
//Please use the menu on the side to change between the options of having a surface, wireframe, spring effect on the control points,
//move the individual control points, extrude a populated 3d component of each panel, change panel size,
//and press "R" to reset

import peasy.*;
import controlP5.*;

PeasyCam cam; 

ControlP5 cp5;
Textlabel myTextlabelA;
Textlabel myTextlabelB;

int N_u = 4;
int N_v = 4;
int D_u, D_v;

float [] knots_u;
float [] knots_v;
float panelSize = 0.02;
float extF = 10;
float scaleFactor = 1;

int sizeX, sizeY ;
int gridSizeX, gridSizeY;

int indexCP = 0;  // index of controlpoint in the X direction
int indexCPy = 0; // index of controlpoint in the Y direction
int indexGP = 0;  // index of gridpoint

boolean mouseStillPressed = false;
boolean Reset = false;

controlPoints ctrl_pts[][] = new controlPoints[N_u+1][N_v+1];

Grid grid;

void setup() 
{
  if (! Reset) 
  { 
    size(1200, 700, P3D);
    sizeX = width/2; 
    sizeY = height;
    gridSizeX = int((sizeX + sizeY)/2);
    gridSizeY = int((sizeX + sizeY)/2);
    makeGrid();
    drawP5();
    makeCam();
    makeKnots();
  } // end if(! RESET)

  makeControlPoints();
} 


void draw() 
{
  if ( Wireframe == false &&  Surface == false)
  {
    Surface = true;
  }

  background(0);

  lights();

  grid.drawGrid();  
  drawControlPoints();
  moveControlPoints(); // if mousePressed and move points is true, camera is closed to change points Z position
  drawSurf(panelSize, panelSize);
  drawNrml(panelSize, panelSize);

  noLights();
  gui();
}

void makeGrid()
{
  // make the grid
  int res = 7;
  int gridPointsX = gridSizeX / res;
  int gridPointsY = gridSizeY / res;
  grid = new Grid(gridPointsX, gridPointsY);
  float s = 1.5; // scale Grid
  for (int i = 0; i < gridPointsY; i++) 
  {
    for (int j = 0; j < gridPointsX; j++) 
    {
      int index = i*gridPointsX + j;
      PVector p = new PVector (j * res * s + (sizeX - gridSizeX*s) / 2, -(i * res * s + (sizeY - gridSizeY*s) / 2), 0);
      grid.setGridPoint(index, p);
    }
  }
}

void makeKnots()
{
  D_u = D_v = 2;
  knots_u = new float [N_u + D_u + 2];
  knots_v = new float [N_v + D_u + 2];
  for (int i = 0; i < knots_u.length; i++) {
    knots_u[i] = float(i) / float(N_u + D_u + 1);
  }
  for (int j = 0; j < knots_u.length; j++) {
    knots_v[j] = float(j) / float(N_v + D_v + 1);
  }
}

void makeControlPoints()
{

  int border = 0;
  for (int i = 0; i <= N_u; i++) 
  {
    for (int j = 0; j <= N_v; j++) 
    {
      PVector p = new PVector(i*(gridSizeX-border)/N_u, -j*(gridSizeY-border)/N_v, random( 150, 600));  // make the controlpoints
      ctrl_pts[i][j] = new controlPoints(p);
    }
  }
}

void drawControlPoints()
{
  for (int i = 0; i <= N_u; i++) 
  {
    for (int j = 0; j <= N_v; j++) 
    {
      ctrl_pts[i][j].drawPoint();   // draw Controlpoints
    }
  }

  if (Spring == true)
  {
    for (int i = 0; i <= N_u; i++) 
    {
      for (int j = 0; j <= N_v; j++) 
      {
        ctrl_pts[i][j].react(ctrl_pts, i, j ); // make control points react to each other as springs
      }
    }

    for (int i = 0; i <= N_u; i++) 
    {
      for (int j = 0; j <= N_v; j++) 
      {
        ctrl_pts[i][j].move(); // move control points
      }
    }
  }
}


void makeCam()
{
  cam = new PeasyCam(this, 350, -300, 300, 800);  // default settings on double click
  cam.setSuppressRollRotationMode();
  cam.setMinimumDistance(.001);
  cam.setMaximumDistance(50000);
  cam.setRotations( -0.7301672, -0.274728, 0.30156484);
}


class controlPoints 
{
  PVector p;
  PVector velocity;
  boolean isSelected;

  float k  = 1.0;  //spring constant
  float mass = 1000.0; //mass
  float rest = 400.0; //resting position
  float damping = 0.99;

  controlPoints(PVector p) 
  {
    this.p = p;
    velocity = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
  } 

  void setSelectionState(boolean isSelectedNew) 
  {
    isSelected = isSelectedNew;
  }

  void drawPoint() 
  {
    pushStyle();
    pushMatrix();
    strokeWeight(10);
    if (isSelected)
      stroke(255, 0, 0);
    else
      stroke(#32A3E3);
    point(p.x, p.y, p.z);
    popMatrix();
    popStyle();
  }

  void react(controlPoints[][] ctrl_pts, int meX, int meY)
  { 

    for (int i = meX-1; i<=meX+1; i++)
    {
      for (int j = meY-1; j<=meY+1; j++)
      {

        //make sure boundary particles take into account the start or end of chain
        int i_c = (i+ctrl_pts.length)%ctrl_pts.length;

        int j_c = (j+ctrl_pts.length)%ctrl_pts.length;

        if (i_c!=meX && j_c!=meY)//check "me" against my neighbors, but NOT myself
        {
          //1 - calculate displacement based on distance between particles and rest length
          float distance = PVector.dist(p, ctrl_pts[i_c][j_c].p);
          float displacement = distance - rest;

          //2 - find acceleration direction - we'll add the force "along" the spring
          PVector acceleration = PVector.sub(ctrl_pts[i_c][j_c].p, p);
          //create a unit vector of the direction
          acceleration.normalize();

          //3 - calculate acceleration based on Newoton's 2nd Law and Hooke's Law of Elasticity
          //Hooke's Law of Elasticity-> F=k*x
          //Acceleration = Force/Mass
          //acceleration = k*displacement/mass
          acceleration.mult(k*displacement/mass);


          //4 - Add acceleration to velocity
          velocity.add(acceleration);
        }
      }
    }

    //6 - Damp movement, as if taking FRICTION into account
    velocity.mult(damping);
  }


  void move()
  {    
    velocity.x = 0 ;
    velocity.y = 0 ;
    //    velocity.z = 0 ;  
    p.add(velocity);
  }
}


boolean Spring = true;
boolean Surface = true;
boolean Wireframe = true;
boolean MovePoints = true;
boolean Extrude3D = true;


void drawP5()
{

  cp5 = new ControlP5(this);

  cp5.setColorForeground(#329DD8);
  cp5.setColorBackground( color(90));
  //  cp5.setColorLabel(#FFFFFF);
  //  cp5.setColorValue(#2B2C2C);
  cp5.setColorActive(#329DD8);


  cp5.addToggle("Wireframe")
    .setPosition(15, 30)
      .setSize(50, 12)
        .setValue(true)
          .setMode(ControlP5.SWITCH)
            ;

  cp5.addToggle("Surface")
    .setPosition(15, 65)
      .setSize(50, 12)
        .setValue(true)
          .setMode(ControlP5.SWITCH)
            ;

  cp5.addToggle("Spring")
    .setPosition(15, 100)
      .setSize(50, 12)
        .setValue(false)
          .setMode(ControlP5.SWITCH)
            ;

  cp5.addToggle("MovePoints")
    .setPosition(15, 135)
      .setSize(50, 12)
        .setValue(false)
          .setMode(ControlP5.SWITCH)
            ;

  cp5.addToggle("Extrude3D")
    .setPosition(15, 170)
      .setSize(50, 12)
        .setValue(false)
          .setMode(ControlP5.SWITCH)
            ;

  Slider s0 = cp5.addSlider("Panel Size", 0.01, 0.09, 0.02, 15, 205, 100, 15)
    .setNumberOfTickMarks(10).
      setSliderMode(Slider.FLEXIBLE);

  Slider s1 = cp5.addSlider("Extrusion Factor", 1, 200, 10, 15, 240, 100, 15);

  myTextlabelA = new Textlabel(cp5, "Press R to reset", 12, height - 20, 20, 15);
  
  myTextlabelB = new Textlabel(cp5, "MENU", 12, 5, 20, 15);

  cp5.setAutoDraw(false);
}

void gui() 
{
  
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  pushStyle();
  noStroke();
  fill(255, 30);
  rect(0, 0, 200, height);
  
  fill(255, 100);
  rect(0, 0, width, 20);
  popStyle();
  cp5.draw();
  myTextlabelA.draw(this);
  myTextlabelB.draw(this);
  updateUI();
  
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}

void updateUI() 
{
  panelSize=(float)cp5.controller("Panel Size").value();
  extF=(float)cp5.controller("Extrusion Factor").value();
  //  scaleFactor=(float)cp5.controller("Scale Factor").value();
}

void keyReleased() 
{
  if (key == 'r' || key == 'R') 
  {
    Reset = true;
    setup();
  }
}


void moveControlPoints() 
{

  for (int i = 0; i < ctrl_pts.length; i++) 
  {
    for (int j = 0; j < ctrl_pts.length; j++) 
    {
      ctrl_pts[i][j].setSelectionState(false);
    }
  }

  if (MovePoints == true ) 
  {
    cam.setMouseControlled(false); 
    //    if (key == 'm' || key == 'M') 
    //    {
    float scrX, scrY, mouseDisShortest;

    if (!mouseStillPressed) 
    {
      scrX = screenX( ctrl_pts[indexCP][indexCPy].p.x, ctrl_pts[indexCP][indexCPy].p.y, ctrl_pts[indexCP][indexCPy].p.z);
      scrY = screenY( ctrl_pts[indexCP][indexCPy].p.x, ctrl_pts[indexCP][indexCPy].p.y, ctrl_pts[indexCP][indexCPy].p.z);
      mouseDisShortest = sqrt( sq(mouseX - scrX) + sq(mouseY - scrY) );

      for (int i = 0; i < ctrl_pts.length; i++) 
      {
        for (int j = 0; j < ctrl_pts.length; j++) 
        {
          scrX = screenX( ctrl_pts[i][j].p.x, ctrl_pts[i][j].p.y, ctrl_pts[i][j].p.z);
          scrY = screenY( ctrl_pts[i][j].p.x, ctrl_pts[i][j].p.y, ctrl_pts[i][j].p.z);
          float mouseDis = sqrt( sq(mouseX - scrX) + sq(mouseY - scrY) );
          if ( mouseDis <= mouseDisShortest) {
            indexCP = i;
            indexCPy = j; 
            mouseDisShortest = mouseDis;
          }
        }
      }
    } // end if(!mouseStillPressed){

    ctrl_pts[indexCP][indexCPy].setSelectionState(true); 


    // find nearest gridpoint
    scrX = screenX( grid.pos[indexGP].x, grid.pos[indexGP].y, grid.pos[indexGP].z );
    scrY = screenY( grid.pos[indexGP].x, grid.pos[indexGP].y, grid.pos[indexGP].z );
    mouseDisShortest = sqrt( sq(mouseX - scrX) + sq(mouseY - scrY) );
    for (int i = 0; i < grid.pos.length; i++) {
      scrX = screenX( grid.pos[i].x, grid.pos[i].y, grid.pos[i].z );
      scrY = screenY( grid.pos[i].x, grid.pos[i].y, grid.pos[i].z  );
      float mouseDis = sqrt( sq(mouseX - scrX) + sq(mouseY - scrY) );
      if ( mouseDis <= mouseDisShortest) {
        indexGP = i; 
        mouseDisShortest = mouseDis;
      }
    } // end for i

    if (mousePressed) {
      mouseStillPressed = true;

      //Move Control Point
      if (mouseButton == LEFT) 
      {
        float dx = grid.pos[indexGP].x - ctrl_pts[indexCP][indexCPy].p.x;
        float dy = grid.pos[indexGP].y - ctrl_pts[indexCP][indexCPy].p.y;
        float dz = grid.pos[indexGP].z - ctrl_pts[indexCP][indexCPy].p.z;
        // ctrl_pts[indexCP][indexCPy].p.x += dx/6;
        // ctrl_pts[indexCP][indexCPy].p.y += dy/6;
        if (pmouseY < mouseY)
        {
          ctrl_pts[indexCP][indexCPy].p.z += dz/12 ;
        }
        if (pmouseY > mouseY)
        {
          ctrl_pts[indexCP][indexCPy].p.z -= dz/12 ;
        }
      }
    } 
    else 
    {
      mouseStillPressed = false;
    }
    //    }
  } 
  else 
  {
    cam.setMouseControlled(true);
  }
} 


PVector surfPos(float u, float v)
{
  PVector pt = new PVector();
  for (int i = 0; i <= N_u; i++) {
    for (int j = 0; j <= N_v; j++) {
      PVector pt_k = new PVector( ctrl_pts[i][j].p.x, ctrl_pts[i][j].p.y, ctrl_pts[i][j].p.z );
      pt_k.mult( fader_u(u, i) * fader_v(v, j) );
      pt.add( pt_k );
    }
  }
  return pt;
}


class Grid
{
  PVector pos[], originalPos[];
  int gridPointsX, gridPointsY, gridPoints;

  Grid(int gridPointsX, int gridPointsY) 
  {
    this.gridPointsX = gridPointsX;
    this.gridPointsY = gridPointsY;
    gridPoints = gridPointsX * gridPointsY;

    pos = new PVector[gridPoints];

    originalPos = new PVector[gridPoints];
    pos = originalPos;
  } 

  void setGridPoint(int index, PVector p) 
  {
    pos[index] = p;
  } 

  float getAlphaChannel(float v) {
    if ( v < 0 ) 
      return map(v, -100, 10, 0, 255);
    else 
      return map(v, 0, 800, 1855, 0);
    //return 0;
  } // end float getAlphaChannel(float v)


  void drawGrid() 
  {
    strokeWeight(1);

    for (int i = 0; i < gridPointsY-1; i++) 
    {
      for (int j = 0; j < gridPointsX-1; j++) 
      {

        float x1 = pos[ (i+0) * gridPointsX + (j+0)].x;
        float y1 = pos[ (i+0) * gridPointsX + (j+0)].y;
        float z1 = pos[ (i+0) * gridPointsX + (j+0)].z;

        float x2 = pos[ (i+1) * gridPointsX + (j+0)].x;
        float y2 = pos[ (i+1) * gridPointsX + (j+0)].y;
        float z2 = pos[ (i+1) * gridPointsX + (j+0)].z;

        float x3 = pos[ (i+1) * gridPointsX + (j+1)].x;
        float y3 = pos[ (i+1) * gridPointsX + (j+1)].y;
        float z3 = pos[ (i+1) * gridPointsX + (j+1)].z;

        float x4 = pos[ (i+0) * gridPointsX + (j+1)].x;
        float y4 = pos[ (i+0) * gridPointsX + (j+1)].y;
        float z4 = pos[ (i+0) * gridPointsX + (j+1)].z;

        stroke( 50, 157, 216, getAlphaChannel( lerp(x1, x2, y2) ));  

        noFill();
        beginShape(); 
        vertex(x4, y4, z4); 
        vertex(x1, y1, z1); 
        vertex(x2, y2, z2); 
        endShape();
      }
    }
  }
} 


void drawSurf(float du, float dv)
{
  fill(1);
  noStroke();
  for (float u = knots_u[D_u]; u <= knots_u[knots_u.length-D_u-1]; u += du) 
  {
    for (float v = knots_v[D_v]; v <= knots_v[knots_v.length-D_v-1]; v += dv) 

    {

      PVector pt_1 = surfPos(u, v   );
      PVector pt_2 = surfPos(u+du, v   );
      PVector pt_3 = surfPos(u+du, v+dv);
      PVector pt_4 = surfPos(u, v+dv);

      //PVector pt_12 = surfPos(u+((du/3)+ (mouseX * 0.000005) ), v+(dv/3)  );

      PVector pt_12 = surfPos(u+(du/3), v+(dv/3)  );
      PVector pt_23 = surfPos(u+(du-(du/3)), v+(dv-(dv/3))  );

      if (Wireframe == true)
      {
        stroke(255);
        strokeWeight(1);
        noFill();

        beginShape(TRIANGLES);
        vertex(pt_1.x, pt_1.y, pt_1.z);     
        vertex(pt_4.x, pt_4.y, pt_4.z);
        vertex(pt_12.x, pt_12.y, pt_12.z);
        endShape();

        beginShape(TRIANGLES);
        vertex(pt_1.x, pt_1.y, pt_1.z);     
        vertex(pt_2.x, pt_2.y, pt_2.z);
        vertex(pt_12.x, pt_12.y, pt_12.z);
        endShape();

        beginShape(TRIANGLES);
        vertex(pt_3.x, pt_3.y, pt_3.z);     
        vertex(pt_4.x, pt_4.y, pt_4.z);
        vertex(pt_23.x, pt_23.y, pt_23.z);
        endShape();


        beginShape(TRIANGLES);
        vertex(pt_2.x, pt_2.y, pt_2.z);
        vertex(pt_3.x, pt_3.y, pt_3.z);
        vertex(pt_23.x, pt_23.y, pt_23.z);
        endShape();

        beginShape(QUADS);
        vertex(pt_2.x, pt_2.y, pt_2.z); 
        vertex(pt_12.x, pt_12.y, pt_12.z);
        vertex(pt_4.x, pt_4.y, pt_4.z);
        vertex(pt_23.x, pt_23.y, pt_23.z);
        endShape();
      }

      if (Surface == true)
      {
        fill(180);
        beginShape(TRIANGLES);
        vertex(pt_1.x, pt_1.y, pt_1.z);     
        vertex(pt_4.x, pt_4.y, pt_4.z);
        vertex(pt_12.x, pt_12.y, pt_12.z);
        endShape();

        fill(200);
        beginShape(TRIANGLES);
        vertex(pt_1.x, pt_1.y, pt_1.z);     
        vertex(pt_2.x, pt_2.y, pt_2.z);
        vertex(pt_12.x, pt_12.y, pt_12.z);
        endShape();

        fill(120);
        beginShape(TRIANGLES);
        vertex(pt_3.x, pt_3.y, pt_3.z);     
        vertex(pt_4.x, pt_4.y, pt_4.z);
        vertex(pt_23.x, pt_23.y, pt_23.z);
        endShape();

        fill(255);
        beginShape(TRIANGLES);
        vertex(pt_2.x, pt_2.y, pt_2.z);
        vertex(pt_3.x, pt_3.y, pt_3.z);
        vertex(pt_23.x, pt_23.y, pt_23.z);
        endShape();

        fill(200, 140);
        beginShape(QUADS);
        vertex(pt_2.x, pt_2.y, pt_2.z); 
        vertex(pt_12.x, pt_12.y, pt_12.z);
        vertex(pt_4.x, pt_4.y, pt_4.z);
        vertex(pt_23.x, pt_23.y, pt_23.z);
        endShape();
      }
    }
  }
}

void drawNrml(float du, float dv)
{
  scale(scaleFactor);
  for (float u = knots_u[D_u]; u <= knots_u[knots_u.length-D_u-1]; u += du) 
  {
    for (float v = knots_v[D_v]; v <= knots_v[knots_v.length-D_v-1]; v += dv) 
    {
      //Normal Vectors
      PVector vN_1 = surfPos(u, v );
      PVector vN_2 = surfPos(u+0.0001, v );
      PVector vN_3 = surfPos(u, v+0.0001 );

      PVector tan_U = PVector.sub(vN_1, vN_2);
      PVector tan_V = PVector.sub(vN_1, vN_3);

      PVector nrml  = tan_V.cross(tan_U);
      nrml.normalize();

      //shape Vectors
      PVector pt_2 = surfPos(u+du, v);
      PVector pt_4 = surfPos(u, v+dv);
      PVector pt_12 = surfPos(u+(du/3), v+(dv/3));
      PVector pt_23 = surfPos(u+(du-(du/3)), v+(dv-(dv/3)));
      PVector midpt = surfPos(u+(du/2), v+(dv/2));

      //PVector normal = new PVector(nrml.x*extF, nrml.y*extF, nrml.z*extF);
      PVector N = new PVector(0, 0, nrml.z*extF);

      PVector n1 = PVector.add(pt_2, N);
      PVector n2 = PVector.add(pt_12, N);
      PVector n3 = PVector.add(pt_4, N);
      PVector n4 = PVector.add(pt_23, N);      

      if (Extrude3D == true && Surface == true)
      {


        fill(220);
        beginShape(QUADS);
        vertex(n1.x, n1.y, n1.z); 
        vertex(n2.x, n2.y, n2.z);     
        vertex(n3.x, n3.y, n3.z);
        vertex(n4.x, n4.y, n4.z);
        endShape();

        fill(180);
        beginShape(QUADS);
        vertex(n1.x, n1.y, n1.z); 
        vertex(n2.x, n2.y, n2.z);     
        vertex(pt_12.x, pt_12.y, pt_12.z);
        vertex(pt_2.x, pt_2.y, pt_2.z); 
        endShape();

        fill(225);
        beginShape(QUADS);
        vertex(n2.x, n2.y, n2.z);
        vertex(n3.x, n3.y, n3.z);
        vertex(pt_4.x, pt_4.y, pt_4.z);      
        vertex(pt_12.x, pt_12.y, pt_12.z); 
        endShape();

        fill(130);
        beginShape(QUADS);
        vertex(n3.x, n3.y, n3.z);
        vertex(n4.x, n4.y, n4.z);
        vertex(pt_23.x, pt_23.y, pt_23.z);
        vertex(pt_4.x, pt_4.y, pt_4.z);      
        endShape();

        fill(200);
        beginShape(QUADS);
        vertex(n1.x, n1.y, n1.z);
        vertex(n4.x, n4.y, n4.z);
        vertex(pt_23.x, pt_23.y, pt_23.z);
        vertex(pt_2.x, pt_2.y, pt_2.z);      
        endShape();
      }


      if (Wireframe == true && Extrude3D == true)
      {
        stroke(255);
        strokeWeight(1);
        noFill();

        beginShape(QUADS);
        vertex(n1.x, n1.y, n1.z); 
        vertex(n2.x, n2.y, n2.z);     
        vertex(n3.x, n3.y, n3.z);
        vertex(n4.x, n4.y, n4.z);
        endShape();

        beginShape(QUADS);
        vertex(n1.x, n1.y, n1.z); 
        vertex(n2.x, n2.y, n2.z);     
        vertex(pt_12.x, pt_12.y, pt_12.z);
        vertex(pt_2.x, pt_2.y, pt_2.z); 
        endShape();

        beginShape(QUADS);
        vertex(n2.x, n2.y, n2.z);
        vertex(n3.x, n3.y, n3.z);
        vertex(pt_4.x, pt_4.y, pt_4.z);      
        vertex(pt_12.x, pt_12.y, pt_12.z); 
        endShape();

        beginShape(QUADS);
        vertex(n3.x, n3.y, n3.z);
        vertex(n4.x, n4.y, n4.z);
        vertex(pt_23.x, pt_23.y, pt_23.z);
        vertex(pt_4.x, pt_4.y, pt_4.z);      
        endShape();

        beginShape(QUADS);
        vertex(n1.x, n1.y, n1.z);
        vertex(n4.x, n4.y, n4.z);
        vertex(pt_23.x, pt_23.y, pt_23.z);
        vertex(pt_2.x, pt_2.y, pt_2.z);      
        endShape();
      }
    }
  }
}


float fader_u(float u, int k)
{
  return basisn(u, k, D_u, knots_u);
}
float fader_v(float u, int k)
{
  return basisn(u, k, D_v, knots_v);
}

float basisn(float u, int k, int d, float [] knots) { 
  if (d == 0) { 
    return basis0(u, k, knots);
  }
  else { 
    float b1 = basisn(u, k, d-1, knots) * (u - knots[k]) / (knots[k+d] -
      knots[k]);
    float b2 = basisn(u, k+1, d-1, knots) * (knots[k+d+1] - u) / (knots[k+d+1]
      - knots[k+1]);
    return b1 + b2;
  }
}
float basis0(float u, int k, float [] knots)
{ 
  if (u >= knots[k] && u < knots[k+1]) return 1;
  else return 0;
}

