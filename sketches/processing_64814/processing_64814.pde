
class Particle{

  // global variable
  float xpos;
  float ypos;
  
  float xspeed;
  float yspeed;
  
  float dia;
  
  // constructor
  Particle(float _xpos, float _ypos, float _xspeed, float _yspeed){
    xpos = _xpos;
    ypos = _ypos;
    xspeed = _xspeed;
    yspeed = _yspeed;
    dia = 400;
  }
  
  // functionalities
  void run(){
    display();
    update();
    bounce();
  }
  
  void display(){
    smooth();
    //noStroke();
    //fill(255,0,0);
    //ellipse(xpos, ypos, dia, dia);
    shape(logo, xpos, ypos, dia, dia);
    //fill(255);
    //text(int(xpos), xpos+5, ypos+5);
  }
  
  void update(){
    xpos += xspeed;
    ypos += yspeed;
  }
  
  void bounce(){
    if(xpos < 0 || xpos > width){
      xspeed = xspeed*-1;
    }
    if(ypos < 0 || ypos > height){
      yspeed = yspeed*-1;
    }
  }
}

