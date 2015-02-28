

int r1 = 170;
int g1 = 211;
int b1 = 126;
int a = 255;
int r2 = 91;
int g2 = 105;
int b2 = 176;
int circleSize = 10;
//int strokeFactor = 3;

void setup() {
  size(800, 600);
  background(255);
  smooth();
//  noFill();
  noStroke();
}

void draw() {
//background(255);
  
  fill(r2,g2,b2,a);
// to make the stroke grow in size instead of the circle, change fill above to stroke and uncomment below
//  strokeWeight(abs(pmouseX - mouseX)*5*strokeFactor);
  ellipse( mouseX, mouseY, circleSize+(abs(pmouseX - mouseX)*5), circleSize+(abs(pmouseX - mouseX)*5));
  println("r2 = " + r2);
  
  fill((r1-r2)/4*1+r2, (g1-g2)/4*1+g2, (b1-b2)/4*1+b2, a );
//  strokeWeight(abs(pmouseX - mouseX)*4*strokeFactor);
  ellipse( mouseX, mouseY, circleSize+(abs(pmouseX - mouseX)*4), circleSize+(abs(pmouseX - mouseX)*4));
  println("ra = " + (r1-r2)/4*1+r2);
  
  fill((r1-r2)/4*2+r2, (g1-g2)/4*2+g2, (b1-b2)/4*2+b2, a );
//  strokeWeight(abs(pmouseX - mouseX)*3*strokeFactor);
  ellipse( mouseX, mouseY, circleSize+(abs(pmouseX - mouseX)*3), circleSize+(abs(pmouseX - mouseX)*3));
//  println((r1-r2)/4*2+r1, (g1-g2)/4*2+g1, (b1-b2)/4*2+b1, a );
  println("rb = " + (r1-r2)/4*2+r2);
  
  fill((r1-r2)/4*3+r2, (g1-g2)/4*3+g2, (b1-b2)/4*3+b2, a );
//  strokeWeight(abs(pmouseX - mouseX)*2*strokeFactor);
  ellipse( mouseX, mouseY, circleSize+(abs(pmouseX - mouseX)*2), circleSize+(abs(pmouseX - mouseX)*2));
//  println((r1-r2)/4*3+r1, (g1-g2)/4*3+g1, (b1-b2)/4*3+b1, a );
  println("rc = " + (r1-r2)/4*3+r2);
  
  fill(r1,g1,b1,a);
//  strokeWeight(abs(pmouseX - mouseX)*1*strokeFactor);
  ellipse( mouseX, mouseY, circleSize+(abs(pmouseX - mouseX)*1), circleSize+(abs(pmouseX - mouseX)*1));
   println("r1 = " + r1);
   //println is for testing, it still doesnt seem to print the right number as ra is = 19170 and should be 111 but the colors are all accurate so i think i hav println wrong
}

