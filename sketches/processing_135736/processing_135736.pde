
float tunnelWidth[] = {40,75};
float lightWidth[] = {15,25};

tunnel myTunnel;

void setup() {
  background(0);
  frameRate(3);
  size(100, 100);
  }

  void draw() {
    background(0);
    myTunnel = new tunnel(
    random(tunnelWidth[0], tunnelWidth[1]), 
    random(lightWidth[0], lightWidth[1])
      );
    myTunnel.run();
  }


class tunnel {
  float tunnelWidth;
  float lightWidth;


  tunnel(float _tunnelWidth, float _lightWidth) {
    tunnelWidth = _tunnelWidth;
    lightWidth = _lightWidth;
  }

  void run() {
    display();
  }


  void display() {
    translate (-10,0);
    noStroke();
    
    fill(255);
    
    
    
    //tunnel grey
   
    translate(0,0);
    fill(100);
    rect(30,20,tunnelWidth,tunnelWidth);
    
    //light
    pushMatrix();
    translate(30,20);
    fill(255);
    rect(15,15,lightWidth, lightWidth);
    popMatrix();
  }
}



