
/*
  Copyright (C) 2007 Andre Seidelt, All Rights Reserved.

  This software is provided 'as-is', without any express or implied warranty.
  In no event will the authors be held liable for any damages arising from the
  use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software in
     a product, an acknowledgment in the product documentation would be
     appreciated but is not required.

  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.

  3. This notice may not be removed or altered from any source distribution.
*/
int SIZE = 300;
int MAX_AGE = 1024;
int MAX_BACTERIA = 800;

HashSet bact = new HashSet();
ArrayList newBact = new ArrayList();

void setup()
{
  size(SIZE, SIZE);
  strokeWeight(4.0);
  strokeCap(ROUND);
  noSmooth();
  ellipseMode(CENTER);  
  background(0);
}

synchronized void draw()
{
  Bact[][] sexMap = new Bact[SIZE][SIZE];

  newBact.clear();

  Iterator it = bact.iterator();
  while(it.hasNext()) {
    Bact b = (Bact) it.next();
    Bact child = b.live(it, sexMap);
    if(child != null) {
      newBact.add(child);
    }
  }

  bact.addAll(newBact);
  background(0);

  it = bact.iterator();
  while(it.hasNext()) {
    Bact b = (Bact) it.next();
    b.paint();
  }
}

synchronized void mousePressed() {
  if (mouseButton == LEFT) {
    Bact b = new Bact(mouseX, mouseY);
    bact.add(b);
  } 
  else   if (mouseButton == RIGHT) {
    Bact b = new Bact(mouseX, mouseY);
    b.ill = true;
    bact.add(b);
  }
}

class Bact {
  int age;
  int x, y;
  boolean male;
  boolean ill;

  // random position
  Bact() {
    this(
    int(random(0,SIZE)),
    int(random(0,SIZE)));
  }

  // given position
  Bact(int pX, int pY) {
    age = 0;
    x = pX;
    y = pY;
    male = int(random(0,2)) == 0;
    ill = false;
  }

  public synchronized Bact live(Iterator it, Bact[][] sexMap) {
    Bact ret = null;

    if(age < MAX_AGE) {
      // live
      if(ill && isMature()) {
        age+=5;
      } 
      else{
        age++;
      }

      // move
      x += int(random(1,4)) - 2;
      y += int(random(1,4)) - 2;
      if(x < 0) {
        x = 0;
      } 
      else if(x >= SIZE) {
        x = SIZE-1;
      }
      if(y < 0) {
        y = 0;
      } 
      else if(y >= SIZE) {
        y = SIZE-1;
      }

      // have sex if we are mature and there is a partner of the other sex
      if(isMature()) {
        if((sexMap[x][y] != null) && (sexMap[x][y].male != this.male)) {
          if(bact.size() < MAX_BACTERIA) {
            ret = new Bact(x, y);
            if(this.ill || sexMap[x][y].ill) {
              ret.ill = true;
            }
          }
        }
        sexMap[x][y] = this;
      }
    }
    else {
      // die
      it.remove();
    }

    return ret;
  }

  public boolean isMature() {
    return age > 255;
  }

  public void paint() {
    int g = 255 - age;
    if(g < 0) {
      g = 0;
    }
    if(ill) {
      stroke(male?255:128, g, male?128:255);
    } else {
      stroke(male?255:0, g, male?0:255);
    }
    point(x, y);
  }
}

