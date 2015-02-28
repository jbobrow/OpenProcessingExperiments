


import ddf.minim.AudioPlayer;
import ddf.minim.Minim;
import processing.core.*;

public class AlarmClock extends PApplet {
  int cx, cy;
  float secondsRadius;
  float minutesRadius;
  float hoursRadius;
  float timerRadius;
  float clockDiameter;
  float adjustament;
  float distanceFromTopClock;
  float by;// coord y of the bell 
  BellClock bell;
  TimerLine tl;
  Switch sw;
  float posHourX, posHourY;
  Minim minim;
  Minim minimAC;
  AudioPlayer song;

  void setup() {
    size(400, 400);
    stroke(255);
    smooth();
    cx = width / 2;
    cy = height / 2;
    adjustament = 50;
    int radius = min(width, height) / 2 - (int)adjustament;
    distanceFromTopClock = 10;
    by = cy - radius + distanceFromTopClock;
    secondsRadius = radius * 0.72F;
    minutesRadius = radius * 0.60F;
    hoursRadius = radius * 0.50F;
    timerRadius = radius * 0.60F;
    clockDiameter = radius * 1.8F;

    minim = new Minim (this);
    minimAC = new Minim (this);
    bell = new BellClock();
    tl = new TimerLine();
    sw = new Switch();

    song = minim.loadFile ("clock-ticking-2.mp3");
    song.loop();
  }

  void draw() {
    background(175);
    // Draw the clock background
    fill(80);
    noStroke();
    ellipse(cx, cy, clockDiameter, clockDiameter);

    float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
    float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI)
      - HALF_PI;
    float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2)
      - HALF_PI;

    // Draw the hands of the clock
    stroke(255);
    strokeWeight(1);
    line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
    strokeWeight(2);
    line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
    strokeWeight(4);
    posHourX = cx + cos(h) * hoursRadius;
    posHourY = cy + sin(h) * hoursRadius;
    line(cx, cy, posHourX, posHourY);
    // Draw the minute ticks
    noStroke();
    // clockBell
    bell.display();
    //
    // timerLine
    tl.display();
    tl.ctrlTimer();
    // timerLine
    // switch on/off
    sw.display();

    strokeWeight(2);
    beginShape(POINTS);
    stroke(150, 200);
    for (int a = 0; a < 360; a += 30) {
      float x = cx + cos(radians(a)) * secondsRadius;
      float y = cy + sin(radians(a)) * secondsRadius;
      vertex(x, y);
    }
    endShape();
  }
  void mouseClicked() {
    if (sw.isClickedOn()) sw.on = !sw.on;
    sw.display();
  }
  void stop() {
    song.close();
    minim.stop();
    super.stop();
  }
  // class BellClock	
  class BellClock {
    int l;
    int m;
    AudioPlayer songAC;

    public BellClock() { 
      l=0; 
      m=1;
      songAC = minimAC.loadFile ("alarm-clock-1.mp3");
    }
    public void display() {
      bezier(cx-adjustament, by, cx-adjustament, 0, cx+adjustament, 0, cx+adjustament, by);
    }
    public void ring() {
      songAC.play();
      int i = l%10;
      i = i*m;
      pushMatrix();
      bezier(cx-adjustament - i, by - i, cx-adjustament, 0, cx+adjustament, 0, cx+adjustament+i, by + i);
      popMatrix();
      l++;
      m = m*(-1);
    }

    public void stop() {
      songAC.pause();
    }
  }
  class TimerLine {
    float angle;
    float posPuntaX, posPuntaY;
    public TimerLine() { 
      angle = - PI/2;
      posPuntaX = cx + cos(-PI/2) * timerRadius;
      posPuntaY = cy + sin(-PI/2) * timerRadius;
    }
    public void display() {
      // disegna timer
      strokeWeight(5);
      stroke(150, 200);
      //line(cx, cy, cx, cy - timerRadius);
      if (isClickOn()) {
        posPuntaX = cx + cos(getAngle()) * timerRadius;
        posPuntaY = cy + sin(getAngle()) * timerRadius;
      }
      line(cx, cy, posPuntaX, posPuntaY);
      // disegna timer
    }
    public boolean isClickOn() {
      // controllo di aver centrato la sveglia
      float dx = mouseX;
      float dy = mouseY;
      //println(dx + " - " + dy);
      if (dx>cx - clockDiameter/2 && dx< cx + clockDiameter/2
        && dy>cy - clockDiameter/2 && dy< cy + clockDiameter/2) {
        return true;
      }
      return false;
    }
    public float getAngle() {
      if (!mousePressed) return angle;
      float dx = mouseX - cx;
      float dy = mouseY - cy;
      angle = atan2(dy, dx);  

      return angle;
    }
    public void ctrlTimer() {
      // controllo che l'angolo formato dalla lancetta delle ore == angolo lancetta sveglia
      if (!sw.on) {
        bell.stop();
        return;
      }
      pushMatrix();
      translate(cx, cy);
      float dx = posPuntaX - cx;
      float dy = posPuntaY - cy;
      float beta = atan2(dy, dx);  

      float dhx = posHourX - cx;
      float dhy = posHourY - cy;
      float betah = atan2(dhy, dhx);  

      //println((int) (beta*10) + " - " + (int)(betah*10));
      popMatrix();
      if ((int) (beta*10)==(int) (betah*10)) {
        bell.ring();
      } 
      else {
        bell.stop();
      }
    }
  }
  class Switch {
    Boolean on;
    float sX, sY; 
    float lato;
    PFont pf;
    final static String ACCESA = "isON";
    final static String SPENTA = "isOFF";

    public Switch() {
      on = false;
      sX = cx-20;
      sY = height-50;
      lato = 40;
      pf = createFont("Arial", 12, true);
    }
    public void display() {
      textFont(pf);
      if (sw.isOn())
        sw.displayClicked();
      else 
        sw.displayNoClicked();
    }
    public boolean isOn() {
      return on;
    }
    public boolean isClickedOn() {
      if (mouseX >sX && mouseX < sX + lato
        && mouseY >sY && mouseX < sY + lato) {
        return true;
      }
      return false;
    }
    public void displayNoClicked() {
      noStroke();
      fill(200);
      rect(sX, sY, lato, lato);
      fill(0);
      text(isOn()?ACCESA:SPENTA, sX + lato + 10, sY+lato/2);
    }
    public void displayClicked() {
      noStroke();
      fill(150);
      rect(sX, sY, lato, lato);
      fill(0);
      text(isOn()?ACCESA:SPENTA, sX + lato + 10, sY+lato/2);
    }
  }
}


