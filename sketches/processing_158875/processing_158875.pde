
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/158875*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

/*
//"Animated_grass_with_perlin_noise" by Kasper Kristensen, licensed under Creative Commons Attribution-Share //Alike 3.0 and GNU GPL license.
 //Work: http://openprocessing.org/visuals/?visualID= 158875   
 //License: 
 //http://creativecommons.org/licenses/by-sa/3.0/
 //http://creativecommons.org/licenses/GPL/2.0/
 */

ArrayList<Blade> grass;

//INCREASE AMOUNT OF JOINTS PER "INCH"
// 1 = LOW
// 5 = HIGH
// Ã�ï¿½Ã�Â¢Ã�Â¯Ã�Â¿Ã�Â½Ã�Â¯Ã�Â¿Ã�Â½ = INSANITY!!

static int detailLvl = 1; 

void setup() {
  size(600, 200);

  grass = new ArrayList<Blade>();
  //creates to layers of grass, each with slightly different perlin noise offset
  for (int x = 0; x < 20; x++) {
    grass.add(new Blade(new PVector(random(0, width), height), (int)random(5*detailLvl, 10*detailLvl), 0.0));
  } 
  for (int x = 0; x < 20; x++) {
    grass.add(new Blade(new PVector(random(0, width), height), (int)random(5*detailLvl, 10*detailLvl), 1.0));
  }
}

void draw() {
  background(100, 220, 255);

  for (int x = 0; x < grass.size ()-1; x++) {
    grass.get(x).update(new PVector(mouseX, mouseY), new PVector(mouseX-pmouseX, mouseY-pmouseY));
    grass.get(x).draw();
  }
}

class Blade {
  PVector anchor;
  float offset;
  color green;
  float stiffness;

  ArrayList<PVector> segments;

  Blade(PVector setAnchor, int setSegments, float preOffset) {
    anchor = setAnchor;

    segments = new ArrayList<PVector>();

    for (int x = 0; x < setSegments; x++) {
      segments.add(new PVector(anchor.x, anchor.y+10*x));
    }

    offset = random(100)/100 + preOffset;
    green = color((int)random(0, 50), (int)random(100, 255), (int)random(0, 100));
    stiffness = random(1, 2);

    //grounding force
    segments.get(0).x = anchor.x;
    segments.get(0).y = anchor.y;
  }

  void update(PVector blow, PVector force) {
    //perlin noise wind, slightly offset from every other blade 
    float wind = (noise(frameCount/100.0+offset)-0.5);

    //apply forces to each blade segment
    for (int x = 1; x < segments.size (); x++) {
      PVector segment = segments.get(x);
      segment.y -= (((segments.size ()-x)*1)/detailLvl)*stiffness;
      segment.x += x*wind*(4/detailLvl);

      //effect of mouse acceleration
      float secondWind = dist(blow.x, blow.y, segment.x, segment.y);
      if (secondWind < 100) {
        segment.x += force.x*(20/secondWind*(4/detailLvl));
        segment.y += force.y*(20/secondWind*(4/detailLvl));
      }
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
    fill(green);
    stroke(green);
    grassBlade_v2(segments);
  }
}

void grassBlade_v2(ArrayList<PVector> segments) { 
  int h = segments.size ()-2;
  beginShape(TRIANGLE_STRIP); 
  for (int x = 0; x < segments.size ()-1; x++) {
    PVector segment = segments.get(x);
    vertex(segment.x+5*((h-x)/h), segment.y);
    vertex(segment.x-5*((h-x)/h), segment.y);
  } 
  endShape();
}

void mousePressed() {
  grass.add(new Blade(new PVector(random(0, width), height), (int)random(5*detailLvl, 10*detailLvl), 0.5));
}
