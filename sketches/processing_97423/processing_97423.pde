
float a=0;//size of sunlight1
float aa;//size of sunlight2
float b=50;//value of halo-opacity
float arate=0.5;//increasing rate

// create a variable to count the frames drawn:
int frame = 0;

void drawbg() {
  // a new frame increases the current frame count:
  frame = frame + 1;

  background(200);
  // draw lots of lines:
  for (int i = 0; i < 256; i += 1) {  
    // change color by loop index:
    stroke(i);
    // calculate an angle that is dependent on time (frame) and loop index (i):
    float angle = PI * 0.1 * (frame + i);
    line(i, i, 255 * cos(angle), 255 * sin(angle));
  }
}

int bg1= 240;
int bg2= 140;
int bg3= 0;

void setup() {
  size(800, 400);
   background(bg1, bg2, bg3);

}


void drawAT(){
//A
  fill(255,0,0);
  triangle(470, 30, 350, 225, 590, 225);
  fill(bg1, bg2, bg3);
  triangle(470, 80, 450, 125, 490, 125);
  quad(435, 175, 505, 175, 530, 225, 410, 225 );

//T
  fill(0,0,255);
  rect(610, 70, 180, 180);
  fill(bg1, bg2, bg3);
  rect(610, 100, 60, 150);
  rect(730, 100, 60, 150);
 
 
}

void draw() {
  background(240, 140, 0);

  //Halo of sunlight
  strokeWeight(7);
  fill(240, 160, 0, b-50);
  noStroke();
  ellipse(200+mouseX/80, 200+mouseY/80, 270, 270);

  fill(240, 130, 0, b);
  noStroke();
  ellipse(200+mouseX/80, 200+mouseY/80, 200, 200);

  fill(240, 120, 0, b+20);
  noStroke();
  ellipse(200+mouseX/80, 200+mouseY/80, 140, 140);

  fill(240, 110, 0, b+60);
  noStroke();
  ellipse(200+mouseX/80, 200+mouseY/80, 80, 80);

  //light lines
  stroke(255);
  line(200+mouseX/80, 160+mouseY/80, 200, 160-a);
  line(240+mouseX/80, 200+mouseY/80, 240+a, 200);
  line(200+mouseX/80, 240+mouseY/80, 200, 240+a);
  line(160+mouseX/80, 200+mouseY/80, 160-a, 200);

  aa= a*sqrt(2)/2;
  line(200+20*sqrt(2)+mouseX/80, 200-20*sqrt(2)+mouseY/80, 200+20*sqrt(2)+aa, 200-20*sqrt(2)-aa);
  line(200+20*sqrt(2)+mouseX/80, 200+20*sqrt(2)+mouseY/80, 200+20*sqrt(2)+aa, 200+20*sqrt(2)+aa);
  line(200-20*sqrt(2)+mouseX/80, 200+20*sqrt(2)+mouseY/80, 200-20*sqrt(2)-aa, 200+20*sqrt(2)+aa);
  line(200-20*sqrt(2)+mouseX/80, 200-20*sqrt(2)+mouseY/80, 200-20*sqrt(2)-aa, 200-20*sqrt(2)-aa);


  //face
  noFill();
  ellipse(200, 200, 50, 50); 
  point(190+mouseX/90, 195+mouseY/90);
  point(210+mouseX/90, 195+mouseY/90);
  strokeWeight(4);
  arc(200+mouseX/90, 200+mouseY/90, 20, 20, 1, PI-1);

  //increasing or shrinking the objects.
  if (a>=90) {
    arate = -0.5;
  } 
  else if (a <=0) {
    arate = 0.5;
  }
  a = a + arate;
  b = b + arate*2;//increase or shrink the opacity of halos.
  
  drawAT();
}
void mouseClicked() {
  a = 0;
  b = 50;
}
