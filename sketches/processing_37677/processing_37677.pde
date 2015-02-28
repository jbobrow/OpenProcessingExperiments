
class RelojCir {
  SegMill segm;

  RelojCir() {
    segm = new SegMill();
  }

  void draw() {
    strokeCap(SQUARE);
    int s = second();  // Values from 0 - 59
    int m = minute();  // Values from 0 - 59
    int h = hour();    // Values from 0 - 23

    pushMatrix();
    translate(width/2, height/2);
    rotate(-PI/2);
    //5 minutos/segundos
    stroke(30,map(mouseX,0,width,0,255));
    for (float i=0;i<12;i=i+1) {
      rotate(PI/6);
      line(230, 0, 270, 0);
    }
    //minutos/segundos
    stroke(150,map(mouseX,0,width,0,255));
    strokeWeight(0.75);
    for (float i=0;i<60;i=i+1) {
      rotate(PI/30);
      line(260, 0, 270, 0);
    }

    segm.draw();

    //segundo
    pushMatrix();
    strokeWeight(2);
    rotate(map(millis(), 0, 59000, 0, (TWO_PI-(TWO_PI* -60))));
    for (int i=0;i<45;i++) {
      rotate(0.015);
      stroke(255,map(mouseX,0,width,0,1+i*1.05));
      line(0, 0, 260, 0);
    }
    popMatrix();

    //minuitos
    pushMatrix();
    stroke(50,0,0,map(mouseX,0,width,0,255));
    strokeWeight(6);
    rotate(map(m, 0, 59, 0, TWO_PI-(TWO_PI/60)));
    line(0, 0, 130, 0);
    popMatrix();

    //horas
    pushMatrix();
    stroke(50,0,0,map(mouseX,0,width,0,255));
    strokeWeight(6);
    rotate(map(h, 0, 11, 0, TWO_PI+(TWO_PI/12)));
    line(0, 0, 100, 0);
    popMatrix();

    popMatrix();

    println(s);
  }
}


