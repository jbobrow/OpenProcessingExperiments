
int quantes =5;
int sz= 20;

float [] px = new float [quantes];
float [] py = new float [quantes];
float [] velx = new float [quantes];
float [] vely = new float [quantes];

void setup () {
  size(300, 200);
  prou = loadImage("Girl-Shoots-Self-Regular.jpg"); //images
  troll = loadImage("Troll_face.png");
  for (int i=0; i<quantes; i++) {   //incia bluce magic
    px [i] = width/2;
    py [i] = mouseY;
    velx [i] = random(-5,12);
    vely [i] = random(-5,12);
  }
}

void mousePressed() {
  for (int i=0; i<quantes; i++) {   //incia bluce magic
    px [i] = mouseX;
    py [i] = mouseY;
    velx [i] = random(-5, 12);
    vely [i] = random(-5, 12);
  }
}

void draw () {
  background(0);
  prou.resize (width, height);
  troll.resize (sz, sz);
  if (mousePressed) {
    image(prou, 0, 0);
  }
  if (mousePressed) {
    frameRate(30);
    for (int i=0; i<quantes; i++) {

      px [i] += velx[i]; 
      py [i] += vely[i];

      if ((px[i]<0)||(px[i]>width)) {
        velx[i] = -velx[i];
      }
      if ((py[i]<0)||(py[i]>height)) {
        vely[i] = -vely[i];
      }
    
      image(troll,random (mouseX+100),random (mouseY+100));
    }
  }else {
    for (int i=0; i<quantes; i++) {

      px [i] += velx[i]; 
      py [i] += vely[i];

      if ((px[i]<0)||(px[i]>width)) {
        velx[i] = -velx[i];
      }
      if ((py[i]<0)||(py[i]>height)) {
        vely[i] = -vely[i];
      }
      strokeWeight(6);
      stroke(random(-255, 0, 0));
      ellipse(px[i], py[i], sz, sz);
    }
  }
}



