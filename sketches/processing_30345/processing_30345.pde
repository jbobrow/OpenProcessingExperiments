
PImage Alien ;
    void setup(){
      Alien = loadImage("Alien-Ship-02.jpg");
      size(1706,1080);
      background(Alien);
      
      
    }
    void draw(){
      ellipseMode(CENTER);
      rectMode(CENTER);
      stroke(0);
      fill(134,50,78);
      rect(100,100,20,100);
      fill(150,00,00);
      ellipse(100,70,60,60);
      fill(30,120,100);
      ellipse(81,70,16,32);
      ellipse(119,70,16,32);
      stroke(30);
      line(90,150,80,160);
      line(110,150,120,160);
      line(90,110,55,120);
      line(110,110,145,120);
       
  }
                
