
class Button1 {
  int x, y;
  int w, h;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;   
  void pressed() {
    if (over && mousePressed) {
      pressed = true;
      estat = 0;
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
class ImageButtons1 extends Button1 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;
  ImageButtons1(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
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
    } 
    else if (over) {
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







class Button2
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
      estat = 1;
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

class ImageButtons2 extends Button2 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons2(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
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
    } 
    else if (over) {
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






class Button3
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
      estat = 2;
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

class ImageButtons3 extends Button3 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons3(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
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
    } 
    else if (over) {
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







class Button4
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
      estat = 3;
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

class ImageButtons4 extends Button4 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons4(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
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
    } 
    else if (over) {
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






class Button5
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
      estat = 4;
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

class ImageButtons5 extends Button5 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons5(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
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
    } 
    else if (over) {
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







class Button6
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
      estat = 5;
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

class ImageButtons6 extends Button6 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons6(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
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
    } 
    else if (over) {
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






class Button7
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
      estat1 = 1;
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

class ImageButtons7 extends Button7 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons7(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
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
    } 
    else if (over) {
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







class Button8
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
      estat1 = 2;
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

class ImageButtons8 extends Button8 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons8(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
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
    } 
    else if (over) {
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









class Button9
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
      estat1 = 3;
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

class ImageButtons9 extends Button9 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons9(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
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
    } 
    else if (over) {
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






class Button10
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
      estat1 = 4;
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

class ImageButtons10 extends Button10 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons10(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
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
    } 
    else if (over) {
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






class Button11
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
      estat1 = 5;
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

class ImageButtons11 extends Button11 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons11(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
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
    } 
    else if (over) {
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






class Button12
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
      estat1 = 6;
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

class ImageButtons12 extends Button12 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons12(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
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
    } 
    else if (over) {
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







class Button13
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
      estat1 = 7;
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

class ImageButtons13 extends Button13 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons13(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
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
    } 
    else if (over) {
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





class Button14
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
      estat1 = 8;
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

class ImageButtons14 extends Button14 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons14(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
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
    } 
    else if (over) {
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





class Button15
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
      estat1 = 9;
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

class ImageButtons15 extends Button15 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons15(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
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
    } 
    else if (over) {
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







class Button16
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
      estat1 = 10;
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

class ImageButtons16 extends Button16 
{
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage;

  ImageButtons16(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) 
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
    } 
    else if (over) {
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

