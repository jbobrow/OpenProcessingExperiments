
import java.util.Calendar;
import processing.pdf.*;
boolean savePDF = false;

void setup() {
  size(800, 400);
  noCursor();
}
//global variables
int varNumb = 10;
//int vCount;
int subdiv = 1;
float time = 0.2;

int[] codeA = {
  0, 0, 1, 2, 
  1, 2, 0, 0
};
int[] codeB = {
  0, 2, 0, 1, 
  0, 1, 0, 2
};

void microModule(int giveModule, int gridX, int stepX, int subGridX, int gridY, int stepY, int subGridY, int strokeL, int strokeH, float time) {

  float primC = map(mouseX, 0, width, 0, 360);
  float compC = calcCompColor(primC);

  switch(giveModule) {

  case 0:
    // nothing
    break;  
  case 1:
    // horizontal lines
    stroke(primC, 100, 100);
    strokeWeight(6);
    point(gridX+(stepX/subdiv)*subGridX-stepX, gridY+(stepY/subdiv)*subGridY-stepY);
    break;

  case 2:
    // vertical lines
    stroke(compC, 100, 100);
    strokeWeight(1);
    line(gridX+(stepX/subdiv)*subGridX-stepX, gridY+(stepY/subdiv)*subGridY-stepY, 
    mouseX+noise(subGridX,time)*100, mouseY+noise(subGridY,time*2)*100);

    break;
  }
}


void draw() {
  background(360, 0, 0);
  // this line will start pdf export, if the variable savePDF was set to true 
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  colorMode(HSB, 360, 100, 100);
  int strokeL = width / varNumb;
  int strokeH = height / varNumb;
  int stepX = strokeL + 10 / varNumb;
  int stepY = strokeH + 10 / varNumb;
  //  vCount = 0;
  int hCount = 0;
  int hCountSub = 0;
  int vCountSub = 0;
  int giveModule;


  // grid with stepX/Y as spacing and strokeL/H as module lenght
  for (int gridY = 1; gridY < height; gridY += stepY) { // Makro-Grid Y

    for (int gridX = 1; gridX < width; gridX += stepX) { // Makro-Grid X

      if (hCount%2 > 0) { // x0 (A-Modul, makro)

        for (int subGridY = subdiv; subGridY > 0; subGridY --) { // Sub-Grid Y
          for (int subGridX = subdiv; subGridX > 0; subGridX --) { // Sub-Grid X

            if (vCountSub%2 > 0) {
              if (hCountSub%2 > 0) { // x0, y0 (A-Modul, mikro)

                giveModule = codeA[0];
                microModule(giveModule, gridX, stepX, subGridX, gridY, stepY, subGridY, strokeL, strokeH, time);
                giveModule = codeA[1];
                microModule(giveModule, gridX, stepX, subGridX, gridY, stepY, subGridY, strokeL, strokeH, time);
              } // end if hCountSub 
              else { // x1, y0 (A-Modul, mikro)
              giveModule = codeA[2]; // h
              microModule(giveModule, gridX, stepX, subGridX, gridY, stepY, subGridY, strokeL, strokeH, time);
              giveModule = codeA[3]; // v
              microModule(giveModule, gridX, stepX, subGridX, gridY, stepY, subGridY, strokeL, strokeH, time);
            }
          } // end if vCountSub 
          else { // x0, y1 (A-Modul, mikro)
          if (hCountSub%2 > 0) { // x0, y1 (A-Modul, mikro)
            giveModule = codeA[4];
            microModule(giveModule, gridX, stepX, subGridX, gridY, stepY, subGridY, strokeL, strokeH, time);
            giveModule = codeA[5];
            microModule(giveModule, gridX, stepX, subGridX, gridY, stepY, subGridY, strokeL, strokeH, time);
          } else { // x1, y1 (A-Modul, mikro)
            giveModule = codeA[6];
            microModule(giveModule, gridX, stepX, subGridX, gridY, stepY, subGridY, strokeL, strokeH, time);
            giveModule = codeA[7];
            microModule(giveModule, gridX, stepX, subGridX, gridY, stepY, subGridY, strokeL, strokeH, time);
          }
        }

        hCountSub ++;
      } // end for subGridX
      vCountSub ++;
    } // end for subGridY
  } // end if hCount 
  else { // x1 (B-Modul)

  for (int subGridY = subdiv; subGridY > 0; subGridY --) { // Sub-Grid Y
    for (int subGridX = subdiv; subGridX > 0; subGridX --) { // Sub-Grid X

      if (vCountSub%2 > 0) {
        if (hCountSub%2 > 0) { // x0, y0 (B-Modul, mikro)

          giveModule = codeB[0];
          microModule(giveModule, gridX, stepX, subGridX, gridY, stepY, subGridY, strokeL, strokeH, time);
          giveModule = codeB[1];
          microModule(giveModule, gridX, stepX, subGridX, gridY, stepY, subGridY, strokeL, strokeH, time);
        } // end if hCountSub 
        else { // x1, y0 (B-Modul, mikro)

        giveModule = codeB[2];
        microModule(giveModule, gridX, stepX, subGridX, gridY, stepY, subGridY, strokeL, strokeH, time);
        giveModule = codeB[3];
        microModule(giveModule, gridX, stepX, subGridX, gridY, stepY, subGridY, strokeL, strokeH, time);
      }
    } // end if vCountSub 
    else { // x0, y1 (B-Modul, mikro)
    if (hCountSub%2 > 0) { // x0, y1 (B-Modul, mikro)
      giveModule = codeB[4];
      microModule(giveModule, gridX, stepX, subGridX, gridY, stepY, subGridY, strokeL, strokeH, time);
      giveModule = codeB[5];
      microModule(giveModule, gridX, stepX, subGridX, gridY, stepY, subGridY, strokeL, strokeH, time);
    } else { // x1, y1 (A-Modul, mikro)
      giveModule = codeB[6];
      microModule(giveModule, gridX, stepX, subGridX, gridY, stepY, subGridY, strokeL, strokeH, time);
      giveModule = codeB[7];
      microModule(giveModule, gridX, stepX, subGridX, gridY, stepY, subGridY, strokeL, strokeH, time);
    }
  }

  hCountSub ++;
} // end for subGridX
vCountSub ++;
} // end for subGridY
}

hCount ++;
}
}
// end grid

time += 0.8;

// end of pdf recording
if (savePDF) {
  savePDF = false;
  endRecord();
}

} // end draw()



float calcCompColor(float baseC) { 
  // Function to calculate the complementary color of a hue value
  baseC += 180;
  if (baseC > 360) {
    baseC -= 360;
  }
  return baseC;
}


void mouseClicked() {
float chanceA = 3;
float chanceB = 3;
  
  
  codeA[0] = int(random(0, chanceA));
  codeA[1] = int(random(0, chanceA));
  codeA[2] = int(random(0, chanceA));
  codeA[3] = int(random(0, chanceA));
  codeA[4] = int(random(0, chanceA));
  codeA[5] = int(random(0, chanceA));
  codeA[6] = int(random(0, chanceA));
  codeA[7] = int(random(0, chanceA));

  codeB[0] = int(random(0, chanceB));
  codeB[1] = int(random(0, chanceB));
  codeB[2] = int(random(0, chanceB));
  codeB[3] = int(random(0, chanceB));
  codeB[4] = int(random(0, chanceB));
  codeB[5] = int(random(0, chanceB));
  codeB[6] = int(random(0, chanceB));
  codeB[7] = int(random(0, chanceB));
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      if (varNumb >= 40) {
        //        varNumb = 10;
      } else {
        varNumb += 1;
      }
    } else if (keyCode == DOWN) {
      if (varNumb <= 1) {
        //        varNumb = 10;
      } else {
        varNumb -= 1;
      }
    }
  } else {
    if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
    if (key=='p' || key=='P') savePDF = true;
  }
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}



