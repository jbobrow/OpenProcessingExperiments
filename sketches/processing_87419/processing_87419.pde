
//-----------------Globals
Frieze freeze = new Frieze(25.0, 50.0);
float ycounter = 0;
int num = 35;
//-----------------Setup
void setup() {
  size(1000, 600, P2D);
  background(0);
  stroke(255);
  noFill();
  smooth();
  strokeWeight(3);
  translate(0,50);
  for (int i = 0; i < num; i++) {
    freeze.hop();
  }
  translate(0, 1.5*freeze.cell_height);
  freeze.current_pos = 0;
  for (int i = 0; i <= num; i++) {
    freeze.step();
  }
  translate(0, 1.5*freeze.cell_height);
  freeze.current_pos = 0;
  for (int i = 0; i <= num; i++) {
    freeze.jump();
  }
  translate(0, 1.5*freeze.cell_height);
  freeze.current_pos = 0;
  for (int i = 0; i <= num/2; i++) {
    freeze.sidle();
  }
  translate(0, 1.5*freeze.cell_height);
  freeze.current_pos = 0;
  for (int i = 0; i <= num; i++) {
    freeze.spin_hop();
  }
  translate(0, 1.5*freeze.cell_height);
  freeze.current_pos = 0;
  for (int i = 0; i <= num; i++) {
    freeze.spin_jump();
  }
  translate(0, 1.5*freeze.cell_height);
  freeze.current_pos = 0;
  for (int i = 0; i <= num/2; i++) {
    freeze.spin_sidle();
  }
}

//-----------------Defined Classes
class Frieze {
  float cell_height;
  float cell_width;
  float current_pos;
  int current_scale = 1;
  float current_angle;

  Frieze(float cell_width, float cell_height) {
    this.cell_height = cell_height;
    this.cell_width = cell_width;
  }

  void primitive() {
    /*This is the primitive cell and should be added by extending this class*/
    line(-this.cell_width/2, -this.cell_height/2, this.cell_width/2, this.cell_height/2);
    ellipse(-this.cell_width/2,-this.cell_height/2, this.cell_width/4, this.cell_height/4);
  }

  void hop() {
    pushMatrix();
    translate(this.cell_width/2, this.cell_height/2);
    /*Just a translation along the x-axis*/
    this.current_pos += this.cell_width;
    //move over to next cell
    translate(this.current_pos, 0);
    //draw primitive shape
    primitive();
    popMatrix();
  }

  void step() {
    pushMatrix();
    translate(this.cell_width/2, this.cell_height/2);
    /*Translation + reflection across horizontal axis (glide)*/
    this.current_pos += this.cell_width;
    this.current_scale *= -1;
    //move over to next cell
    translate(this.current_pos, 0);
    //mirror from previous step
    scale(1, this.current_scale);
    //draw primitive shape
    primitive();
    popMatrix();
  }

  void jump() {
    pushMatrix();
    translate(this.cell_width/2, this.cell_height/2);
    /*Horizontal Reflection + Translation*/
    this.current_pos += this.cell_width;
    translate(this.current_pos, 0);
    primitive();
    scale(1, -1);
    primitive();
    popMatrix();
  }

  void sidle() {
    pushMatrix();
    translate(this.cell_width/2, this.cell_height/2);
    /*Vertical Reflection + Translation*/
    this.current_pos += this.cell_width;
    translate(this.current_pos, 0);
    primitive();
    this.current_pos += this.cell_width;
    translate(this.cell_width, 0);
    scale(-1, 1);
    primitive();
    popMatrix();
  }

  void spin_hop() {
    pushMatrix();
    translate(this.cell_width/2, this.cell_height/2);
    /*Just a translation along the x-axis*/
    this.current_pos += this.cell_width;
    this.current_angle += PI;
    //move over to next cell
    translate(this.current_pos, 0);
    rotate(this.current_angle);
    //draw primitive shape
    primitive();
    popMatrix();
  }

  void spin_jump() {
    pushMatrix();
    translate(this.cell_width/2, this.cell_height/2);
    /*Horizontal Reflection + Translation*/
    this.current_pos += this.cell_width;
    this.current_angle += PI;
    translate(this.current_pos, 0);
    rotate(this.current_angle);
    primitive();
    scale(1, -1);
    primitive();
    popMatrix();
  }

  void spin_sidle() {
    pushMatrix();
    translate(this.cell_width/2, this.cell_height/2);
    /*Vertical Reflection + Translation*/
    this.current_pos += this.cell_width;
    this.current_angle += PI;
    if(this.current_angle % TWO_PI != 0) {
      translate(this.current_pos + this.cell_width, 0);
    }
    else {
      translate(this.current_pos,0);
    }
    rotate(this.current_angle);
    primitive();
    this.current_pos += this.cell_width;
    translate(this.cell_width, 0);
    scale(-1, 1);
    primitive();
    popMatrix();
  }
}



