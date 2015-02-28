
class Leaf {

  float x = random(width);
  float y = random(-100, -10);
  float w = (random(15, 30));
  float h = (random(50, 70));
  int arraysize = 15;
  color[] c = new color[arraysize];
  color baseC;
  //(random(30, 100), random(100, 140), random(30, 50))

  PVector loc = new PVector();
  PVector rot = new PVector();

  PVector spd = new PVector(.1, .7, .05);
  PVector rotSpd = new PVector(.01, .01, .01);

  Leaf() {
  }

  Leaf(PVector loc) {
    this.loc = loc;
  }
  
  Leaf(PVector loc, PVector rot, PVector spd, PVector rotSpd, color baseC) {
    this.loc = loc;
    this.rot = rot;
    this.spd = spd;
    this.rotSpd = rotSpd;
    this.baseC = baseC;
    setColor();
  }
  
  void setColor(){
    for(int i=0; i<arraysize; i++){
      float r = red(baseC);
      float g = green(baseC);
      float b = blue(baseC);
      c[i] = color(random(40, 100)+r, random(80, 110)+g, random(20, 40)+b);
    }
  }


  void display() {
    //noStroke();

    pushMatrix();

    translate(loc.x, loc.y, loc.z);
    rotateX(rot.x);
    rotateY(rot.y);
    rotateZ(rot.z);

    scale(3);
    beginShape(); //leaf shape
                  //shape drawn in counterclockwise direction
  fill(c[0]);
  curveVertex(-10, 15, 1);
  fill(c[1]);
  curveVertex(0, 0, -1);
  fill(c[2]);
  curveVertex(10, 15, -1);
  fill(c[3]);
  curveVertex(15, 30, 3);
  fill(c[4]);
  curveVertex(10, 25, 1);
  fill(c[5]);
  curveVertex(5, 20, 0);
  fill(c[6]);
  curveVertex(3, 30, 0);
  fill(c[7]);
  curveVertex(0, 35, 1);
  fill(c[8]);
  curveVertex(-3, 30, 0);
  fill(c[9]);
  curveVertex(-5, 20, 0);
  fill(c[10]);
  curveVertex(-10, 25, 1);
  fill(c[11]);
  curveVertex(-15, 30, 3);
  fill(c[12]);
  curveVertex(-10, 15, -1);
  fill(c[13]);
  curveVertex(0, 0, -1);
  fill(c[14]);
  curveVertex(10, 15, 1);
    
    /*
    //vertex(x, y, z);
    fill(c[0]);
    vertex(-20, -40, -10);
    fill(c[1]);
    vertex(-8, 0, 0); //bottom left
    fill(c[2]);
    vertex(8, 0, 0); //bottom right
    fill(c[3]);                              ////////////////////////////
    vertex(20, -60, 8);                      ///ORIGAMI LOOKING LEAVES///
    fill(c[4]);                              ////////////////////////////
    vertex(10, -40, 0);
    fill(c[5]);
    vertex(0, -90, 17); //top point of leaf
    fill(c[6]);
    vertex(-10, -30, 0);
    endShape();
    
    beginShape(); //vein shape
    fill(c[7]);
    vertex(0, 0, 0);
    fill(c[8]);
    vertex(0, -10, 0);
    fill(c[9]);
    vertex(0, 0, 0);
    */
    
    endShape();

    popMatrix();
  }

  void move() {
    loc.add(spd);
    rot.add(rotSpd);
    
    if(loc.y>height+90){
      loc.y = -100;
      loc.x = random(width);
      loc.z = random(20, 80);
      setColor();
    }
  }
}


