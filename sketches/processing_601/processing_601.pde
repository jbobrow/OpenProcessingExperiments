
float rot_off = 0.0;
float rot_increment = 0.01;
float line_translate = 200;
int level = 0;

void setup() {
  size(400, 400);
  background(0);
  smooth();
}

void draw () {
  noStroke();
  fill(0,0,0,1);
  rect(0,0,width,height);  

  float rotate_it = noise(rot_off)*TWO_PI;
  float dot_off = rot_off * 10;

  Perline(line_translate, level, rotate_it);

  rot_off += rot_increment;
}

void Perline(float tran, int lev, float rot)
{
  if (lev < 6) {
    pushMatrix();
    translate(tran, tran);
    rotate(rot);  

    for (int sparkles = 6; sparkles > lev; sparkles--)
    {
      stroke(255);
      int disperse = sparkles*2;
      point(random(-disperse,disperse),random(-disperse,disperse));
    }

    lev += 1;
    tran /= 2;
    
    Perline(tran, lev, rot);
    Perline(tran, lev, -rot);
    Perline(-tran, lev, rot);
    Perline(-tran, lev, -rot);
    
    popMatrix(); 
  }
}













