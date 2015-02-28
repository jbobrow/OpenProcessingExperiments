
int sz, z=0, num=120;
int[] col = new int[num];
float[] offSet = new float[num];
float theta, scal, inc;
color[] palette = {#69D2E7, #A7DBD8, #E0E4CC, #F38630, #FA6900};

void setup() {
  size(500, 500, P3D);
  theta = PI;
  for (int i=0; i<num; i++) {
    //col[i]=(int) random(255);
    inc += (TWO_PI/num);
    offSet[i] = inc;
  }
}

void draw() {
  background(20);
  sz = 400;

  for (int i=0; i<num; i++) {
    pushMatrix();
    translate(width/2, height/2,z);
    rotateX(offSet[i]+theta*0.1);
    rotateY(offSet[i]+theta*0.125);
    rotateZ(offSet[i]+theta*0.05);
    sz -= 5;
    scal = map(sin(offSet[i]*2+theta),-1,1,0.5,1);
    noFill();
    stroke(palette[i%5],200);
    strokeWeight(4*scal);
    ellipse(0, 0, sz*scal, sz*scal);
    popMatrix();
 
  }
  theta += 0.0523*2;
  
  //if (frameCount%4==0 && frameCount<121) saveFrame("image-####.png");
  
}

