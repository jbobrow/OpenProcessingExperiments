
/* @pjs preload="blower.gif, scissors.gif, wand.gif, blonde.gif, red.gif, rainbow.gif, black.gif, comb.gif"; */

//sprites from https://www.iconfinder.com/icons/169903/magic_wand_icon#size=128,
//https://www.iconfinder.com/icons/300948/beauty_blower_hair_hairdresser_hairdryer_icon#size=128,
//https://www.iconfinder.com/icons/174963/scissors_icon#size=32

static int detailLvl = 1;

boolean ItemActivated;
boolean ItemHeld;

Object hairBlower;
Object scissor;
Object grower;
Object comb;

Object blond;
Object red;
Object rainbow;
Object black;

Object selected;

Person person;
float happyness = 0;

void setup() {
  size(400, 400);

  ItemActivated = false;
  ItemHeld = false;

  hairBlower = new Object(50-20, 50-20, "blower.gif");
  scissor = new Object(width-50+20, 50-20, "scissors.gif");
  grower = new Object(50-20, height-50+20, "wand.gif");
  comb = new Object(width/2, 50-20, "comb.gif");

  blond = new Object(width-50+15+5, height-50-15-5, "blonde.gif");
  red = new Object(width-50-15-5, height-50+15+5, "red.gif");
  rainbow = new Object(width-50+15+5, height-50+15+5, "rainbow.gif");
  black = new Object(width-50-15-5, height-50-15-5, "black.gif");

  person = new Person();
}

void draw() {
  person.update();
  hairBlower.update();
  scissor.update();
  grower.update();
  comb.update();

  blond.update();
  red.update();
  rainbow.update();
  black.update();

  background(249, 212, 35);

  person.render();
  hairBlower.render();
  scissor.render();
  grower.render();
  comb.render();

  rainbow.render();
  red.render();
  blond.render();
  black.render();
}

class Person {
  ArrayList<Hair> hair;

  int eyeWidth = 40;

  Person() {
    PVector hairRoot = new PVector(200, 200);
    PVector scalp = new PVector(0, -100);
    scalp.rotate(radians(10));
    hairRoot.add(scalp);


    hair = new ArrayList<Hair>();
    //creates to layers of hair, each with slightly different perlin noise offset
    for (int x = 0; x < 40; x++) {
      hairRoot = new PVector(200, 200);
      scalp = new PVector(0, -100);

      scalp.rotate(radians(5*x-5*40/2));
      hairRoot.add(scalp);

      hair.add(new Hair(hairRoot, 15, 0.0));
    }
  }

  void update() {
    if (happyness < 0) {
      happyness = constrain(happyness += 1, -50, 50);
    } else if (happyness > 0) {
      happyness = constrain(happyness -= 0.5, -50, 50);
    }

    if (grower.isActive && dist(200, 200, grower.pos.x, grower.pos.y) < 100) {
      if (dist(width/2-eyeWidth, height/2, grower.pos.x, grower.pos.y) > 10 && dist(width/2+eyeWidth, height/2, grower.pos.x, grower.pos.y) > 10) {
        if (frameCount%10 == 0)
          hair.add(new Hair(new PVector(mouseX+random(20)-10, mouseY+random(20)-10), 3, 0.0));
      }
    }

    for (int x = 0; x < hair.size (); x++) {
      hair.get(x).update(new PVector(mouseX, mouseY), new PVector(mouseX-pmouseX, mouseY-pmouseY));
    }
  }

  void render() {
    stroke(0);
    fill(127, 127, 127);
    ellipse(width/2, height, 400, 400);

    drawFace();
  }

  private void drawFace() {
    ellipseMode(CENTER);

    fill(236, 229, 206);
    ellipse(width/2, height/2, 200, 200);

    drawEyes();

    //draw face;
    beginShape();
    vertex(width/2-eyeWidth, height/2+50);
    bezierVertex(width/2-eyeWidth, height/2+50+happyness, width/2+eyeWidth, height/2+50+happyness, width/2+eyeWidth, height/2+50);
    endShape();

    for (int x = 0; x < hair.size ()-1; x++) {
      hair.get(x).draw();
    }
  }

  private void drawEyes() {
    fill(255);
    ellipse(width/2-eyeWidth, height/2, 40, 40);
    ellipse(width/2+eyeWidth, height/2, 40, 40);

    PVector lookDirL = new PVector(mouseX - width/2-eyeWidth, mouseY-height/2);
    if (lookDirL.mag() > 10) {
      lookDirL.setMag(10);
    }

    PVector lookDirR = new PVector(mouseX - width/2+eyeWidth, mouseY-height/2);
    if (lookDirR.mag() > 10) {
      lookDirR.setMag(10);
    }

    fill(0);
    //arc(width/2-eyeWidth+lookDirR.x, height/2+lookDirR.y, 20, 20, 0, PI+QUARTER_PI, OPEN);
    ellipse(width/2-eyeWidth+lookDirR.x, height/2+lookDirR.y, 20, 20);
    ellipse(width/2+eyeWidth+lookDirL.x, height/2+lookDirL.y, 20, 20);
  }
}

class Hair {
  PVector anchor;
  float offset;
  color hairColor;
  float gravity;

  PVector growDir;
  float thickness;

  float h;

  ArrayList<PVector> segments;

  Hair(PVector setAnchor, int setSegments, float preOffset) {
    anchor = setAnchor;

    if (grower.isActive)
      growDir = PVector.random2D();
    else
      growDir = new PVector();

    //println(growDir);

    segments = new ArrayList<PVector>();

    for (int x = 0; x < setSegments; x++) {
      segments.add(new PVector(anchor.x, anchor.y+10*x));
    }

    thickness = segments.size()/15;

    h = segments.size() - 2;

    offset = random(100)/100 + preOffset;
    hairColor = color((int)random(0, 100), (int)random(0, 10), (int)random(0, 10));
    gravity = random(2, 4);

    //grounding force
    segments.get(0).x = anchor.x;
    segments.get(0).y = anchor.y;
  }

  void update(PVector blow, PVector force) {
    //perlin noise wind, slightly offset from every other Hair
    float wind = (noise(frameCount/100.0+offset)-0.5)/4;

    //apply forces to each Hair segment
    for (int x = 1; x < segments.size (); x++) {
      PVector segment = segments.get(x);
      segment.y += gravity*x+growDir.y*5;
      segment.x += x*wind*(4/detailLvl)+growDir.x*5;

      //effect of mouse acceleration
      float secondWind = dist(blow.x, blow.y, segment.x, segment.y-30);

      if (hairBlower.isActive) {
        force = new PVector(segment.x-(float)mouseX, segment.y-(float)mouseY-30);
        force.setMag(30);
        force.rotate(random(radians(40)));
        secondWind = 99;
      }

      if (secondWind < 100 && force.mag() > 10) {
        happyness = constrain(happyness += 0.005*(15/segments.size ()), -50, 50);
        segment.x += force.x*(20/secondWind*(4/detailLvl));
        segment.y += force.y*(20/secondWind*(4/detailLvl));
      }
      if (comb.isActive && secondWind < 30) {
        if (growDir.x < 0)
          growDir.x += 0.1;
        else if (growDir.x > 0)
          growDir.x -= 0.1;

        if (growDir.y < 0)
          growDir.y += 0.1;
        else if (growDir.y > 0)
          growDir.y -= 0.1;
      }
      if (scissor.isActive && secondWind < 10) {
        for (int y = segments.size ()-1; y > (x); y--) {
          happyness = constrain(happyness += 0.5, -50, 50);
          segments.remove(y);
        }
        if (segments.size () == 2) {
          happyness = constrain(happyness -= 10, -50, 50);
          segments.remove(1);
        }
      }
      if (red.isActive && secondWind < 10) {
        hairColor = color(200-random(100), 32, 10);
      }
      if (blond.isActive && secondWind < 10) {
        hairColor = color(255-random(20), 255-random(20), 255-random(20));
      }
      if (black.isActive && secondWind < 10) {
        hairColor = color(0+random(20), 0+random(20), 0+random(20));
      }
      if (rainbow.isActive && secondWind < 10) {
        int rnd = (int)random(4);

        if (rnd == 0)
          hairColor = color(86, 38, 112);
        else if (rnd == 1)
          hairColor = color(223, 21, 26);
        else if (rnd == 2)
          hairColor = color(0, 218, 60);
        else if (rnd == 3)
          hairColor = color(0, 203, 231);
        else
          hairColor = color(253, 134, 3);
      }
    }

    if (grower.isActive && dist(blow.x, blow.y, anchor.x, anchor.y) < 10) {
      if (frameCount%10 == 0)
        segments.add(new PVector(anchor.x, anchor.y));
      thickness = segments.size()/15;
      h = segments.size() - 2;
    }

    //pull joints together
    for (int x = 0; x < segments.size ()-1; x++) {
      PVector joint = PVector.sub(segments.get(x), segments.get(x+1)); 

      if (joint.mag() > 5*(4/detailLvl)) {
        joint.normalize();

        joint.mult(-5*(4/detailLvl));

        segments.get(x+1).x = segments.get(x).x + joint.x;
        segments.get(x+1).y = segments.get(x).y + joint.y;
      }
    }
  }

  void draw() {
    fill(hairColor);
    stroke(hairColor);

    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < segments.size ()-1; x++) {
      PVector segment = segments.get(x);
      vertex(segment.x+5*thickness*((h-x)/h), segment.y);
      vertex(segment.x-5*thickness*((h-x)/h), segment.y);
    }
    endShape();
  }
}

class Object {
  PVector home;
  PVector pos;

  boolean isActive;
  boolean isHeld;

  PImage sprite;

  Object(int x, int y) {
    home = new PVector(x, y);
    pos = new PVector(x, y);

    isActive = false;
    isHeld = false;
  }

  Object(int x, int y, String img) {
    home = new PVector(x, y);
    pos = new PVector(x, y);

    sprite = loadImage(img);

    isActive = false;
    isHeld = false;
  }

  void update() {
    if (dist(mouseX, mouseY, pos.x, pos.y) <= 20 && ItemHeld && selected == null || (selected == this && ItemHeld))
    {
      selected = this;

      pos.x = mouseX;
      pos.y = mouseY;

      if (ItemActivated)
      {
        isActive = true;
      } else {
        isActive = false;
      }
      isHeld = true;
    } else if (dist(home.x, home.y, pos.x, pos.y) >= 2) {
      if (selected == this) {
        selected = null;
      }

      PVector move = new PVector(home.x - pos.x, home.y - pos.y);
      move.div(10);
      pos.add(move);

      isActive = false;

      isHeld = false;
    }
  }

  void render() {
    ellipseMode(CENTER);

    if (!isActive)
      fill(255, 255, 255);
    else
      fill(0, 255, 0);

    stroke(0);
    ellipse(pos.x, pos.y, 30, 30);

    if (sprite != null) {
      imageMode(CENTER);
      image(sprite, pos.x, pos.y);
    }
  }
}

void mousePressed() {
  ItemHeld = true;
  ItemActivated = true;
}

void mouseReleased() {
  ItemActivated = false;
  ItemHeld = false;
}



