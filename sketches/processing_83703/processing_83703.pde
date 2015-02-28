

int i = 0;
float a = 0;
float theta1 = random(HALF_PI/2, HALF_PI*2/3);
float theta2 = random(HALF_PI/2, HALF_PI*2/3);
float theta3 = random(HALF_PI/2, HALF_PI*2/3);
float Offset = random(2. * PI);

float x = map(noise(255), 0., 1., 0, width); 
float y = map(noise(255), 0., 1., 0, height);

void setup() {
  size(900, 900, P3D);
}

void draw() {
  background(random(0, 25));
  //background(45, 75, 73);
stroke(255, 70);


  a += 1;

  translate(width/2, height);
  rotateY(radians(a));
  translate(-width/2, -height);
  translate(width/2, height/2);
  if (i < 80) {
    i++;
  } 
  branch(i, theta1, theta2, theta3);
  
}

void branch(float h, float theta1, float theta2, float theta3) {


  int fcolor = (int)map( random(-150., 250), 0, width, 255, 50 );


  h *= 0.8;
  if (h > 5) {
    pushMatrix();
    rotateX(theta1);
    rotateZ(theta2);
    rotateY(theta3);

    fill(fcolor, random( 250), random( 250), 10);
    stroke(255, 70);
    // bezier(0, (height/10), width/2, (height/10) , mouseX/2 + Offset  , mouseY/2 + Offset, mouseX/2 - Offset, mouseY/2 - Offset);
   // line(0, 0, 0, -h);
    translate(0, -h);
    branch(h, theta1, theta2, theta3);
    popMatrix();

    pushMatrix();
    rotateX(-theta1);
    rotateZ(-theta2);
    rotateY(-theta3);
    fill(random( 50, 200), fcolor, fcolor, 10);
    stroke(255, 70);
    //stroke(0);
    //noStroke();
    bezier(0, (height/10), width/2, (height/10), mouseX/2 + Offset, mouseY/2 + Offset, mouseX/2 - Offset, mouseY/2 - Offset);
    
    noStroke();
      fill(fcolor, random( 250), mouseX,50);
    ellipse(x,y,(fcolor-mouseX)/10, fcolor-mouseX/10);
    
  
   
    
  

    translate(0, -h);
    branch(h, theta1, theta2, theta3);
    popMatrix();
    
  }
}


