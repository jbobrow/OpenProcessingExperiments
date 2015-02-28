
// NOTE: time of freezes is relative to original time of loop.  once there is more than one freeze, 
//    subsequent freeze times could be updated to reflect actual time

float tLoop = 5.0;                // time of loop
float[] tFreeze = { 
  1.0, 3.0 };                     // time of freezes
float freezeDur = 1.5;            // duration of each freeze
float freezeDurTotal;             // total duration of freezes
float phase = 0.0;                // equation time offset
float t = 0.0;                    // time (sec.)

void setup() {
  size(500,500,JAVA2D);  
  smooth();
  frameRate(30);
  strokeWeight(1);
  stroke(255);
  rectMode(CENTER);

  freezeDurTotal = tFreeze.length * freezeDur;
}

void draw() {
  background(0);

  drawTimeline(t);

  //println(nf(t-phase,1,2));
  equation(t-phase);

  for (int i=0; i<tFreeze.length; i++) {
    if (t >= tFreeze[i] && t < tFreeze[i]+freezeDur) {
        phase += 1/30.0;
    }
  }

  t += 1/30.0;

  if (t > (tLoop+freezeDurTotal)) {
    //println("loop: "+t+" / "+(tLoop+freezeDurTotal));
    phase = 0;
    t = 0;
  }
}

void equation(float _x) {
  // rect expands continuously, freezing at freeze points for freezeDur seconds
  rect(150,75, _x*30, _x*30); 
}

void drawTimeline(float _t) {
  // horizontal lines = freeze durations, vertical marks are original and offset loop points
  
  // original loop point
  stroke(75);
  line(tLoop*30, 195, tLoop*30, 205);

  // freeze times
  for (int i=0; i<tFreeze.length; i++) {
    line(tFreeze[i]*30, 200, (tFreeze[i]+freezeDur)*30, 200);
  }
  // new loop point
  stroke(255);
  line((tLoop+freezeDurTotal)*30, 195, (tLoop+freezeDurTotal)*30, 205);  

  // current time mark
  ellipse(_t*30, 200, 10,10);  
}

