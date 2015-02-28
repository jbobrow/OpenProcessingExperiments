
import remixlab.proscene.*;

Scene scene;

int bgColor = 250;

BasePole [] bp = new BasePole[4];
int bpw = 150, bpl = 200, bph = 100;
int bpsx = -40, bpsy = 20, bpsz = 0;
int padx = 90, pady = 40;

float blockSize = .5;
PVector convC = new PVector(bpsx+10,bpsy+(int)bpw/2,bpsz);

float hh = 40, hw = 40, hl = 60;

int numBlocks = 1000;

PVector block[] = new PVector[numBlocks];
PVector blockcurr[] = new PVector[numBlocks];

int gripAng = 45;

int stepSize = 10;
PFont font1;
//____________________INITIALIZE/SETUP_____________________________//
void setup() 
{
  size(500, 600, P3D);
  background(bgColor);
  font1 = loadFont("CourierNew36.vlw");
  textAlign(CENTER);
  smooth();

  scene = new Scene(this);
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(false);
  
  scene.camera().setOrientation(radians(0),radians(90));
  scene.camera().setPosition(new PVector(275, 410, 325));
  scene.camera().lookAt(new PVector(0,0,0));
  print("Starting Position: ");
  println(scene.camera().position() + " "+ scene.camera().fieldOfView());


  int blocknum = 0;
  for (int k = bpsz; k < hh+bpsz; k+=10) 
    for (int i = bpsx+padx; i <= hw+bpsx+padx; i += 10) 
      for (int j = bpsy+pady; j <= hl+bpsy+pady; j+= 10) 
        if (i == bpsx+padx || i == hw+bpsx+padx || j == bpsy+pady || j == hl+bpsy+pady) {
          block[blocknum] = new PVector(i, j, k);
          blocknum++;
        }


  numBlocks = blocknum;

  bp[0] = new BasePole(bpsx, bpsy, bpsz, bph,1);
  bp[1] = new BasePole(bpsx, bpsy+bpw, bpsz, bph,2);
  bp[2] = new BasePole(bpsx+bpl, bpsy, bpsz, bph,3);
  bp[3] = new BasePole(bpsx+bpl, bpsy+bpw, bpsz, bph,4);

  for (int i=0;i<4;i++) bp[i].display();
  
  stepSize = (int)(dist(convC.x,convC.y,convC.z,block[0].x,
              block[0].y,block[0].z)/10.0)+4;
}

long step = 0;
int blkcnt = 0;
long frame = 0;
PVector pos = new PVector(1, 1, 1);
int blk = 0;
int dir = 1;

void draw()
{
  background(150,200,bgColor);
  for (int i=0;i<4;i++) bp[i].display();
  
  fill(0,40,0);
  pushMatrix(); translate(bpsx+100,bpsy+100,-30); 
  box(bpl+200,bpw+200,1);
  popMatrix();

  blkcnt = blkcnt % (numBlocks-1);
  
  int gripOpen = 60, gripClose = 15;

  float liftUp = 10;
  for (int i = 1; i < blkcnt; i ++) 
    if (blockcurr[i-1].z+20 > liftUp) 
      liftUp = blockcurr[i-1].z+20; 

  if (step == stepSize-1 && dir == 1) {
    dir = -1;  
    blockcurr[blkcnt] = block[blkcnt];
    blkcnt++;
    gripAng = gripClose;
  }
  else if (step == 0 && dir == -1) { 
    dir = 1;
    blk = blkcnt;
    //stepSize = (int)(dist(convC.x,convC.y,convC.z,block[blk].x,block[blk].y,block[blk].z)/10.0)+4;
    float [] testdist = new float[3];
    testdist[0] = abs(convC.x - block[blk].x);
    testdist[1] = abs(convC.y - block[blk].y);
    testdist[2] = abs(convC.z - block[blk].z);
    stepSize = (int)max(testdist);
    stepSize = int(stepSize/50.0)+5;
    gripAng = gripOpen;
  }

  float x = convC.x + step*(block[blk].x-convC.x)/stepSize;
  float y = convC.y + step*(block[blk].y-convC.y)/stepSize;
  float z = convC.z + step*(block[blk].z-convC.z)/stepSize
          + liftUp*sin(step*PI/stepSize);
  pos.set(x, y, z);
  plot_robot();

  if (frame % 30 == 0) printStuff();
  if (dir > 0)  step++;
  else step --;
  frame++;
}


void plot_robot()
{
  fill(155, 0, 0);
  pushMatrix(); 
  translate(pos.x, pos.y, pos.z); 
  sphere(2); 
  popMatrix();
  stroke(240); strokeWeight(1);
  //for (int i = 0; i < 4; i ++) line(bp[i].x, bp[i].y, bp[i].z2+5, pos.x, pos.y, pos.z);
    
  line(bp[0].x, bp[0].y,bp[0].z2,bp[2].x, bp[2].y,bp[2].z2);
  line(bp[0].x, bp[0].y+2,bp[0].z2,bp[2].x, bp[2].y+2,bp[2].z2);
  line(bp[1].x, bp[1].y,bp[1].z2,bp[3].x, bp[3].y,bp[3].z2);
  line(bp[1].x, bp[1].y+2,bp[1].z2,bp[3].x, bp[3].y+2,bp[3].z2);
  
  line(pos.x, bp[0].y,bp[0].z2,pos.x, bp[1].y,bp[2].z2);
  line(pos.x+2, bp[0].y,bp[0].z2,pos.x+2, bp[1].y,bp[2].z2);
  
  line(pos.x, pos.y,bp[2].z2,pos.x, pos.y,pos.z);
  
  stroke(0);
  pushMatrix(); translate(pos.x,bp[0].y,bp[0].z2); box(10,10,10); popMatrix();
  pushMatrix(); translate(pos.x,bp[1].y,bp[0].z2); box(10,10,10); popMatrix();
  
  
  fill(0,155,0);
  pushMatrix(); translate(pos.x,pos.y,bp[0].z2); box(10,10,10); popMatrix();

  fill(155,155,0);
  pushMatrix(); translate(pos.x,pos.y,pos.z); box(10,10,10); popMatrix();
  
  fill(0); stroke(80); strokeWeight(1);
  pushMatrix(); translate(convC.x,convC.y,convC.z-25); box(100,50,1); popMatrix();
  
  
  fill(55, 40, 0); 
  stroke(0); strokeWeight(1);
  for (int i = 0; i < blkcnt; i++) {
    pushMatrix(); 
    translate(block[i].x, block[i].y, block[i].z-20);
    box(10, 10, 10); 
    popMatrix();
  }
  
  drawGripper();

  stroke(0);
}


void printStuff()
{
  println(" viewdir: " +  scene.camera().viewDirection()); 
  println("pos: " + scene.camera().position());
  println("or: " + scene.camera().orientation());
}

class BasePole
{
  float x, y, z, ht, z2, or, roty;
  int num;

  BasePole(float i1, float i2, float i3, float i4, int nm)
  {
    x = i1;
    y = i2;
    z = i3;
    ht = i4;
    z2 = z+ht;
    num = nm;
  }
 
  void display() {
    stroke(0); strokeWeight(10);
    line(this.x, this.y, this.z-20, this.x, this.y, this.z2);
    
    fill(0,0,155); strokeWeight(5); stroke(0);
    pushMatrix(); translate(this.x,this.y,this.z-19);
    box(20); popMatrix();
    
    strokeWeight(1);
   
    fill(255);
    textFont(font1,20);
    text(this.num,this.x+20,this.y,this.z-20);
    int motorDia = 6, motorPos = 10;
    
  }
}

int nj = 4;
float [][] dh = new float[4][nj];
void drawGripper()
{
  stroke(10,10,0); strokeWeight(3);
  
  for (int i = 0; i < nj; i ++)  dh[0][i] = 20; 
  
  dh[0][2] = dh[0][3] = 7;
 
  dh[3][0] = radians(gripAng); 
  dh[3][1] = PI-dh[3][0]; 
  dh[3][2] = dh[3][1];
  dh[3][3] = dh[3][0];
  
  for (int i = -5; i <= 5; i += 2) 
  {
    float p1 = pos.x+dh[0][0]*cos(dh[3][0]);  
    float p2 = pos.z-dh[0][0]*sin(dh[3][0]);
    float p3 = pos.x+dh[0][0]*cos(dh[3][1]);
    float p4 = pos.z-dh[0][0]*sin(dh[3][1]);
    
    line(pos.x,pos.y+i,pos.z,p1,pos.y+i,p2);
    line(pos.x,pos.y+i,pos.z,p3,pos.y+i,p4);
    
    line(p1,pos.y+i,p2,p1+dh[0][2]*cos(dh[3][2]),pos.y+i,p2-dh[0][2]*sin(dh[3][2]));
    line(p3,pos.y+i,p4,p3+dh[0][3]*cos(dh[3][3]),pos.y+i,p4-dh[0][3]*sin(dh[3][3]));
  }
  
}


