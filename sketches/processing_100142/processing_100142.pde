
float posix1;
float posix2;
float posix3;
float posix4;
float posiy1;
float posiy2;
float posiy3;
float posiy4;
float acumulador;
float funcionloca;
float velx;
float vely;
float elipseX;
float elipseY;


void setup () {
  size (1024, 576);
  background (255);
  posix1=width/3;
  posix2=width/2;
  posix3=width-width/3;
  posix4=width/2;
  posiy1=height/2;
  posiy2=height/3;
  posiy3=height/3;
  posiy4=height/2;
  velx=2;
  vely=2;
  elipseX=width/2;
  elipseY=height/2;
}

void draw () {

  stroke (0, 127);
  strokeWeight (.1);
  smooth ();
  //noFill();
  //fill (255, 50);

  if (mousePressed) {
    fill (102, 102, 153, 127);
  }
  else {
    fill (255, 127);
  }


  beginShape();
  vertex(posix1, posiy1);
  vertex(posix2, posiy2);
  vertex(posix3, posiy3);
  vertex(posix4, posiy4);
  endShape(CLOSE);

  acumulador=acumulador+1;

  if (mousePressed) {
    //funcionloca=2; //no me anda bien
    //funcionloca=sin(acumulador)*10;
    //
    //funcionloca=1;    
    //posix1=width/2;
    //posiy1=height/2;
  }
  else {
    funcionloca=0;
  }

  //println (funcionloca);



  posix1=posix1+funcionloca+velx;
  posiy1=posiy1+funcionloca-vely;
  posix3=posix3+funcionloca+velx;
  posiy3=posiy3+funcionloca-vely;
  posix2=posix2+funcionloca-velx;
  posiy2=posiy2+funcionloca+vely;
  posix4=posix4+funcionloca-velx;
  posiy4=posiy4+funcionloca+vely;

  if (posix1>width || posix1<0 || posix3>width || posix3<0) {
    velx = velx * -1;
  }

  if (posiy1>height || posiy1<0 || posiy3>height || posiy3<0) {
    vely = vely*-1;
  }

  //pelotas locas

  /*if (mousePressed) {
   fill (255, 216, 17, map(funcionloca, -10, 10, 0, 255));
   stroke (255, 77, 17, map(funcionloca, -10, 10, 0, 255));
   strokeWeight (10);
   
   ellipse (elipseX, elipseY, 40, 40);
   elipseX=mouseX+velx;
   elipseY=mouseY+vely;
   }*/

  //triangulo 1
  if (keyPressed==true && key=='w') {
    fill (255, 216, 17);
    stroke (255, 77, 17, 50);
    strokeWeight (2);

    triangle (posix3, posiy3, posix2, posiy2, width/2, height/2);

    fill (255, 216, 17);
    stroke (255, 77, 17, 50);
    strokeWeight (2);

    triangle (posix1, posiy1, posix2, posiy2, width, 0);
  }

  //triangulo 2
  if (keyPressed==true && key=='q') {
    fill (0, 204, 204);
    stroke (166, 30, 98);
    strokeWeight (2);

    triangle (posix4, posiy4, posix3, posiy3, posix1, posiy1);


    fill (#536e7f);
    stroke (#003366);
    strokeWeight (2);

    triangle (posix4, posiy4, posix3, posiy3, 0, height);

    fill (#ff3366, 40);
    stroke (#ff6600);
    strokeWeight (2);

    triangle (posix4, posiy4, posix3, posiy3, 0, 0);
    
    fill (#00cc00, 40);
    stroke (#006633);
    strokeWeight (2);

    triangle (posix1, posiy1, posix3, posiy3, width, height);
    
  }
}

void keyPressed () { //puede usarse tambien "mousePressed"
  if (key=='s') {
    saveFrame ("img.png");
  }
}



