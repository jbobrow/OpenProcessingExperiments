
PVector circ;
PVector target;
PVector start =  new PVector(350, 350);
float speed = .09;
int size = 30;
boolean follow = true;
int circCount = 50;
PImage grass;

Circ[] circs = new Circ[circCount];
public class Circ {
  PVector pos, prevPos;
  PVector swarmPos; //= new PVector(random( - 120, mouseX + 120), random(mouseY - 120, mouseY + 120));
  int count = 0;
  public Circ(PVector in) {
    pos = new PVector(in.x, in.y);
  } 

  public  void update(PVector posIn) {
    prevPos = new PVector(pos.x, pos.y);
    pos = new PVector(posIn.x, posIn.y);
  }

  public void drawEye() {
    float x, y;
    if (pos.x - prevPos.x < 0) {
      x = pos.x-15;
    }  
    else {
      x = pos.x+15;
    }

    if (pos.y - prevPos.y < 0) {
      y = pos.y - 10;
    }
    else {
      y = pos.y + 10;
    }

    fill(0);
    //ellipse(x, y, 5, 5);
  }
}


void setup() {
  size(700, 700);
  noStroke();
  for (int x = 0; x < circCount; x ++) {
    circs[x] = new Circ(start);
  }

  grass = loadImage("12930005-green-grass-texture.jpg");
  tint(255, 128);
  //circ = new PVector(350, 350);
}

/*
void keyPressed() {
 if (key == ' ') {
 follow = !follow;
 }
 }*/

void draw() {
  background(117, 181, 77);
  fill(142, 149, 82);
  //Target = mousePos - circHeadPos
  target = new PVector(mouseX - (circs[0].pos.x), mouseY- (circs[0].pos.y));

  //Mult by speed
  target.mult(speed);

  

    //Update head (Send it its own position plus target*speed)
    circs[0].update(new PVector(circs[0].pos.x + target.x, circs[0].pos.y + target.y));

    for (int x = 1; x < circCount; x++) {
      circs[x].update(circs[x-1].prevPos);
    }
  

  for (int x = 0; x < circCount; x++) {
    ellipse(circs[x].pos.x, circs[x].pos.y, size, size);
  }

  circs[0].drawEye();
} 



