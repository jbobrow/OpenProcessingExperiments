
// SOS iDesign
// Name: LIM Hyun Seung
// ID: 201420104

import ddf.minim.*;

Minim minim;
AudioPlayer song1, song2;
AudioInput input;

float angle, alpha;
float x, y;
float dia;

boolean bc = true;
boolean dir = true;
boolean backGround = true;
boolean backGround2 = true;
//===============================================
void setup () {
  size (displayWidth, displayHeight, P3D);
  background(125, 0, 0);
  smooth();
  noCursor();

  minim = new Minim(this);
  song1 = minim.loadFile("a.mp3");
  song2 = minim.loadFile("b.mp3");
  input = minim.getLineIn (Minim.MONO, 512);
}

//===============================================
void draw () {
  lights();
  if (backGround) background(0);
  if (dir) angle += 1;
  if (!dir) angle -= 1;

  fill(255);
  if (key=='1') {
    textAlign(LEFT);
    text(song1.getMetaData().title(), 20, 20);
    text(song1.getMetaData().author(), 20, 40);
    float d = song1.mix.level()*50;
    dia = dia*0.9+d*0.9;
  }

  if (key=='2') {
    textAlign(LEFT);
    text(song2.getMetaData().title(), 20, 20);
    text(song2.getMetaData().author(), 20, 40);
    float d = song2.mix.level()*250;
    dia = dia*0.9+d*0.9;
  }

  if (key=='3') {
    float d = input.mix.level()*50;
    dia = dia*0.9+d*0.9;
  }

  //println(dia);


  pushMatrix();
  //translate(width/2, height/2);
  translate(mouseX, mouseY);

  for (float i=0; i<1; i++) {
    rotate(-radians(angle));
    if (!dir) {
      stroke (155-dia, 0, dia, 100);
      strokeWeight(1);
      noFill ();
      bezier (100, 0, dia, dia-50, dia+50, 0, dia*4, 0);
    }

    pushMatrix();
    translate(dia*4, 0);
    for (int j=0;  j<50; j+=10) {
      rotate(radians(angle));
      scale(0.6);
      noStroke();
      if (bc) fill (255, 0, float(j)*1.5-dia, dia);
      if (!bc) fill (255);
      box(21);
      pushMatrix();

      for (int k=0;  k<100; k+=5) {
        translate(dia*3, 0);
        rotate(radians(alpha));
        scale(0.9);
        noStroke();
        if (bc) fill (0, float(k)*2.5, 255-dia);
        if (!bc) fill (255);
        box(dia);
      }
      popMatrix();
    }
    popMatrix();
  }
  /*
  
   */
  alpha++;

  popMatrix();
  title();
}

//===============================================
void keyPressed() {
  if (key=='1') {
    song1.play();
    song1.loop();
    song2.pause();
  }
  if (key=='2') {
    song2.play();
    song2.loop();
    song1.pause();
  }
  if (key=='3') {
    song1.pause();
    song2.pause();
  }
  if (keyCode==TAB) backGround = !backGround;
  if (keyCode==SHIFT)  backGround = !backGround2;
  if (key=='4') bc = !bc;
  if (!backGround) background(#108F97);
  if (!backGround2) background(0, 0, 0);
  if ((keyCode==LEFT) || (keyCode==RIGHT)) dir = !dir;
  if (key=='s') saveFrame("Images/frame_#####.jpg");
}

void title() {

  fill(255);
  textSize(18);
  textAlign(LEFT);
  text("Press1=Music1/Press2=Music2/TAB=Background Red ", 50, height-120);
  text("Press Left,RightKey=Transformation Box Form", 50, height-30);
  text("Press3=Mic", 50, height-90);
  text("Press4=Box ColorChange", 50, height-60);

  textAlign(RIGHT);
  text("2014. Dynamic Media LIM Hyunseung ", width-50, height-50);
}

