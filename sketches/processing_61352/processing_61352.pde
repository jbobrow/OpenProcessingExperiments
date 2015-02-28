
class Button
{
  int x, y;
  int w, h;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;   

  void pressed() {
    if (over && mousePressed) {
      pressed = true;
    } 
    else {
      pressed = false;
    }
  }

  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class LowPassButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  LowPassButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    down = idown;
    currentimage = base;
  }

  void update() 
  {
    over();
    pressed();
    if (pressed && !groove.hasEffect(lpfilter)) {
      currentimage = down;
      groove.addEffect(lpfilter);
    } 
    else  if (over) {
      currentimage = roll;
    } 
    else {
      currentimage = base;
    }
  }

  void over() 
  {
    if ( overRect(x, y, w, h) ) {
      over = true;
    } 
    else {
      over = false;
    }
  }

  void display() 
  {
    image(currentimage, x, y);
  }
}

class NormalButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  NormalButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    down = idown;
    currentimage = base;
  }

  void update() 
  {
    over();
    pressed();
    if (pressed) {
      currentimage = down;
      groove.removeEffect(lpfilter);
    } 
    else  if (over) {
      currentimage = roll;
    } 
    else {
      currentimage = base;
    }
  }

  void over() 
  {
    if ( overRect(x, y, w, h) ) {
      over = true;
    } 
    else {
      over = false;
    }
  }

  void display() 
  {
    image(currentimage, x, y);
  }
}

class ohohButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ohohButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    down = idown;
    currentimage = base;
  }

  void update() 
  {
    over();
    pressed();
    if (pressed) {
      currentimage = down;
      AudioSamples[3][1].trigger();
    } 
    else  if (over) {
      currentimage = roll;
    } 
    else {
      currentimage = base;
    }
  }

  void over() 
  {
    if ( overRect(x, y, w, h) ) {
      over = true;
    } 
    else {
      over = false;
    }
  }

  void display() 
  {
    image(currentimage, x, y);
  }
}

class bubbleButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  bubbleButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    down = idown;
    currentimage = base;
  }

  void update() 
  {
    over();
    pressed();
    if (pressed) {
      currentimage = down;
      AudioSamples[3][2].trigger();
    } 
    else  if (over) {
      currentimage = roll;
    } 
    else {
      currentimage = base;
    }
  }

  void over() 
  {
    if ( overRect(x, y, w, h) ) {
      over = true;
    } 
    else {
      over = false;
    }
  }

  void display() 
  {
    image(currentimage, x, y);
  }
}

class baaButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  baaButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    down = idown;
    currentimage = base;
  }

  void update() 
  {
    over();
    pressed();
    if (pressed) {
      currentimage = down;
      AudioSamples[3][3].trigger();
    } 
    else  if (over) {
      currentimage = roll;
    } 
    else {
      currentimage = base;
    }
  }

  void over() 
  {
    if ( overRect(x, y, w, h) ) {
      over = true;
    } 
    else {
      over = false;
    }
  }

  void display() 
  {
    image(currentimage, x, y);
  }
}

class carButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  carButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    down = idown;
    currentimage = base;
  }

  void update() 
  {
    over();
    pressed();
    if (pressed) {
      currentimage = down;
      AudioSamples[4][1].trigger();
    } 
    else  if (over) {
      currentimage = roll;
    } 
    else {
      currentimage = base;
    }
  }

  void over() 
  {
    if ( overRect(x, y, w, h) ) {
      over = true;
    } 
    else {
      over = false;
    }
  }

  void display() 
  {
    image(currentimage, x, y);
  }
}

class laserButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  laserButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    down = idown;
    currentimage = base;
  }

  void update() 
  {
    over();
    pressed();
    if (pressed) {
      currentimage = down;
      AudioSamples[4][2].trigger();
    } 
    else  if (over) {
      currentimage = roll;
    } 
    else {
      currentimage = base;
    }
  }

  void over() 
  {
    if ( overRect(x, y, w, h) ) {
      over = true;
    } 
    else {
      over = false;
    }
  }

  void display() 
  {
    image(currentimage, x, y);
  }
}



class duckButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  duckButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    down = idown;
    currentimage = base;
  }

  void update() 
  {
    over();
    pressed();
    if (pressed) {
      currentimage = down;
      AudioSamples[4][3].trigger();
    } 
    else  if (over) {
      currentimage = roll;
    } 
    else {
      currentimage = base;
    }
  }

  void over() 
  {
    if ( overRect(x, y, w, h) ) {
      over = true;
    } 
    else {
      over = false;
    }
  }

  void display() 
  {
    image(currentimage, x, y);
  }
}

class volumeupButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  volumeupButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    down = idown;
    currentimage = base;
  }

  void update() 
  {
    over();
    pressed();
    if (pressed) {
      currentimage = down;
      v+=1;
      if (v>=20) {
        v=20;
      }
      groove.setGain(v);
    } 
    else  if (over) {
      currentimage = roll;
    } 
    else {
      currentimage = base;
    }
  }

  void over() 
  {
    if ( overRect(x, y, w, h) ) {
      over = true;
    } 
    else {
      over = false;
    }
  }

  void display() 
  {
    image(currentimage, x, y);
  }
}

class volumedownButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  volumedownButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    down = idown;
    currentimage = base;
  }

  void update() 
  {
    over();
    pressed();
    if (pressed) {
      currentimage = down;
      v-=1;
      if (v<=0) {
        v=0;
      }
      groove.setGain(v);
    } 
    else  if (over) {
      currentimage = roll;
    } 
    else {
      currentimage = base;
    }
  }

  void over() 
  {
    if ( overRect(x, y, w, h) ) {
      over = true;
    } 
    else {
      over = false;
    }
  }

  void display() 
  {
    image(currentimage, x, y);
  }
}

class scratchButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  scratchButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    down = idown;
    currentimage = base;
  }

  void update() 
  {
    over();
    pressed();
    if (pressed) {
      currentimage = down;
      groove.addEffect(reffect);
    } 
    else  if (over) {
      currentimage = roll;
    } 
    else {
      currentimage = base;
    }
  }

  void over() 
  {
    if ( overRect(x, y, w, h) ) {
      over = true;
    } 
    else {
      over = false;
    }
  }

  void display() 
  {
    image(currentimage, x, y);
  }
}

class scratchstopButtons extends Button 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  scratchstopButtons(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
  {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    base = ibase;
    roll = iroll;
    down = idown;
    currentimage = base;
  }

  void update() 
  {
    over();
    pressed();
    if (pressed) {
      currentimage = down;
      groove.removeEffect(reffect);
    } 
    else  if (over) {
      currentimage = roll;
    } 
    else {
      currentimage = base;
    }
  }

  void over() 
  {
    if ( overRect(x, y, w, h) ) {
      over = true;
    } 
    else {
      over = false;
    }
  }

  void display() 
  {
    image(currentimage, x, y);
  }
}



