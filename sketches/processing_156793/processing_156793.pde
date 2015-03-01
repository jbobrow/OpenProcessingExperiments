
PImage img1;
PImage img2;
int c;
float angle;
float jitter;
float t;
int xt;
int xr;
int counter;
String g;
PFont font;





void setup() {
  size(700, 700);
  noStroke();
  fill(255);
  imageMode(CENTER);
  angle=0;
  img1 = loadImage("button.png");
  img2 = loadImage("button2.png");
  stroke(255);
  xt = 70;
  t = 0;
  xr = 0;
  //String[] fontList = PFont.list();
  //println(fontList);
  font = createFont("Orator STD", 32);
  textFont(font);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(51);
  fill(188);
  strokeWeight(10);
  stroke (255);

  c = counter++;

  //grayrect
  rect(35, 25, 178, 645, 134);
  stroke (251, 248, 254);
  strokeWeight(10);

  //right rect
  rect( 383, 306, 291, 200, 169);
  stroke (40, 70, 200);
  strokeWeight(3);



  textSize(  122
);
  fill(0, 102, 153);
  text( c, 528, 404); 
  if (mouseX>383 && mouseX< 383+291 && mouseY>306 && mouseY<506) {
    if (mousePressed) { 
      counter= 0;
      ;
    }
  }

  if (counter>2000) {
    counter=0;
  }  




  t = t-2;

  //
  if (t<0) {
    t= height;
  }
  //blue
  line(270, t, width/2, t);
  line(270, t+40, width/2, t+40);
  line(270, t+80, width/2, t+80);
  line(270, t+100, width/2, t+100);
  line(270, t+20, width/2, t+20);
  line(270, t+ 60, width/2, t+60);

  ///red 
  stroke(243, 114, 113);
  line(270, t/2 +xt, width/2, t/2+xt);
  line(270, t/2+40+xt, width/2, t/2+40+xt);
  line(270, t/2+80+xt, width/2, t/2+80+xt);
  line(270, t/2+100+xt, width/2, t/2+100+xt);
  line(270, t/2+20+xt, width/2, t/2+20+xt);
  line(270, t/2+ 60+xt, width/2, t/2+60+xt);
  if (mousePressed) {
    xt=700;
  }
  else {
    xt=0;
  }


  //pink   
  stroke(86, 185, 251);
  line(270, 3*t +xt, width/2, 3*t+xt);
  line(270, 3*t+40+xt, width/2, 3*t+40+xt);
  line(270, 3*t+80+xt, width/2, 3*t+80+xt);
  line(270, 3*t+100+xt, width/2, 3*t+100+xt);
  line(270, 3*t+20+xt, width/2, 3*t+20+xt);
  line(270, 3*t+ 60+xt, width/2, 3*t+60+xt);
  if (mousePressed) {
    xt=200;
  }
  else {
    xt=0;
  }







  //  
  float d= frameCount/50;
  float c= cos(70+angle);

  angle= mouseX;




  if (mousePressed) {
    tint(0, 0, 200, 70);
    c = 0;
  }
  else {
    noTint();
  }



  pushMatrix();
  translate(127, 103);
  rotate(d + mouseX/10);
  image(img2, 0, 0, img2.width/2, img2.height/2);
  popMatrix();
  // top right//
  if (mousePressed) {
    tint(0, 0, 200, 70);
  }
  else {
    noTint();
  }
  pushMatrix();
  translate(125, 204);
  rotate(d*38 + mouseX);
  image(img1, 0, 0, img1.width/2, img1.height/2);
  popMatrix();

  pushMatrix();
  translate(125, 299);
  rotate(d+ mouseX/10);
  image(img2, 0, 0, img2.width/2, img2.height/2);
  popMatrix();
  // top right//
  if (mousePressed) {
    tint(0, 0, 200, 70);
    fill(40);
  }
  else {
    noTint();
  }
  pushMatrix();
  translate(126, 508);
  rotate(d*4 + mouseX/200);
  image(img1, 0, 0, img1.width/2, img1.height/2);
  popMatrix();
  ///// Bottom left

  pushMatrix();
  translate(126, 411);
  rotate(d+ mouseX/26);
  image(img2, 0, 0, img2.width/2, img2.height/2);
  popMatrix();
  // top right//
  if (mousePressed) {
    tint(0, 0, 200, 70);
    fill(40);
  }
  else {
    noTint();
  }
  pushMatrix();
  translate(125, 604);
  rotate(d*4 + mouseX/200);
  image(img2, 0, 0, img2.width/2, img2.height/2);
  popMatrix();
}



