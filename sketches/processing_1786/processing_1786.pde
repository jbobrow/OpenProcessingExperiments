
int the_scale = 100;
int num;
Woooo[] woooos;
void setup() 
{
  size(600, 400);
  smooth();
  noFill();
  strokeWeight(3);
  woooos = new Woooo[12];
  for (int count = 0; count < 12; count++) {
    woooos[count] = new Woooo();
  }
}
void mousePressed() {
    woooos[(mouseX/200)*2+mouseY/200] = new Woooo();
}
void draw() 
{
  background(0);
  translate(the_scale,the_scale);
  num = 0;
  for (int n_x = 0; n_x < 3; n_x++) {
    pushMatrix();
    for (int n_y = 0; n_y < 2; n_y++) {
      pushMatrix();
      woooos[num++].draw();
      popMatrix();
      translate(0,the_scale*2);
    }
    popMatrix();
    translate(the_scale*2,0);
  }
}
class Woooo {
  float twist, twist_amount, oscill, decrease, limiter, rotate_amount;
  color colo;
  Woooo() {
    decrease  = random(1,3);
    twist_amount = random(PI/2,PI);
    twist = random(PI*2);
    while(red(colo)+green(colo)+blue(colo) < 400) {
      colo = color(random(0,255),random(0,255),random(0,255));
    }
    rotate_amount  = random(-1,1);
    limiter  = random(the_scale/6);
    oscill  = random(1,2);
  }
  void draw() {
    rotate((rotate_amount*millis()/1000));
    stroke(colo);
    beginShape();
    twist = 0;
    for (float i = the_scale; i > limiter; i=i-decrease) {
      twist = twist + twist_amount*sin((oscill*millis()/20000));
      curveVertex(sin(twist)*i,cos(twist)*i);
    }
    endShape();
  }
}

