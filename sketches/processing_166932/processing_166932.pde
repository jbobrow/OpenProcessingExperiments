
float[] xpos = new float[50];
float[] ypos = new float[50];


void setup() {
  size(600, 400);
  for (int i= 0; i<50; i ++) {
    xpos[i]=random(width);
      ypos[i]=random(height);
      }
    }
    void draw() {
      fill(0, 10);
      rect(0, 0, width, height);

      for (int i = 0; i< 50; i++) {
        fill(10, 255, 10);
        int randomNum = int(random(0,200));
        char randomCharacter= char(randomNum);
        text( randomNum , xpos[i], ypos[i]);
        ypos[i] += 1.2;
          if (ypos[i] > height) ypos[i]=0;
      }
    }

