
float[] rs = new float[6];
float c1,c2;
int m=0;
boolean dr=true;

void setup() {
  size(500, 500);
  noStroke();
  //stroke(179,179,0);
  background(0);
  for (int i=0; i < 6; i++) { 
    rs[i]=random(100,500);
  }
  c1=(rs[0]+rs[2]+rs[4])/3;
  c2=(rs[1]+rs[3]+rs[5])/3;
}

void draw() {
  translate (250, 250);        //offsets the origin of the canvas coordinate system 
                               //to the center of the canvas
  fill(80,80,0,100);

  rotate(random(-TWO_PI,TWO_PI));  //rotates the canvas coordinate system around its new origin
  fill(179,179,0,8);
  triangle(rs[0]-c1,rs[1]-c2,rs[2]-c1,rs[3]-c2,rs[4]-c1,rs[5]-c2);
  fill(179,149,0,8);
  rotate(random(-TWO_PI,TWO_PI)); 
  triangle(rs[0]-c1,rs[1]-c2,rs[2]-c1,rs[3]-c2,rs[4]-c1,rs[5]-c2);
}

void mousePressed() {
  m=millis();
  setup();
}
