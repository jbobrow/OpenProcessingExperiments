
//Steve
    int xPs= 0;
    int yPs= 0;
    int rAs=0;
    int sPs=1; 
    int imageNumber = 0;
    Cloud Cloud1;
    //********************************************************************************
    void setup() {
      size (500, 500);
      frameRate(15);
      background(#9CE5EA);
      Cloud1 = new Cloud(color(255, 0, 0), 0, 100, 2);
    }
    //********************************************************************************
    void draw() {
      background(#9CE5EA);

      Cloud1.move();
      Cloud1.display();
      
      if (!mousePressed) {
        yPs++;
        SteveStopped(xPs, yPs, rAs, sPs, imageNumber);
        }
        else
        {
        Steve(xPs, yPs, rAs, sPs, imageNumber);
        }
    }
    //********************************************************************************
    void Steve(int xPs, int yPs, int rPs, int sPs, int i) {
      pushMatrix();
      translate(250, yPs);
      scale(2);
      stroke(#000000);
      if (imageNumber == 0) {
        //  first image
        quad(0, 0, 20, -20, 30, -10, 10, 10);
        quad(0, 0, -20, -20, -30, -10, -10, 10);
        rect(-12, -12, 25, 35);
        ellipse(0, -23, 30, 30);
        rect(-12, 23, 13, 20);
        rect(0, 23, 13, 20);
        imageNumber= imageNumber + 1;
      }
      else if (imageNumber == 4) {
        //Mid image 2
        rect(-35, -5, 70, 15);
        rect(-12, -12, 25, 35);
        ellipse(0, -23, 30, 30);
        rect(-12, 23, 13, 20);
        rect(0, 23, 13, 20);
        imageNumber = 0;
      }
      else if (imageNumber == 1) {
        //Mid image
        rect(-35, -5, 70, 15);
        rect(-12, -12, 25, 35);
        ellipse(0, -23, 30, 30);
        rect(-12, 23, 13, 20);
        rect(0, 23, 13, 20);
        imageNumber = 2;
      }
      else if (imageNumber == 2) {
        // second image
        background(#9CE5EA);
        quad(0, 0, 10, -10, 28, 15, 18, 23);
        quad(0, 0, -10, -10, -28, 15, -18, 23);
        rect(-12, -12, 25, 35);
        ellipse(0, -23, 30, 30);
        rect(-12, 23, 13, 20);
        rect(0, 23, 13, 20);
        imageNumber = 4;
      }
      popMatrix();
    }
    
    void SteveStopped(int xPs, int yPs, int rPs, int sPs, int i) {
      pushMatrix();
      translate(250, yPs);
      scale(2);
      stroke(#000000);
      if (imageNumber == 0) {
        //  first image
        quad(0, 0, 20, -20, 30, -10, 10, 10);
        quad(0, 0, -20, -20, -30, -10, -10, 10);
        rect(-12, -12, 25, 35);
        ellipse(0, -23, 30, 30);
        rect(-12, 23, 13, 20);
        rect(0, 23, 13, 20);
        //imageNumber= imageNumber + 1;
      }
      else if (imageNumber == 4) {
        //Mid image 2
        rect(-35, -5, 70, 15);
        rect(-12, -12, 25, 35);
        ellipse(0, -23, 30, 30);
        rect(-12, 23, 13, 20);
        rect(0, 23, 13, 20);
        //imageNumber = 0;
      }
      else if (imageNumber == 1) {
        //Mid image
        rect(-35, -5, 70, 15);
        rect(-12, -12, 25, 35);
        ellipse(0, -23, 30, 30);
        rect(-12, 23, 13, 20);
        rect(0, 23, 13, 20);
        //imageNumber = 2;
      }
      else if (imageNumber == 2) {
        // second image
        background(#9CE5EA);
        quad(0, 0, 10, -10, 28, 15, 18, 23);
        quad(0, 0, -10, -10, -28, 15, -18, 23);
        rect(-12, -12, 25, 35);
        ellipse(0, -23, 30, 30);
        rect(-12, 23, 13, 20);
        rect(0, 23, 13, 20);
        //imageNumber = 4;
      }
      popMatrix();
    }
    
    //******************************************************************************
    class Cloud {
      color c;
      float xpos;
      float ypos;
      float xadd=2;
      Cloud(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
        c = tempC;
        xpos = tempXpos;
        ypos = tempYpos;
      }
      void display () {
        pushMatrix();
        translate(xpos, 100);
        scale(2);
        stroke(#FFFFFF);
        ellipse(-7+0, -3, 25, 25);
        ellipse(7+0, -3, 25, 25);
        ellipse(15+0, 10, 20, 20);
        ellipse(0+0, 10, 20, 20);
        ellipse(-15+0, 10, 20, 20);
        popMatrix();
      }
      void move() {
       xpos = xpos + xadd;
       if (xpos+35 > width) {
           xadd=-abs(xadd);
       }
       if (xpos-15<0) {
           xadd=abs(xadd);
        }   
      }
    } // class
    //
