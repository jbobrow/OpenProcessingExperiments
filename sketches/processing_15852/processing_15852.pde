
float x = 300;
float y = 300;
float dx = 3;
float dy = -5;
int t;
int count=0;
int points=0;

float heightbounce=600;

// beginners level
boolean[][] inside=new boolean[1][11];

void setup() {
  size(600,600);
  frameRate(60);
  smooth();
  PFont font;
  font = loadFont("AgencyFB-Reg-48.vlw"); 
  textFont(font);
}


void draw() {
  // t=0 to start new level
  if(t==0) {
    background(0);
    stroke(255);

    // Display Level the first 2 seconds
    if (count<120) {
      fill(255);
      textAlign(CENTER);
      text("LEVEL " + inside.length, 300, 500);
    }

    //draw moving point
    strokeWeight(10);
    point(x,y);
    strokeWeight(1);

    randomSeed(1);
    // box to be destroied
    for (int j=0;j<inside.length;j++) {
      for (int k=0;k<inside[0].length;k++) {
        // distance between circles and moving point
        float dx2=50+50*k-x;
        float dy2=50+50*j-y;
        float dis2=sqrt(pow(dx2,2)+pow(dy2,2));
        
        // draw circle if outside
        if (dis2>=25. && inside[j][k]==false) {
          //fill(0,255-k*10,200,150);
          fill(255,random(255));
          ellipse(50+50*k,50+50*j,50,50);
        }
        // check if moving point are inside circle and from which direction it comes 
        else if (dx2<=(dis2*cos(PI/4))&& dy2<=-(dis2*sin(PI/4)) && inside[j][k]==false) {
          dy*=-1;
          inside[j][k]=true;
          points++;
        }
        else if (dx2<=(dis2*cos(PI/4)) && dy2>=(dis2*sin(PI/4)) && inside[j][k]==false) {
          dy*=-1;
          inside[j][k]=true;
          points++;
        }
        else if (dy2<=(dis2*sin(PI/4)) && dx2<=-(dis2*cos(PI/4)) && inside[j][k]==false) {
          dx*=-1;
          inside[j][k]=true;
          points++;
        }
        else if (dy2<=(dis2*sin(PI/4)) && dx2>=(dis2*cos(PI/4)) && inside[j][k]==false) {
          dx*=-1;
          inside[j][k]=true;
          points++;
        }
      }
    }

    // bounce ball at y position of mouse
      heightbounce=mouseY;

    //Bar to bounce ball on
    float barsize=75.;
    strokeWeight(3);
    line(mouseX-barsize,heightbounce,mouseX+barsize,heightbounce);
    strokeWeight(1);

    // change direction if moving point hits boundaries
    if (x>=width || x<=0) {
      dx*=-1;
    }
     if (y<=0) {
      dy*=-1;
    }
    // change direction if moving point hits bar depending on where the point came from
    if (y>=heightbounce && y<heightbounce+10) {
      //left part - left left - get more horisontal
      if (x>(mouseX-barsize) && x< (mouseX-(1./3)*barsize) && dx>0 && dy>0) {
        dy*=-0.95;
        dx*=-1.05;
      }
      //left part - right left - get more horisontal
      else if (x>(mouseX-barsize) && x< (mouseX-(1./3)*barsize) && dx<0 && dy>0) {
        dy*=-0.95;
        dx*=1.05;
      }
      //right part - left right - get more horisontal
      else if (x>(mouseX+(1./3)*barsize) && x< (mouseX+barsize) && dx>0 && dy>0) {
        dy*=-0.95;
        dx*=1.05;
      }
      //right part - right right - get more horisontal
      else if (x>(mouseX+(1./3)*barsize) && x< (mouseX+barsize) && dx<0 && dy>0) {
        dy*=-0.95;
        dx*=-1.05;
      }
      //middle part - just bounce - get more vertical
      else if (x>(mouseX-(1./3)*barsize) && x< (mouseX+(1./3)*barsize) && dy>0) {
        dy*=-1.05;
        dx*=0.95;
      }
    }


    //Print points
    textAlign(RIGHT);
    fill(255);
    text(points, 550, 550);

    //GAME OVER
    if (y>height) {
      t=1;
      fill(255);
      textAlign(CENTER);
      text("GAME OVER", 300, 300);
      text("CLICK TO RESTART GAME", 300, 400);
      text("PRESS SPACE TO RESTART LEVEL", 300, 500);
    }

    //Finished
    if (checkinside()) {
      t=2;
      fill(255);
      textAlign(CENTER);
      text("FINISHED", 300, 300);
      text("CLICK FOR NEXT LEVEL", 300, 400);
    }

    // incrementing moving point
    x=x+dx;
    y=y+dy;

    count++;
  }
  // end of t=0
  
  // if game over
  else if(t==1) {

    x = 300;
    y = 300;
    dx = 3;
    dy = -5;
    count=0;
    points=0;
    if(mousePressed==true) {
      t=0;
      inside=new boolean[inside.length][inside[0].length];
    }
    if(keyPressed) {
      if (key == ' ') {
        t=0;
        inside=new boolean[1][11];
      }
    }
  }
  
  // if level compleated
  else {
    x = 300;
    y = 300;
    dx = 3;
    dy = -5;
    count=0;
    if(mousePressed==true) {
      t=0;
      inside=new boolean[inside.length+1][inside[0].length];
    }
  }
}


// Return true when all values are true - no false values left in array 
boolean checkinside() {
  for (int j=0;j<inside.length;j++) {
    for (int k=0;k<inside[0].length;k++) {
      if (inside[j][k] == false) {
        return false;
      }
    }
  }
  return true;
}


