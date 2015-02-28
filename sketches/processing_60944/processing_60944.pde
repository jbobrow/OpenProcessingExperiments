
    int nr = 4; // Anzahl
    float fpx = 50; // flapposition x
     float farbe = 40;

    void setup() {
      size(600, 600);
      smooth();
    }
    
    
    void draw() {
      background(9, 84, 47);
      for (int i=0; i< nr; i++) {
        for (int j=0; j< nr; j++) {
          window (i*(width/nr), j*(height/nr));
          
          fpx = 50; // flapposition x  
        //  float d = dist(i*(width/nr)+50+20, j*(height/nr)+50+30, mouseX, mouseY); 
           float d = dist(i*(width/nr)+70, j*(height/nr)+80, mouseX, mouseY); 
          println(mouseX+"  "+mouseY);
          if (d<40)
            
            fpx=90;// = nfpn;
          //farbe = farbe+random(255);
          flap (i*(width/nr), j*(height/nr));
        }
      }
    }
    void window (float x, float y)
    {
      pushMatrix();
      translate(x, y);
      stroke(255);
      strokeWeight(3);
      fill(182, 218, 234);
      rect(50, 50, 40, 60);
      noFill();
      stroke(255);
      strokeWeight(3);
      line(70, 51, 70, 109);
      line(51, 80, 89, 80);
      popMatrix();
    }
    void flap (float x, float y)
    {
      pushMatrix();
      translate(x, y);
      fill(95, 64, farbe);
      // rect(fpx, fpy, 40, 60);
      rect(fpx, 50, 40, 60); 
      popMatrix();
    }

