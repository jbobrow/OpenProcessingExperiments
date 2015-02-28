
/*
  circlesuccession

  this applet will draw a succession of circles, each in a random direction, slowly turning from black to red
  i've written this to learn how arrays work and found that it's quite addictive to watch ;]

  -- 03-12-2010 totalwormage
*/

/* arrays in which we will store the position, colour and size of circles */
int[] x = new int[1];
int[] y = new int[1];
int[] c = new int[2];
float[] s = new float[1];
/* minimum and maximum size of circles */
float s_min;
float s_max = 80;
float angle;
PVector pos, pos_temp;
/* 'couldbe', 'cannot' and loopcounter respectively */
int zouKunnenCounter, kanNietCounter, loopCount;
boolean waitForInput;

void setup() {
  size(800,600);
  background(50,50,190);
  frameRate(20);
  smooth();
  /* create the first circle at a random point, semi-random size, with black colour */
  x[0] = int(random(1,width-1));
  y[0] = int(random(1,height-1));
  s[0] = int(random(60,int(s_max)));
  /* i don't know why, but sometimes the script screws up at the start resulting in an outofbounds error
  an ugly fix for this is to have a longer colour array */
  c[0] = 0;
  c[1] = 0;
  noStroke();
  fill(c[1],0,0);
  ellipse(x[0],y[0],s[0],s[0]);
}

void draw() {
  /* this is the 'waitForInput indicator', normally invisible */
  fill(50,50,190);
  rect(0,0,10,10);
  zouKunnenCounter = 0;
  /* pick a random angle in which to grow */
  angle = random(0,TWO_PI);
  /* make room in position, size and colour arrays for the next circle */
  x = expand(x,x.length+1);
  y = expand(y,y.length+1);
  s = expand(s,s.length+1);
  c = expand(c,c.length+1);
  /* if the size of the circles becomes too small, stop drawing them and wait for user input */
  if (s[s.length-2] < 3) {
    waitForInput = true;
    loopCount++;
    x = expand(x,x.length+1);
    y = expand(y,y.length+1);
    s = expand(s,s.length+1);
    c = expand(c,c.length+1);
    /* let the user know we're waiting for input by showing a green rect at the top left corner */
    fill(0,220,0);
    rect(0,0,10,10);
    noLoop();
  } else {
    /* the min and max size of the next circle is within a range of the previous circle's size */
    s_min = s[s.length-2]*0.9;
    s[s.length-1] = int(random(s_min,s[s.length-2]*1.1));
    /* move to the last drawn circle position and pick a position for the next one */
    pushMatrix();
    translate(x[x.length-2],y[y.length-2]);
    x[x.length-1] = int(x[x.length-2] + s[s.length-2] * cos(angle)+1);
    y[y.length-1] = int(y[y.length-2] + s[s.length-2] * sin(angle)+1);
    popMatrix();
    /* store that position in a PVector */
    pos = new PVector(x[x.length-1],y[y.length-1]);
    /* now we go throught every circle, using the x array as a counter */
    for(int i = 0; i < x.length-1; i++) {
      /* store each circle's position in a temporary PVector */
      pos_temp = new PVector(x[i],y[i]);
      /* if the distance between the next circle's radius and already drawn circle's radius is big enough for the two not to overlap
      and we're not outside the canvas we add 1 to the couldbecounter */
      if(pos_temp.dist(pos) >= s[i] / 2 + s[s.length-1] / 2 - 1 && pos.x > 0 && pos.y > 0 && pos.x < width && pos.y < height) {
        zouKunnenCounter++;
      } else {
        /* otherwise we add 1 to the cannotcounter, draw a transparant circle on that position, and break this loop */
        kanNietCounter++;
        fill(40,220,40,10);
        noStroke();
        ellipse(x[x.length-1],y[y.length-1],s[s.length-1],s[s.length-1]);
        /* delete the 'invalid' position from all arrays */
        x = shorten(x);
        y = shorten(y);
        s = shorten(s);
        c = shorten(c);
        break;
      }
    }
    /* when the couldbecounter equals the length of the x array there's no overlap whatsoever, we can draw a circle here! \o/ */
    if (zouKunnenCounter == x.length-1) {
      kanNietCounter = 0;
      c[c.length -1] = c[c.length-2] + 1; // this one used to cause the outofboundserror >_<
      fill(c[c.length -1],0,0);
      ellipse(x[x.length-1],y[y.length-1],s[s.length-1],s[s.length-1]);
    }

    /* if we've tried 80 times to draw a circle and failed there probably isn't room to draw another circle from this point */
    if (kanNietCounter >= 80) {
      kanNietCounter = 0;
      loopCount++;
      /* if we're stuck and the user has restarted the circledrawing process 5 times OR if we've reached pure red
      draw some nice lines between circles that are close to eachother for no apparent reason and end the applet */
      if (loopCount >= 5 || zouKunnenCounter >= 255) {
        noLoop();
        for (int i = x.length-1; i > 0; i--) {
          pos = new PVector(x[i],y[i]);
          for (int j = x.length-1; j > 0; j--) {
            pos_temp = new PVector(x[j],y[j]);
            if (pos_temp.dist(pos) < s[i] * 1.5) {
              stroke(255,70);
              line(pos.x,pos.y,pos_temp.x,pos_temp.y);
            }
          }
        }
      } else {
        /* if we're stuck but pure red hasn't been reached or we haven't 'rebooted' 5 times
        we're going to make room for a new starting point and wait for input */
        x = expand(x,x.length+1);
        y = expand(y,y.length+1);
        s = expand(s,s.length+1);
        c = expand(c,c.length+1);
        waitForInput = true;
        fill(0,220,0);
        rect(0,0,10,10);
        noLoop();
      }
    }
  }
}
/* if we're waiting for input and the user has clicked on a circle we make that our new starting point */
void mouseClicked() {
  if (waitForInput) {
    pos = new PVector(mouseX,mouseY);
    for (int i = 0; i < x.length-3; i++) {
      pos_temp = new PVector(x[i],y[i]);
      if (pos_temp.dist(pos) < s[i]/2) {
        x[x.length-1] = int(pos_temp.x);
        y[y.length-1] = int(pos_temp.y);
        s[s.length-1] = s[i];
        c[c.length-1] = c[i];
        waitForInput = false;
        loop();
      }
    }
  }
}

