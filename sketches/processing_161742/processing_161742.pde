
/*
 * Sarah Yablok "Personality Map"
 * ARTD 252 | Winter 2013 | Project 2
 * MW | 6-7:50 PM | CRN#: 21335
 */


PImage bg, p2, intu, per, thi, intro, header, controls;
type[] a1, a2;
PImage imgs[];
int opacity;


void setup() {
  
  size(800, 672);
  bg = loadImage("bg.jpg");
  p2 = loadImage("head.png");
  header = loadImage("header.png");
  controls = loadImage("controls.png");
  imgs = new PImage [8];
  imgs[0] = loadImage("a1-0.png");
  imgs[1] = loadImage("a1-1.png");
  imgs[2] = loadImage("a1-2.png");
  imgs[3] = loadImage("a1-3.png");
  imgs[4] = loadImage("a2-0.png");
  imgs[5] = loadImage("a2-1.png");
  imgs[6] = loadImage("a2-2.png");
  imgs[7] = loadImage("a2-3.png");

  a1 = new type [4];
  a1[0] = new type("introverted", 20, 15, 115, 18);
  a1[1] = new type("intuition", 20, 42, 100, 18);
  a1[2] = new type("thinking", 20, 61, 90, 18);
  a1[3] = new type("judging", 20, 85, 80, 18);
  a2 = new type [4];
  a2[0] = new type("extroverted", 162, 15, 120, 18);
  a2[1] = new type("sensing", 162, 42, 80, 18);
  a2[2] = new type("feeling", 162, 61, 77, 18);
  a2[3] = new type("perception", 162, 85, 110, 18);
  
  opacity = 0;
}

void draw() {
  tint(255, 255, 255, 255);
  image(bg, 0, 0);
  
  for (int i = 0; i < a1.length; i++) {
    if (i != 2 || i != 3) {
      a1[i].mouseOver();
      a1[i].test();
      tint(255, 255, 255, 255);
    }
  }
  
  for (int i = 0; i < a2.length; i++) {
    if (i != 2) {
      a2[i].mouseOver();
      a2[i].test();
      tint(255, 255, 255, 255);
    }
  }
  image(p2, 0, 0);
  image(header, 0, 0);
  tint(255, 255, 255, 255);
  a1[2].mouseOver();
  a1[2].test();
  tint(255, 255, 255, 255);
  a1[3].mouseOver();
  a1[3].test();
  tint(255, 255, 255, 255);
  a2[2].mouseOver();
  a2[2].test();
  tint(255, 255, 255, 255);
  image(controls, 0, 0);
  displayFinal();

}

void mouseClicked() {
  for (int i = 0; i < a1.length; i++) {
      if (a1[i].hover) {
        a1[i].clicked = !a1[i].clicked;
        a2[i].clicked = false;
      }
  }

  for (int i = 0; i < a2.length; i++) {
      if (a2[i].hover) {
        a2[i].clicked = !a2[i].clicked;
        a1[i].clicked = false;
      }
  }
}

boolean test() {
  for(int i = 0; i < a1.length; i++) {
    if (!a1[i].clicked && !a2[i].clicked)
      return false;
  }
  return true;
}

void displayFinal() {
  if (test()) {
    for (int i = 0; i < a1.length; i++) {
      if(a1[i].clicked) {
        image(imgs[i], 340 + (i * 40),  30);
      } else {
        image(imgs[i+4], 340 + (i * 40),  30);
      }
    }
  }
}

  
    
class type {
  PImage rep;
  PImage nav;
  String name;
  int opacity, x, y, w, h;
  Boolean hover, clicked;
  
  type(String name, int x, int y, int w, int h) {
    this.name = name;
    rep = loadImage(name + ".png");
    nav = loadImage("nav-" + name + ".png");
    opacity = 0;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    hover = false;
    clicked = false;
  }
  
  void mouseOver() {
    if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
      hover = true;
      if (!clicked){
        image(nav, 0, 0);
      }
    } else {
      hover = false;
    }
  }
  
  public void clicked() {
      clicked = !clicked;
  }
  
  void test() {
    if (clicked) {
      image(nav, 0, 0);
      tint(255, 255, 255, opacity);
      if (name.equals("intuition"))
        image(rep, 0, 75);
      else
        image(rep, 0, 0);
      if(opacity < 255) opacity += 20;
    } else {
      opacity = 0;
    }
    
  }

}


