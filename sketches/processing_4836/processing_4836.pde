
class Ant {
  //Declare variables
  float x = 0;
  float y = 0;
  float a = 0;
  
  //Constructor
  Ant() {
   a = random(0,100);
  };
  
  //Crawl
  void crawl() {
    x+= random(-1,1);
    y+= random(-1,1);
    
    fill(a,0,0,150);
    noStroke();
    ellipse(x,y,2,2);
    stroke(0,20);
    line(x,y,250,250);
  };
};

