
class Envelope extends AudioFilter {
  
  //display settings
  int myWidth = 200;
  int myHeight = 100;
  int x = width - 250;
  int y = 30;
  float controlDiameter = 8; //diameter of control circles
  boolean enabled = true;
  
  PVector[] controlPoints = new PVector[5];
  EPoint[] ePoints = new EPoint[5];
  krister.Ess.Envelope essEnvelope;
  
  private int selected = -1;
  
  Envelope(float startAmp, float attackTime, float attackAmp, float decayTime, float decayAmp, float susTime, float endAmp) {
    ePoints[0] = new EPoint(0, startAmp);
    ePoints[1] = new EPoint(attackTime, attackAmp);
    ePoints[2] = new EPoint(decayTime, decayAmp);
    ePoints[3] = new EPoint(susTime, decayAmp);
    ePoints[4] = new EPoint(1, endAmp);
    essEnvelope = new krister.Ess.Envelope(ePoints);
    controlPoints[0] = new PVector(x, y + myHeight - startAmp*myHeight);
    controlPoints[1] = new PVector(x + myWidth*attackTime, y + myHeight - attackAmp*myHeight);
    controlPoints[2] = new PVector(x + myWidth*decayTime, y + myHeight - decayAmp*myHeight);
    controlPoints[3] = new PVector(x + myWidth*susTime, controlPoints[2].y);
    controlPoints[4] = new PVector(x + myWidth, y + myHeight - endAmp*myHeight);
  }
  
  /*
   The following methods translate an x and y position to an the amp and time percentages for
   attack, decay, sustain, and release, as well as limiting the dragging
   to the envelope window.
  */
  
  void setStartAmp(PVector start) {
    start.y = bound(start.y, y, y + myHeight);
    controlPoints[0].set(x, start.y, 0);
    ePoints[0] = new EPoint(0, map(controlPoints[0].y, y, y + myHeight, 1, 0));
  }
  
  void setAttack(PVector attack) {
    attack.x = bound(attack.x, x, controlPoints[2].x);
    attack.y = bound(attack.y, y, y + myHeight);
    controlPoints[1].set(attack.x, attack.y, 0);
    ePoints[1] = new EPoint(map(controlPoints[1].x, x, x + myWidth, 0, 1), map(controlPoints[1].y, y, y + myHeight, 1, 0));
  }
  
  void setDecay(PVector decay) {
    decay.x = bound(decay.x, controlPoints[1].x, controlPoints[3].x);
    decay.y = bound(decay.y, y, y + myHeight);
    controlPoints[2].set(decay.x, decay.y, 0);
    controlPoints[3].y = controlPoints[2].y;
    float time = map(controlPoints[2].x, x, x + myWidth, 0, 1);
    float amp = map(controlPoints[2].y, y, y + myHeight, 1, 0);
    ePoints[2] = new EPoint(time, amp);
    ePoints[3] = new EPoint(ePoints[3].t, amp);
  }
  
  void setSustain(PVector sustain) {
    sustain.x = bound(sustain.x, controlPoints[2].x, x + myWidth);
    sustain.y = bound(sustain.y, y, y + myHeight);
    controlPoints[3].set(sustain.x, sustain.y, 0);
    controlPoints[2].y = controlPoints[3].y;
    float time = map(controlPoints[3].x, x, x + myWidth, 0, 1);
    float amp = map(controlPoints[3].y, y, y + myHeight, 1, 0);
    ePoints[3] = new EPoint(time, amp);
    ePoints[2] = new EPoint(ePoints[2].t, amp);
  }
  
  void setEndAmp(PVector end) {
    end.y = bound(end.y, y, y + myHeight);
    controlPoints[4].set(x + myWidth, end.y, 0);
    ePoints[4] = new EPoint(1, map(controlPoints[4].y, y, y + myHeight, 1, 0));
  }
  
  /*
     Called for every draw event, to check which, if any, control points are
     being moved, and to update the envlope accordingly
  */
  void update() {
    if (selected != -1 && mousePressed) {
      PVector mouseVec = new PVector(mouseX, mouseY);
      switch(selected) {
        case 0: setStartAmp(mouseVec); break;
        case 1: setAttack(mouseVec); break;
        case 2: setDecay(mouseVec); break;
        case 3: setSustain(mouseVec); break;
        case 4: setEndAmp(mouseVec); break;
      }
      essEnvelope = new krister.Ess.Envelope(ePoints);
    }
  }
  
  void draw() {
    //check if control points are being dragged
    update();
    fill(255);
    text("Grain Envelope", x + 22, y - 7);
    // draw display rectangle
    stroke(255);
    fill(0,0, 80, 180);
    rect(x, y, myWidth, myHeight);
    
    // draw lines between control points
    noFill();
    beginShape();
    for (PVector vec : controlPoints) {
      vertex(vec.x, vec.y);
    }
    endShape();
    // fill the ADSR sections with different colors
    noStroke();
    fillADSR(0, color(0,255,0,120), "A");
    fillADSR(1, color(255,165,0,200), "D");
    fillADSR(2, color(0, 0, 255, 180), "S");
    fillADSR(3, color(160, 32, 240, 220), "R");
    // draw control points
    for (PVector vec : controlPoints) {
      if (selected != -1 && controlPoints[selected].equals(vec))
        fill(255,0,0);
      else
        fill(255);
      ellipse(vec.x, vec.y, controlDiameter, controlDiameter);
    }
  }

  void fillADSR(int cp, int c, String t) {
    fill(c);
    beginShape();
    vertex(controlPoints[cp].x, y + myHeight);
    vertex(controlPoints[cp].x, controlPoints[cp].y);
    vertex(controlPoints[cp+1].x, controlPoints[cp+1].y);
    vertex(controlPoints[cp+1].x, y + myHeight);
    endShape();
    text(t, (controlPoints[cp].x + controlPoints[cp+1].x)/2, y + myHeight + 20);
  }
 
  /* Check if the mouse is over the envelope window, or the surrounding buttons */
  boolean isMouseOver() {
    if (mouseX > x - 40 && mouseX < x + myWidth + 5 && mouseY > 0 && mouseY < y + myHeight + 65)
      return true;
    else
      return false;
  } 
  
  void toggle() { enabled = !enabled; }
  
  krister.Ess.Envelope getEnvelope() {
    return essEnvelope;
  }
}

/* Basic mathematical bound of num to a min and max */
float bound(float num, float min, float max) {
  if (num < min)
    return min;
  else if (num > max)
    return max;
  else
    return num;
}

