
Bouncer bouncer = new Bouncer(); 

int objectPos, objectYSize, target;

void setup() {
  size(400, 400);
  frameRate(120);  
  objectPos = height / 2;
  objectYSize = 100;
  target = height / 4;
}
void draw() {
  bouncer.load(objectPos, objectYSize, target);
  objectPos = bouncer.objectPos;

  background(255);  
  rectMode(CENTER);

  // ombreggiatura
  stroke(0, 100);
  strokeWeight(5);
  rect(width / 2 + 2, objectPos + 2, width / 1.03 - 4, objectYSize - 5, 7);

  fill(#1AB0FF);
  noStroke();
  rect(width / 2, objectPos, width / 1.03, objectYSize, 7);
  textAlign(CENTER, CENTER);

  fill(255);
  textSize(15);
  text("Scheda di testo stile Windows Phone", width / 2, objectPos);
}

void mouseReleased() {
  bouncer.motion = true;
  bouncer.start = true;
  target = mouseY;
}

class Bouncer {

  int objectPos, objectYSize, target, targetBackup, speed, cuscinetto;
  boolean motion, start, frozen, frozen2, frozen3, up, down, upper;

  Bouncer() {
    speed = 2;
    cuscinetto = 10;
    motion = true;
    start = true;
  }

  void load(int objPos, int objYSize, int tgt) {
    
    if (start) {
      objectPos = objPos;
      objectYSize = objYSize;
      target = tgt;

      if (objectPos > target)
        target = target + objectYSize / 2; // se upper
      else {
        target = target - objectYSize / 2; // else
      }
      targetBackup = target;
    }

    if (motion && start) {
      if (objectPos > target)
        upper = true;
      if (objectPos < target)
        upper = false;
      start = false;
    }


    if (motion) {
      if (objectPos > target - cuscinetto / 2) 
        up = true;
      else {
        up = false;
      }
      if ( objectPos < target + cuscinetto / 2) 
        down = true;
      else {
        down = false;
      }

      if (up) {
        if (objectPos > target) {
          objectPos-= speed;
        } else {
          frozen = true;
        }
      }
      if (down) {
        if (objectPos < target) {
          objectPos+= speed;
        } else {
          frozen = true;
        }
      }

      if (upper) {
        if (frozen && !frozen2) {
          target --;
        }
        if (target == targetBackup - cuscinetto || frozen2) {
          frozen2 = true;
          target++;
        }
        if (target == targetBackup + cuscinetto) {
          frozen2 = false;
          frozen3 = true;
          target--;
        }
      }

      if (!upper) {
        if (frozen && !frozen2) {
          target ++;
        }
        if (target == targetBackup + cuscinetto || frozen2) {
          frozen2 = true;
          target--;
        }
        if (target == targetBackup - cuscinetto) {
          frozen2 = false;
          frozen3 = true;
          target++;
        }
      }
    }

    if (target == targetBackup && frozen3) {
      motion = false;      
      start = true;
      frozen = false;
      frozen2 = false;
      frozen3 = false;
    }
  }
}


