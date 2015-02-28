
/**
 * Philippe Moore
 * September 16, 2009
 * September21, 2009
 * January 12, 2012
 * retooling this as an emergent swarm
 * changed the 2D for-loop for detection to 2N instead of N^2
 * 
 **/

PFont font;
ArrayList vapors;
int vaporWidth = 15;
float velx;
float vely;
int maxWidth = vaporWidth*5;



void setup () {
  //size(screen.width, screen.height);
  size(800, 600);
  smooth();

  background(0);
  colorMode(HSB, 1000);

  vapors = new ArrayList();

  for (int i = 0; i < 150; i++) {
    velx = random(-.4, .4);
    vely = random(-.4, .4);
    vapors.add(new Vapor(random(width), random(height), 
    vaporWidth, velx, vely));
  }
  font = loadFont("HelveticaNeue-48.vlw");
  textFont(font, 32);
}

void draw() {
  fill(0, 1000, 0, 50);
  rect(0, 0, width, height);
  velx = random(-.001, .001);
  vely = random(-.001, .001);
  // background(0);
  if (vapors.size()>600) {
    vapors.clear();
  }

  for (int i = 0; i < vapors.size()-1; i++) {
    for (int j = i+1; j < vapors.size(); j++) {
      Vapor vapor1 = (Vapor) vapors.get(i);
      Vapor vapor2 = (Vapor) vapors.get(j);
      if (j == i) {
        j++;
      }
      else if (vapor1.collides(vapor2)&&vapor1.age>50) {
        if (vapor1.type == vapor2.type) {
          vapor1.counts[vapor1.type]++;
          vapor2.counts[vapor2.type]++;
          vapor1.age=0;
          vapor2.age=0;
        }
        //println("BOOM " + vapor1.type + " " + vapor2.type);
        int type1 = vapor1.type;
        int type2 = vapor2.type;
        int counts1 = vapor2.counts[type1];
        int selfCounts1 = vapor1.counts[type1];
        int counts2 = vapor1.counts[type2];
        int selfCounts2 = vapor2.counts[type2];
        
        counts1++;
        counts2++;
        
       // vapor1.w+=5;
       // vapor2.w+=5;
        noFill();
        strokeWeight(10);
        if (counts1<selfCounts1) {stroke(vapor1.type*200, 1000, 1000, 1000); rect(vapor1.x-20, vapor1.y-20, 40, 40); vapor2.type = vapor1.type;}
        if (counts2<selfCounts2) {stroke(vapor2.type*200, 1000, 1000, 1000); rect(vapor2.x-20, vapor2.y-20, 40, 40); vapor1.type = vapor2.type;}
        if (counts1==selfCounts1) {fill(1000, 1000, 1000); rect(vapor1.x-20, vapor1.y-20, 40, 40);}
      }
    }
  }
/** deprecated for the swarm!
  for (int i = 0; i < vapors.size(); i++) {
    Vapor vapor = (Vapor) vapors.get(i);
    print(vapor.w+",");
    if (vapor.w>maxWidth) {
      for (int j = 0; j < vapor.w/vaporWidth; j++) {
        //        vapors.add(new Vapor(random(width), random(height), vaporWidth, 
        //        random(-2, 2), random(-2, 2)));
        vapors.add(new Vapor(vapor.x, vapor.y, vaporWidth, velx, vely));
      }
      vapors.remove(vapor);
    }
  }
  **/
  for (int i = vapors.size()-1; i >= 0; i--) {
    Vapor vapor = (Vapor) vapors.get(i);
    vapor.drift();
    vapor.display();
  }

  if (keyPressed) {
    if (key == ' ') {
      vapors.clear();
      background(0);
    }
    if (key == '1') {
      vaporWidth = 1;
    }
    if (key == '2') {
      vaporWidth = 2;
    }
    if (key == '3') {
      vaporWidth = 3;
    }
    if (key == '4') {
      vaporWidth = 5;
    }
    if (key == '5') {
      vaporWidth = 8;
    }
    if (key == '6') {
      vaporWidth = 13;
    }
    if (key == '7') {
      vaporWidth = 21;
    }
    if (key == '0') {
      vaporWidth = 0;
    }
  }
  fill(0, 0, 0);
  rect(0, 0, 60, 40);
  fill(0, 0, 999);
 // text(vapors.size(), 4, 32);
  
}

void mouseClicked() {
  vapors.add(new Vapor(mouseX, mouseY, vaporWidth));
}
void mouseDragged() {
  vapors.add(new Vapor(random(width), random(height), vaporWidth));
  //vapors.add(new Vapor(width/2, height/2, vaporWidth));
}




