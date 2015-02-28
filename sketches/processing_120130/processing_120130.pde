
Penguin[] penguins = {};
ArrayList rocks = new ArrayList();
int nPenguins = 6;
int nRocks = 600;
int nestSize = 20;
int nestingArea = 300;
PImage penguinImage;

void setup() {
  size(600,600);
  smooth();
  penguinImage = loadImage("penguin.jpg");
  
  for (int i = 0; i < nPenguins; i++) {
    Penguin penguin = new Penguin();
    penguins = (Penguin[])append(penguins, penguin);
  }
  for (int i = 0; i < nRocks; i++) {
    Rock rock = new Rock();
    rocks.add(rock);
  }
}

void draw() {
  background(255);
  fill(240);
  noStroke();
  rect((width-nestingArea)/2,(height-nestingArea)/2,nestingArea,nestingArea);
  
  for (int i = 0; i < penguins.length; i++) {
    penguins[i].update();
    penguins[i].draw();
  }
  for (int i = 0; i < rocks.size(); i++) {
    Rock rock = (Rock)rocks.get(i);
    rock.draw();
  }
}

class Penguin {
  float xhome, yhome, x, y, angle, speed;
  boolean hasRock;
  float armLength = 20;
  int rocksInNest;
  
  Penguin() {
    xhome = (width-nestingArea)/2+random(nestingArea);
    yhome = (height-nestingArea)/2+random(nestingArea);
    x = xhome;
    y = yhome;
    angle = random(2*PI);
    speed = random(1,1.5);
  }
  
  void update() {    
    move();
    rocksInNest = countRocks();
  }
  
  void move() {
        //rock nearby?
    if (!hasRock) {
      for (int i = 0; i < rocks.size(); i++) {
        Rock rock = (Rock)rocks.get(i);
        if (dist(x, y, rock.x, rock.y) < armLength
            && dist(xhome,yhome, rock.x, rock.y) > nestSize/2.0) {
          rocks.remove(i);
          hasRock = true;
          angle = atan2(yhome-y, xhome-x);
          break;
        }
      }
    }
    
    if (hasRock && dist(x,y,xhome,yhome) < armLength) {
      float xrock = xhome + random(-nestSize/2.0,nestSize/2.0);
      float yrock = yhome + random(-nestSize/2.0,nestSize/2.0);
      Rock rock = new Rock(xrock, yrock);
      rocks.add(rock);
      hasRock = false;
      angle = random(2*PI);
    }
    
    if (!hasRock) {
      angle += random(-PI/16,PI/16);
    }
    
    //out of bounds checks
    if (x < 0) { angle = random(-PI/2, PI/2); }
    if (x > width) { angle = random(PI/2, 3*PI/2); }
    if (y < 0) { angle = random(0, PI); }
    if (y > height) { angle = random(PI, 2*PI); }
      
    x += speed*cos(angle);
    y += speed*sin(angle);
  }
  
  int countRocks() {
    int count = 0;
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = (Rock)rocks.get(i);
      if (dist(xhome,yhome, rock.x, rock.y) <= nestSize/2.0) {
        count++;
      }
    }
    return(count);
  }
  
  void draw() {
    float danger = sqrt(pow(x-xhome,2)+pow(y-yhome,2))+10;
    stroke(0,100,100+rocksInNest*10,100);
    strokeWeight(1000/danger);
    line(x,y,xhome,yhome);
    
    //draw nest
    pushMatrix();
    translate(xhome,yhome);
    noStroke();
    fill(200,100);
    //ellipse(0,0,nestSize,nestSize);
    textAlign(CENTER);
    fill(#ff0000);
    //text(rocksInNest, 0, nestSize/4);
    popMatrix();
    
    //draw penguin
    pushMatrix();
    translate(x,y);
    noStroke();
    fill(0);
    //image(penguinImage, -10, -10);
    rect(-4,-6,8,12);
    popMatrix();
  }
}

class Rock {
  float x, y;
  int rockVertices = 5;
  float rockSize = 3;
  
  Rock() {
    x = random(width);
    y = random(height);
  }
  
  Rock(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  void draw() {
    pushMatrix();
    translate(x,y);
    noStroke();
    fill(80);
    //ellipse(0,0,5,5);
    beginShape();
    for (int i = 0; i < rockVertices; i++) {
      vertex(rockSize*cos(i*PI*2/rockVertices),
        rockSize*sin(i*PI*2/rockVertices));
    }
    endShape(CLOSE);
    popMatrix();
  }
}


