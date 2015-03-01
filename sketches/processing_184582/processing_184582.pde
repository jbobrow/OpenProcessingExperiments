
float [] posicioXBoles = new float [10];
float [] posicioYBoles = new float [10];

float [] velocitatXBoles = new float [10];
float [] velocitatYBoles = new float [10];

float [] midaBoles = new float [5];

float [] colorBoles1 = new float [3];
float [] colorBoles2 = new float [3];
float [] colorBoles3 = new float [3];

color Boles = color(random(0, 255), random (0, 255), random (0, 255));

float vel = 10;



void setup () {
  size (600, 400);


  //bucles per donar valor inicial
  for (int i=0; i<midaBoles.length; i++ ) {
    midaBoles[i]=random (10, 50);
  }
  for (int i=0; i<velocitatXBoles.length; i++ ) {

    velocitatXBoles[i]=random (-vel, vel);

    //Perque velocitatXBoles no sigui 0
    while (velocitatXBoles[i]>-2 && velocitatXBoles[i]<2) {
      velocitatXBoles[i]=random (-vel, vel);
    }

    velocitatYBoles[i]=random (-vel, vel);

    //Perque velocitatYBoles no sigui 0
    while (velocitatYBoles[i]>-2 && velocitatYBoles[i]<2) {
      velocitatYBoles[i]=random (-vel, vel);
    }
  }
  for (int i=0; i< posicioXBoles.length; i++) {
    posicioXBoles[i]=width/2;
    posicioYBoles[i]=height/2;
  }
}


void draw () {
  background (0);
  fill (Boles);


  //Bucle per crear les boles. midaBoles es 5, així que sempre serà [i/2].
  for (int i=0; i<posicioXBoles.length; i++) {

    //Perque es moguin
    posicioXBoles[i]= posicioXBoles[i]+velocitatXBoles[i];
    posicioYBoles[i] = posicioYBoles[i]+velocitatYBoles[i];

    //Limits horitzontals
    if (posicioXBoles[i]+midaBoles[i/2]/2>width || posicioXBoles[i]-midaBoles[i/2]/2<0) {
      velocitatXBoles[i]=-velocitatXBoles[i];
    }

    //Limits verticals
    if (posicioYBoles[i]+midaBoles[i/2]/2>height || posicioYBoles[i]-midaBoles[i/2]/2<0) {
      velocitatYBoles[i]=-velocitatYBoles[i];
    }

    //dibuix ellipse


    ellipse (posicioXBoles[i], posicioYBoles[i], midaBoles[i/2], midaBoles[i/2]);
  }
  //Fi bucle
}








void mouseReleased () {

  for (int j=0; j<colorBoles1.length; j++ ) {
    colorBoles1[j]= random(0, 255);
    colorBoles2[j]= random(0, 255);
    colorBoles3[j]= random(0, 255);
    Boles = color(colorBoles1[j], colorBoles2[j], colorBoles3[j]);

    for (int i=0; i<midaBoles.length; i++ ) {
      midaBoles[i]=random (10, 50);
    }
    for (int i=0; i<velocitatXBoles.length; i++ ) {

      velocitatXBoles[i]=random (-vel, vel);

      //Perque velocitatXBoles no sigui 0
      while (velocitatXBoles[i]>-2 && velocitatXBoles[i]<2) {
        velocitatXBoles[i]=random (-vel, vel);
      }

      velocitatYBoles[i]=random (-vel, vel);

      //Perque velocitatYBoles no sigui 0
      while (velocitatYBoles[i]>-2 && velocitatYBoles[i]<2) {
        velocitatYBoles[i]=random (-vel, vel);
      }
    }
    for (int i=0; i< posicioXBoles.length; i++) {
      posicioXBoles[i]=mouseX;
      posicioYBoles[i]=mouseY;
    }
  }
}

