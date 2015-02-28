
float tunnelWidth[] = {40,75};
float lightWidth[] = {15,25};
int tunnelX = 50;
int tunnelY = 50;
int rowNum = 0;
int counter = 0;

tunnel[] myTunnel = new tunnel[25];

void setup() {
  background(0);
  size(500, 500);
  for (int i = 0; i < myTunnel.length; i ++ ) {
    myTunnel[i] = new tunnel (
    random(tunnelWidth[0], tunnelWidth[1]), 
    random(lightWidth[0], lightWidth[1])
      );
  }
    background(0);
    for (int i = 0; i< myTunnel.length; i ++ ) {
      pushMatrix();
      translate(50, 0);
      tunnelX = 100 * counter;
      counter++;
      myTunnel[i].run();
      popMatrix();
      if (counter == 5) {
        tunnelY = tunnelY + 100;
        counter = 0;
      }
    }
  }


  class tunnel {
    
    float tunnelWidth;
    float lightWidth;


    tunnel(float _tunnelWidth, float _lightWidth) {
      tunnelWidth = _tunnelWidth;
      lightWidth = _lightWidth;
    }

    void run(){
      display();
    }


    void display(){
      translate (-10, 0);
      noStroke();

      fill(255);



      //tunnel grey

      translate(0, 0);
      fill(100);
      rect(tunnelX, tunnelY, tunnelWidth, tunnelWidth);

      //light
      pushMatrix();
      translate(30, 20);
      fill(255);
      rect(tunnelX, tunnelY, lightWidth, lightWidth);
      popMatrix();
    }
  }





