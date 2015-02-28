
import processing.pdf.*;

//TODO: Antialiasing
//draw the enclosing area! (i.e. my figure) Do you want me to do it?
// Do I just make a big red boundary?
// I was thingking of shading the area that could be enclosed based on the current edge being processed by the MST.
//ok..., may be harder.  Do you want to do it or should I?
// i have no problem doing it will not take long at all. Then your whole talk is the applet!!!

int maxR=250;

boolean record = false;
float winhi=768;
float sle=winhi/1000;
int itercount = 0;

public class spoint {
  spoint(int i, int x, int y) {
    id = i;
    xcoord = x;
    ycoord = y;
    alpha1 = 0;
    beta = TWO_PI;
    tree = i;
    chindex = -1;
  }
  void draw(boolean newsect) {
    fill(100, 255, 100, 255);
    stroke(0, 255, 0, 50);
    if (newsect) {
      fill(255, 255, 0, 200);
      stroke(255, 255, 0);
    }

    if (alpha1 > beta && chindex >= 0) {
      beta += TWO_PI;
    }
    if (chindex >= 0) {
      //println(chindex);
      strokeWeight(0);
      arc(xcoord, ycoord, currentdiam, currentdiam, alpha1, beta);
    }
    //println(xcoord);
    //println(ycoord);
    //println(alpha1);
    //println(beta);


    fill(0, 0, 255);
    strokeWeight(0);
    stroke(0);
    ellipse(xcoord, ycoord, pointdiam, pointdiam);
  }
  int xcoord;
  int ycoord;
  float alpha1;
  float beta;
  int tree;
  int id;
  int pointdiam = 15;
  int chindex;
};

boolean pointsAdded;
ArrayList<spoint> pointset;
ArrayList<Float> radii;

int dist(spoint l, spoint r) {
  int xdiff = l.xcoord - r.xcoord;
  int ydiff = l.ycoord - r.ycoord;
  int dist = xdiff*xdiff + ydiff*ydiff;
  return dist;
}

public class pointpair {
  int pointid1, pointid2, distance;
  pointpair(int i, int j) {
    pointid1=i;
    pointid2=j;
    distance = dist((spoint)pointset.get(i), (spoint)pointset.get(j));
  }
};

public class pointpaircomp implements Comparator<pointpair> {
  public int compare(pointpair o1, pointpair o2) {
    return (((Integer)o1.distance).compareTo((Integer)o2.distance));
  }
}

public class spointcomp implements Comparator<spoint> {
  public int compare(spoint o1, spoint o2) {
    return (((Integer)(o1.xcoord*550 + o1.ycoord)).compareTo((Integer)(o2.xcoord*550 + o2.ycoord)));
  }
}

public class hullcomp implements Comparator<spoint> {
  public int compare(spoint o1, spoint o2) {
    return ((Integer)o1.chindex).compareTo((Integer)o2.chindex);
  }
}

void connect(spoint x, spoint y) {
  int minid = x.tree;
  int id2 = y.tree;
  if (y.tree < minid) {
    minid = y.tree;
    id2 = x.tree;
  }
  for (int i = 0; i < pointset.size(); i++) {
    x = pointset.get(i);
    if (x.tree == id2) {
      x.tree = minid;
      pointset.set(i, x);
    }
  }
}

boolean leftof(spoint anchor, spoint end, spoint consider) {
  int ax = end.xcoord - anchor.xcoord;
  int ay = end.ycoord - anchor.ycoord;
  int bx = consider.xcoord - anchor.xcoord;
  int by = consider.ycoord - anchor.ycoord;
  int k = ax*by - ay*bx;
  return (k < 0);
}

ArrayList<spoint> Jarvis(ArrayList<spoint> spoints) {
  if (spoints.size() == 1) {
    spoints.get(0).chindex = 0;
    return spoints;
  }
  if (spoints.size() == 2) {
    spoints.get(0).chindex = 0;
    spoints.get(1).chindex = 1;
    return spoints;
  }
  Collections.sort(spoints, new spointcomp());
  for (int i = 0; i < spoints.size(); i++) {
    spoints.get(i).chindex = -1;
  }
  spoints.get(0).chindex = 0;
  int curspoint = 0;

  //int curindex = 0;
  int i = 0;
  int endpoint = 0;  
  do {
    spoints.get(curspoint).chindex = i;
    endpoint = 0;
    for (int j = 1; j < spoints.size(); j++) {
      if ((endpoint == curspoint) || leftof(spoints.get(curspoint), spoints.get(endpoint), spoints.get(j))) {
        endpoint = j;
      }
    }
    i++;
    curspoint = endpoint;
  }
  while (endpoint != 0); 



  return spoints;
}

void processState(ArrayList<spoint> state) {
  //print(state.size());
  for (int i = 0; i < pointset.size(); i++) {
    ArrayList<spoint> a = new ArrayList();
    for (int j = 0; j < state.size(); j++) {
      if (state.get(j).tree == i) {
        a.add(state.get(j));
      }
    }
    if (! a.isEmpty()) {
      a = Jarvis(a);
      Collections.sort(a, new hullcomp());
      int x = 0;
      while (a.get (x).chindex < 0) {
        state.get(a.get(x).id).alpha1 = 0;
        state.get(a.get(x).id).beta = 0;
        x++;
      }
      int first = x;

      while (x < a.size ()) {
        float angle = 0;
        int succ = x + 1;
        if (succ >= a.size()) succ = first;  

        if ( a.get(succ).xcoord - a.get(x).xcoord == 0) {
          if (  a.get(succ).ycoord - a.get(x).ycoord > 0) { 
            angle = 0;
            state.get(a.get(x).id).beta = angle;
            state.get(a.get(succ).id).alpha1 = angle;
          }
          else if (a.get(succ).ycoord - a.get(x).ycoord < 0) {
            angle = PI;
            state.get(a.get(x).id).beta = angle;
            state.get(a.get(succ).id).alpha1 = angle;
          }
          else if (a.get(succ).ycoord - a.get(x).ycoord == 0) {
            state.get(a.get(x).id).beta = TWO_PI;
            state.get(a.get(x).id).alpha1 = 0;
          }
        }

        else {
          //float angle = 0;
          float ax = (float) a.get(x).xcoord;
          float sx = (float) a.get(succ).xcoord;
          float ay = (float)a.get(x).ycoord;
          float sy = (float)a.get(succ).ycoord;
          float deltax = sx - ax;
          float deltay = sy - ay;
          if (deltax < 0 && deltay < 0) {
            angle =  atan(deltay/deltax) + HALF_PI;
          }
          if (deltax < 0 && deltay >= 0) {
            angle = atan(deltay/deltax) + HALF_PI;
          }
          if (deltax > 0 && deltay < 0) {
            angle = atan(deltay/deltax) - HALF_PI;
          }
          if (deltax >0 && deltay >=0) {
            angle = atan(deltay/deltax) -HALF_PI;
          }
          state.get(a.get(x).id).beta = angle;
          state.get(a.get(succ).id).alpha1 = angle;
        }

        x++;
      }
    }
  }
}

ArrayList<pointpair> edges;
ArrayList<pointpair> addededges;

ArrayList<ArrayList<spoint> >steps;
float currentdiam = 0;
//spoint a = new spoint(0, 40, 60);
///spoint b = new spoint(1, 150, 400);
//spoint c = new spoint(2, 100, 100);
spoint c1 = new spoint(0, 25, 25);
spoint c2 = new spoint(1, 25, 525);

spoint c3 = new spoint(2, 525, 25);

spoint c4 = new spoint(3, 525, 525);



int step = 0;

int ws=1000;
int trans = 225;
float sumsq = 0.0;
float area = 0.0;

void compute() {
  edges = new ArrayList<pointpair>();
  addededges = new ArrayList<pointpair>();
  steps = new ArrayList< ArrayList<spoint> >();
  radii = new ArrayList<Float>();
  addededges.add(new pointpair(0, 0));

  for (int i = 0; i < pointset.size(); i++) {

    for (int j = i + 1; j < pointset.size(); j++) {
      pointpair x = new pointpair(i, j);
      edges.add(x);
    }
  }
  ArrayList<spoint> b = new ArrayList<spoint>();
  for (int j = 0; j < pointset.size(); j++) {
    spoint y =  pointset.get(j);
    spoint x = new spoint(y.id, y.xcoord, y.ycoord);
    x.alpha1 = y.alpha1;
    x.beta = y.beta;
    x.tree = y.tree;
    x.chindex = y.chindex;
    b.add(x);
  }
  steps.add(b);
  Collections.sort(edges, new pointpaircomp());
  int added = 0;
  radii.add((Float)0.0);
  for (int k = 0; k < edges.size(); k++) {
    int l = edges.get(k).pointid1;
    int r = edges.get(k).pointid2;
    if (pointset.get(l).tree != pointset.get(r).tree) {
      //new step!
      ArrayList<spoint> a = new ArrayList<spoint>();
      for (int j = 0; j < pointset.size(); j++) {
        spoint y =  pointset.get(j);
        spoint x = new spoint(y.id, y.xcoord, y.ycoord);
        x.alpha1 = y.alpha1;
        x.beta = y.beta;
        x.tree = y.tree;
        x.chindex = y.chindex;
        a.add(x);
      } 
      processState(a);
      steps.add(a);
      radii.add(sqrt((float)(edges.get(k).distance)));
      connect(pointset.get(l), pointset.get(r));
      addededges.add(edges.get(k));
    }

    added++;
  }

  int st = 0;
}

void setup() {
  size((int)(ws*sle) + 200, (int)( ws*sle));
  background(255);
  pointsAdded = false;
  pointset = new ArrayList<spoint>();

  pointset.add(c1);
  pointset.add(c2);
  pointset.add(c3);
  pointset.add(c4);

  //compute();

  noLoop();
}

void mouseClicked() {
  if (!pointsAdded) {
    int xcoord = (int)( mouseX/sle - trans);
    int ycoord = (int)( mouseY/sle - trans);

    pointset.add(new spoint(pointset.size(), xcoord, ycoord));
    //compute();
    redraw();
  }
}

void keyPressed() {
  if (key == 'q') {maxR-=25;redraw();}
  if (key == 'p') {record = true; redraw();}
  if (key == CODED) {
    if (keyCode == RIGHT && step < pointset.size() && pointsAdded) { 
      step++;
      redraw();
    }
    if (keyCode == LEFT && step > 0 && pointsAdded) { 
      step--;
      redraw();
    }
  }
  if (key == ENTER && !pointsAdded) {
    compute();
    pointsAdded = true;
    redraw();
  }
  if (key == BACKSPACE) {
    //println(pointset.size());
    itercount++;
    pointset = new ArrayList<spoint>();
    //println(pointset.size());
    pointset.add(new spoint(0, 25, 25));
    pointset.add(new spoint(1, 25, 525));
    //pointset.get(1).tree = 1;
    pointset.add(new spoint(2, 525, 25));
    pointset.add(new spoint(3, 525, 525));
    //println(pointset.size());
    step = 0;
    pointsAdded = false;

    //compute();
    redraw();
  }
}






//spoint a = new spoint(0, 25, 25);



void drawMaxRegion(float d)
{
  pushStyle();
  pushMatrix();
  ellipseMode(RADIUS);
  strokeWeight(0);
  stroke(240,240,250);
  fill(240,240,250);
  translate(25, 25);
  
  translate(250, 250);
  for (int i=0;i<4;i++) {
    rotate(PI/2);
    for (float j=0;j<250;j+=3) {float r=min( (500-j)/2, d);
    ellipse(-250+j, -250,r,r);ellipse(-250, -250+j,r,r);}
  }
  stroke(0);
  translate(-250, -250);
  rect(0, 0, 500, 500);

  popMatrix();
  popStyle();
}


void draw() {
  if(record){beginRecord(PDF, "MST"+itercount + "-" +step +".pdf");}
  background(255);
  pushMatrix();
  scale(sle);
  smooth();


  //scale(ws/1000.0);
  //scale(1.0/500,1.0/500);
  //scale(1.0/2,1.0/2);
  translate(trans, trans);
  //scale(ws,ws);
  //  translate(250,250);
  //box
  noFill();
  stroke(0);
  strokeWeight(3);
  //fill(240, 240, 255, 10);
  
  noFill();
  rect(25, 25, 500, 500);

  stroke(200, 200, 255);
  for (int n = 0; n < pointset.size(); n++) {
    pointset.get(n).draw(false) ;
  }


  if (pointsAdded) {
    
    PFont f;
    f = createFont("Helvetica Neue", 72, true);
    textFont(f, 36);
    fill(0, 0, 200);
    //float a = PI*(sumsq+ 2*radii.get(step))/4.0;

    // text("Area = " + str(a), 230, -150);
    println(step);
    if(step > 0){drawMaxRegion((radii.get(step - 1))/2.0);}
    for (int i = 0; i < addededges.size(); i++) {
      pointpair pp = addededges.get(i);
      int x1, x2, y1, y2;

      //println(currentdiam);


      strokeWeight(3);
      stroke(200, 200, 255);
      x1 = pointset.get(pp.pointid1).xcoord;
      y1 = pointset.get(pp.pointid1).ycoord;
      x2 = pointset.get(pp.pointid2).xcoord;
      y2 = pointset.get(pp.pointid2).ycoord;
      line(x1, y1, x2, y2);
    }
    for (int k = 0; k < step; k++) {
      for (int j = 0; j < pointset.size(); j++) {
        currentdiam = radii.get(k);
        (steps.get(k)).get(j).draw(k == step - 1);
      }

      pointpair pp = addededges.get(k);
      int x1, x2, y1, y2;

      //println(currentdiam);


      strokeWeight(3);
      stroke(0, 0, 255);
      if (k == step - 1) stroke(255, 0, 0);
      x1 = pointset.get(pp.pointid1).xcoord;
      y1 = pointset.get(pp.pointid1).ycoord;
      x2 = pointset.get(pp.pointid2).xcoord;
      y2 = pointset.get(pp.pointid2).ycoord;
      line(x1, y1, x2, y2);
      sumsq = 0.0;
      for (int g = 0; g < step ;g++) {
        sumsq += (addededges.get(g).distance/250000.0);
      }
      float maxl = 0.0;
      if (step > 1) maxl = addededges.get(step - 1).distance/250000.0;  
      float area = (sumsq+maxl*(pointset.size() - step + 1))*PI/4.0;
      fill(0, 0, 255);
      float areab;
      println(maxl);
     
      if(maxl <= 0.25){
        areab = 2*sqrt(maxl) + PI*maxl/4.0 + 1;
      }
      else{
       areab = maxl*sqrt(3) - 1.0/(sqrt(3)) + maxl*5*PI/12 + 4*(sqrt(maxl) - maxl) + 1; 
      }
        
       
   
   
    }
    sumsq = 0.0;
      for (int g = 0; g < step ;g++) {
        sumsq += (addededges.get(g).distance/250000.0);
      }
      float maxl = 0.0;
      if (step > 1) maxl = addededges.get(step - 1).distance/250000.0;  
      float area = (sumsq+maxl*(pointset.size() - step + 1))*PI/4.0;
      fill(0, 0, 255);
      float areab;
      println(maxl);
     
      if(maxl <= 0.25){
        areab = 2*sqrt(maxl) + PI*maxl/4.0 + 1;
      }
      else{
       areab = maxl*sqrt(3) - 1.0/(sqrt(3)) + maxl*5*PI/12 + 4*(sqrt(maxl) - maxl) + 1; 
      }
      fill(0);
      textAlign(RIGHT);
      text("W = " +nf(sumsq,1,3), ws*sle+200, -150);
      text("Area = "+ nf(area,1,3), ws*sle+200,-100);
      text("AreaB = "+nf(areab,1,3), ws*sle+200, -50);  
      println(sumsq);

    
  }
  fill(0, 0, 255);
  strokeWeight(0);
  stroke(0);
  for(int p = 0; p < pointset.size(); p++){
    int x = pointset.get(p).pointdiam;
    ellipse(pointset.get(p).xcoord, pointset.get(p).ycoord, x, x);
  }  
       

  //corner points
  strokeWeight(0);
  fill(0, 0, 255);
  //for (int i = 0; i < pointset.size(); i++) {
  //currentdiam = radii.get(i);
  //pointset.get(i).draw();
  popMatrix();
  if(record){
    endRecord();
    record = false;
    //exit();
  }
}
//ArrayList<spoint> a = Jarvis(pointset);
//fill(255, 0, 0);
//for(int j = 0; j < a.size(); j++){
//  if((a.get(j)).chindex >=0){
//    ellipse(a.get(j).xcoord, a.get(j).ycoord, 15, 15);
//  }
//}





