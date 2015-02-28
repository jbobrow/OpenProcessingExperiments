
PImage face;
int faceNum=15;
PImage [] faces=new PImage[faceNum];
float [] faceXpos=new float[faceNum];
String [] filename=new String[faceNum];
float faceXspeed=.25;



void setup() {
  size(1875, 125);
  for (int i=0; i<faceNum; i++) {
    filename[i] = "face0" + int(random(1, 7)) + ".png";
    faces[i]=loadImage(filename[i]);
    faceXpos[i]=(width/faceNum)*i;
  }
}


void draw() {
  for (int i=0; i<faceNum; i++) {
    image(faces[i], faceXpos[i], 0, 125, 125);
  }

  for (int i=0; i<faceNum; i++) {
    faceXpos[i]=faceXpos[i]-faceXspeed;

    if (faceXpos[i]<-125) {
      faces[i]=loadImage("face0" + int(random(1, 7)) + ".png");
      faceXpos[i]=float(width)-125;
    }
  }
}



void keyPressed() {
 if(key=='s') {
   save("faces4.tiff");
 }
}

