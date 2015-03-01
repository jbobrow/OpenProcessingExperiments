
float mx;
float my;
float pmx;
float pmy;

void setup() {
  size(1200,1200);
  smooth();
  ellipseMode(RADIUS);
}


void draw() {
  smooth();
  strokeWeight(2);
  background(204);
  mx = mouseX;
  my = mouseY;
  pmx = pmouseX;
  pmy = pmouseY;
  
//First Layer
  //Lower Torso
    strokeJoin(BEVEL);
    fill(126,9,125);
    rect(mx-60,my+50,120,60);
  //Middle torso
    fill(193,57,191);
    ellipse(mx,my,60,60);
    strokeWeight(6);
  //Neck
    fill(255);
    line(mx,my-105,mx,my-150);
    line(mx-20,my-105,mx-15,my-150);
    line(mx+20,my-105,mx+15,my-150);

//Second Layer
  //Upper Torso
    strokeWeight(2);
    fill(126,9,125);
    rect(mx-95,my-110,190,80);
  //Left arm
    strokeWeight(10);
    fill(255);
    line(pmx-95,pmy-105,pmx-180,pmy);
    line(pmx-180,pmy+5,pmx-240,pmy-135);
  //Left fingers
    strokeWeight(7);
    line(pmx-235,pmy-135,pmx-245,pmy-180);
    line(pmx-235,pmy-132,pmx-270,pmy-160);
    line(pmx-235,pmy-133,pmx-200,pmy-150);
    line(pmx-235,pmy-134,pmx-280,pmy-138);
  //Right arm
    strokeWeight(10);
    line(pmx+90,pmy-105,pmx+125,pmy);
    line(pmx+125,pmy,pmx+175,pmy+150);
  //Right fingers
    strokeWeight(7);
    line(pmx+175,pmy+145,pmx+150,pmy+173);
    line(pmx+175,pmy+150,pmx+171,pmy+191);
    line(pmx+177,pmy+150,pmx+191,pmy+190);
    line(pmx+178,pmy+145,pmx+208,pmy+175);
  //Left leg
    strokeWeight(13);
    line(pmx-60,pmy+110,pmx-85,pmy+289);
  //Right leg
    line(pmx+60,pmy+110,pmx+105,pmy+289);

//Third Layer
  //Shoulders
    strokeWeight(2);
    fill(34,42,242);
    ellipse(mx-90,my-105,25,25);
    ellipse(mx+90,my-105,25,25);
  //Left elbow
    ellipse(pmx-180,pmy-5,15,15);
  //left palm
    ellipse(pmx-235,pmy-135,15,17);
  //Right elbow
    ellipse(pmx+125,pmy,15,15);
  //Right palm
    ellipse(pmx+175,pmy+150,15,17);
  //Left hip joint
    ellipse(mx-60,my+110,25,25);
  //Left knee
    ellipse(pmx-85,pmy+285,15,15);
  //Right hip joint
    ellipse(mx+60,my+110,25,25);
  //Right knee
    ellipse(pmx+105,pmy+285,15,15);

//Fourth Layer
  //Head
    fill(201,55,187);
    ellipse(pmx,pmy-210,65,65);
  //Left thigh cover
    fill(193,57,191);
    quad(pmx-55,pmy+150,pmx-60,pmy+240,pmx-110,pmy+260,pmx-75,pmy+150);
  //Right thigh cover
    quad(pmx+60,pmy+150,pmx+75,pmy+240,pmx+125,pmy+260,pmx+80,pmy+150);
}
