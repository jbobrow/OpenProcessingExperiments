
int diameter, flag;
int counter=0;
float inc, xpos, ypos, x, z;
float xspace=30;
float amplitude = 50;
float angle=0;
float filler, funk;
float factor;


void setup() {
  size(640, 430);
  smooth();
  noStroke();
}

void draw() {
  background(0);
  funk=abs(sin(z*0.0007))*10; //0.007 = slow factor
  filler=map(funk, 0, 10, 0, 255);
  factor=map(mouseY, 0, 360, 1, 2);

  fill(filler, mouseY, mouseX);
  if (mousePressed) {
    //    println("WAVE REVERSAL");
    drawRevWave2();
  } else {
    drawWave();
  }
  angle+=1;
  //delay(1);
  //  println(funk);
}

void drawWave() {

  for (int x=0; x<20; x++) {
    //    println(abs(sin(z))*10);
    for (int y=0; y<13; y++) {
      //      z+=angle/(1000);
      z+=sin(angle*0.0003)*(TWO_PI/100);
      ypos = sin(z)*amplitude*factor;
      xpos = x*xspace+30;
      //       print("sin z ");
      //       println(sin(z));

      //       print("z ");
      //       println(z);
      //      print("x ");
      //      println(x);


      ellipse(xpos, height/2+ypos, 16, 16);
      //      counter++;
      //      if (counter==1000) {
      //        flag=1;
      //      }
    }
  }
}


void drawRevWave2() {

  for (int x=0; x<20; x++) {
    //    println(abs(sin(z))*10);
    for (int y=0; y<13; y++) {
      //      z-=TWO_PI/10;
      z-= sin(angle*0.0008)*(TWO_PI/100);
      //      ypos = sin(z*0.08)*amplitude*factor;
      //      xpos = x*xspace+30;
      ypos = sin(z)*amplitude*factor;
      xpos = x*xspace+30;
      //       print("sin z ");
      //       println(sin(z));
//
//      print("Y POS : ");
//      println(ypos);
      //      print("x ");
      //      println(x);


      ellipse(xpos, height/2+ypos, 16, 16);
      //      counter++;
      //      if (counter==1000) {
      //        flag=1;
      //      }
    }
  }
}



void drawRevWave() {

  for (int x=0; x<20; x++) {
    for (int y=0; y<13; y++) {
      z-=angle/(1000);
      ypos = sin(z)*amplitude;
      xpos = x*xspace-30;

      ellipse(xpos, height/2+ypos, 16, 16);
      println("WAVE REVERSAL");
      print("z// ");
      println(z);
      //      counter--;
      //      if (counter==0) {
      //        flag=0;
      //        println("FLAG=0!!");
      //      }
    }
  }
}







void delay(int delay)
{
  int time = millis();
  while (millis () - time <= delay);
}
