
Burbuja b1 = new Burbuja();
Burbuja b2 = new Burbuja();
Burbuja b3 = new Burbuja();
Burbuja b4 = new Burbuja();
Burbuja b5 = new Burbuja();
Burbuja b6 = new Burbuja();
Burbuja b7 = new Burbuja();

void setup () {
  size (1024, 576);

  b1 = new Burbuja ();
  b1.Colorfill=#EAFFFE;
  b1.arranca();
  b1.radius=100;


  b2 = new Burbuja ();
  b2.Colorfill=#BAD6D4;
  b2.arranca();
  b2.radius=110;


  b3 = new Burbuja ();
  //b3.Colorfill=#5C958E;
  b3.Colorfill=#FF3300;
  b3.arranca();
  b3.radius=120;


  b4 = new Burbuja ();
  b4.Colorfill=#F0D800;
  b4.arranca();
  b4.radius=130;

  b5 = new Burbuja ();
  b5.Colorfill=#B40000;
  b5.arranca();
  b5.radius=220;


  b6 = new Burbuja ();
  b6.Colorfill=#8B0000;
  b6.arranca();
  b6.radius=230;


  b7 = new Burbuja ();
  b7.Colorfill=#4D001E;
  b7.arranca();
  b7.radius=235;


  frameRate(30);
  noStroke();
  noCursor();
}

void draw () {
  
  noStroke();
  background(#640101);
  //fill(#640101, 30);
  //rect(0, 0, width, height);
  
  b7.mover();
  b7.dibuja();

  b6.mover();
  b6.dibuja();

  b5.mover();
  b5.dibuja();

  b4.mover();
  b4.dibuja();

  b3.mover();
  b3.dibuja();

  b2.mover();
  b2.dibuja();

  b1.mover();
  b1.dibuja();
  
  noFill();
  stroke(255);
  strokeWeight(2);
  ellipse(mouseX, mouseY, 30, 30);
}

class Burbuja {
  float centerX = 0, centerY = 0;

  float radius = 60, rotAngle = -90;
  float accelX, accelY;
  float springing = .082, damping = .65;

  //corner nodes
  int nodes = 4;
  float nodeStartX[] = new float[nodes];
  float nodeStartY[] = new float[nodes];
  float[]nodeX = new float[nodes];
  float[]nodeY = new float[nodes];
  float[]angle = new float[nodes];
  float[]frequency = new float[nodes];

  // soft-body dynamics
  float organicConstant = -.01;

  //estilos de la instancia

  color Colorfill;



  Burbuja () {
  }


  void dibuja () {
    //  calculate node  starting locations
    for (int i=0; i<nodes; i++) {
      nodeStartX[i] = centerX+cos(radians(rotAngle))*radius;
      nodeStartY[i] = centerY+sin(radians(rotAngle))*radius;
      rotAngle += 360.0/nodes;
    }

    // draw polygon
    curveTightness(organicConstant);
    fill(Colorfill);
    beginShape();
    for (int i=0; i<nodes; i++) {
      curveVertex(nodeX[i], nodeY[i]);
    }
    for (int i=0; i<nodes-1; i++) {
      curveVertex(nodeX[i], nodeY[i]);
    }
    endShape(CLOSE);
  }


  void arranca () {
    centerX = width/2;
    centerY = height/2;
    //center shape in window
    centerX = width/2;
    centerY = height/2;
    // iniitalize frequencies for corner nodes
    for (int i=0; i<nodes; i++) {
      frequency[i] = random(40, 50);
    }
  }


  void mover () {
    //move center point
    float deltaX = mouseX-centerX;
    float deltaY = mouseY-centerY;

    // create springing effect
    deltaX *= springing;
    deltaY *= springing;
    accelX += deltaX;
    accelY += deltaY;

    // move predator's center
    centerX += accelX;
    centerY += accelY;

    // slow down springing
    accelX *= damping;
    accelY *= damping;

    // change curve tightness

    organicConstant = -.6 -((abs(accelX)+abs(accelY))*.02);
    //println((abs(accelX)+abs(accelY))*.1);
    //move nodes
    for (int i=0; i<nodes; i++) {
      nodeX[i] = nodeStartX[i]+sin(radians(angle[i]))*(accelX*2);
      nodeY[i] = nodeStartY[i]+sin(radians(angle[i]))*(accelY*2);
      angle[i]+=frequency[i];
    }
  }
} //end Class



