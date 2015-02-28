
int POINTS = 10;
int MIN_PERIOD_THRSD = 30;
int MIN_PERIOD = 20;
int MAX_PERIOD = 80;
int CONVERGENCE_C= 4;


Applause[] apps = new Applause[POINTS];

void setup() {
  size(500, 500);
  background(0); 
  smooth();

  for (int i=0; i<apps.length; i++){
    apps[i] = new Applause(random(0, width), random(0, height), (int) random(MIN_PERIOD, MAX_PERIOD));
   println("app "+i+" "+apps[i].period); 
  }

}

void draw() {
  fill(0, 30);
  noStroke();
  rect(0, 0, width, height);

  for (int i=0; i<apps.length; i++) {

    //Loose sync if the sync drifts away
    if ((apps[i].engaging != null) &&
      (abs(apps[i].period-apps[i].engaging.period) > MIN_PERIOD_THRSD)) {
      apps[i].engaging = null;
    }

    //Check who to sync with
    if (apps[i].engaging == null) {
      for (int j=0; j<apps.length; j++) {
        if (i!= j) {
          if ( abs(apps[i].period-apps[j].period) < MIN_PERIOD_THRSD) {
            apps[i].engaging = apps[j];
            break;
          }
        }
      }
    }

    //If synching, synch
    if (apps[i].engaging != null) {
      apps[i].sync();
      stroke(80);
      strokeWeight(3);
      line(apps[i].x, apps[i].y, apps[i].engaging.x, apps[i].engaging.y);
    }
    apps[i].display();
  }
}


class Applause {
  float x, y;
  int period;
  int count;
  Applause engaging;

  Applause(float x, float y, int period) {
    this.x = x;
    this.y = y;
    this.period = period;
    count = 0;
  }

  void sync() {
    if (! synced()) {
      //When it hears a clap
      if (engaging.count == 0) {
        //Converge period
        period = period - ((period - engaging.period) /CONVERGENCE_C);
        //Sync the clap
        //count = count -((count-engaging.count) /CONVERGENCE_C);
        if (abs(period-engaging.period)<CONVERGENCE_C) {
          //Let's use exaclty the same freq.
          period = engaging.period;
          count = period-1;
          println("engaged at "+period);
        }
      }
    }
  }

  boolean synced() {
    if (engaging != null) {
      if (abs(period-engaging.period)==0)
        return true;
    }
    return false;
  }

  void display() {
    count ++;
    if (count >= period) {
      count = 0;
      noStroke();
      fill(200);
      ellipse(x, y, 30, 30);
    }
    else {
      noStroke();
      if ((engaging!= null) && !synced()) {
        fill(100, 30, 30);
      }
      else {
        fill(100);
      }
      ellipse(x, y, 15, 15);
    }
  }
}
