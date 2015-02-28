
  float rot_off = 0.0;
float rot_increment = 10;
float line_translate = 300;
int level = 0;
 
void setup() {
  size(400, 400);
  smooth();
}
 
void draw () {
  for(int r=1; r<random(40); r++){
  
  background(300*r);
  }
  
  fill(0,0,0,1);
  rect(0,0,width,height); 
   noiseDetail(1,0.1);
  float rotate_it = noise(rot_off)*TWO_PI;
  float dot_off = rot_off * 0;
 
  Perline(line_translate, level, rotate_it);
 
  rot_off += rot_increment;
}
 
void Perline(float tran, int lev, float rot)
{
  if (lev < 4) {
    pushMatrix();
    translate(tran, tran);
    rotate(rot); 
 
    for (int sparkles = 25; sparkles > lev; sparkles--)
    {
      
  for(int r=1; r<random(40); r++){
      stroke(255,r,100*r);
      int disperse = sparkles*1;
      point(random(-disperse,disperse)*sparkles,random(-disperse,disperse));
  }
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

