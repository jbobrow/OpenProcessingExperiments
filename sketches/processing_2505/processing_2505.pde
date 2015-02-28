
class Ball{//always need the constructor function.. which is this

  float x;
  float y;

  float xspeed = 0;
  float yspeed = 0;

  float xaccel = 0;
  float yaccel = 0.1;



  Ball() {


  };

  void update() {

    xspeed+= xaccel;
    yspeed+= yaccel;
    // x = x + 1;
    x += xspeed;
    y += yspeed;

    if (y > height){
      yspeed = -yspeed;

    };
    
    if (x > width){
      xspeed = -xspeed;
      
    };
    
    if (x < 0){
    xspeed = -yspeed;
    
    };
    
    

  };

  void draw(){
    fill(20,150,200);
    ellipse(x,y,20,20);
    noStroke();
   


  };

};


