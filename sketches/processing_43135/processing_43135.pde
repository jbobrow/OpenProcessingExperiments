
int k, l, m, n, o, p;
int numX = 15;
int numY = 10;
int fraW = 40;
int fraH = 40;
//float shake;
int w = 26;
int h = 26;
float[] posX = new float[numX];
float[] posY = new float[numY];

import ddf.minim.*;
AudioPlayer press;
AudioPlayer free;
Minim minim;

void setup() {
  size(600, 400);
  noFill();
  smooth();
  frameRate(50);
  //noCursor();

  minim = new Minim(this);  
  press = minim.loadFile("laughter.mp3");
  free = minim.loadFile("consoling.mp3");
}

void draw() {
  background(50);
  stroke(255, 250, 80);

  for (int i = 0; i < numX; i++) {
    for (int j = 0; j < numY; j++) {
      stroke(255, 250, 80);
      noFill();

      // top left corner position of the head
      posX[i] = i*fraW+(fraW-w)/2+random(-3, 3);
      posY[j] = j*fraH+(fraH-h)/2+random(-3, 3);

      if (mousePressed == false) {
        
        //play consoling
        free.play();
        
        //stop laughter
        press.rewind();
        press.play();

        // head
        ellipseMode(CORNER);
        ellipse(posX[i], posY[j], w, h);           

        // eyes
        line(posX[i]+w*2/5, posY[j]+h/5, posX[i]+w*2/5, posY[j]+h/2.5);
        line(posX[i]+w*3/5, posY[j]+h/5, posX[i]+w*3/5, posY[j]+h/2.5); 

        //mouth sad
        curve(posX[i]+w/5, posY[j]+h+h/2, posX[i]+w/5, posY[j]+h-h*2/7, posX[i]+w*4/5, posY[j]+h-h*2/7, posX[i]+w*4/5, posY[j]+h+h/2);
      }

      // pick one man
      if (mouseX >= i*fraW && mouseX <= (i+1)*fraW) {
        if (mouseY >= j*fraH && mouseY <= (j+1)*fraH) {
          int[] a = new int[i];
          int[] b = new int[j];
          for (int a1 = 0; a1 < i; a1++) {
            for (int b1 = 0; b1 < j; b1++) {
              a[a1] = i;
              b[b1] = j;
              k = max(a);
              l = max(b);
              
              //create the picked man
              if (mousePressed) {

                //play laughter, stop consoling
                free.rewind();
                free.play();

                // head
                ellipse(posX[i], posY[j], w, h);    

                // eyes smile
                line(posX[i]+w/5, posY[j]+h*1.5/5, posX[i]+w*2/5, posY[j]+h*1.5/5);
                line(posX[i]+w*3/5, posY[j]+h*1.5/5, posX[i]+w*4/5, posY[j]+h*1.5/5); 

                //mouth smile
                curve(posX[i]+w/5, posY[j]-h/2, posX[i]+w/5, posY[j]+h*4/7, posX[i]+w*4/5, posY[j]+h*4/7, posX[i]+w*4/5, posY[j]-h/2);
              }
            }
          }
        }
      }
    }
  }
}


