
ArrayList <square> squares;
ArrayList <circle> circles;

void setup(){
  size(900, 600);
 
 squares = new ArrayList();
 circles = new ArrayList();
  for(int i = 0; i < 100; i = i + 1){
    squares.add( new square() );
    circles.add( new circle() );
  }
}


void draw(){
  background(200, 0, 150); 
  
 
  for(int i = 0; i < squares.size() ; i = i + 1){
    if(squares.get(i).lifetime > 0 ){
      squares.get(i).move();
      squares.get(i).display();
      squares.get(i).bounce();
    } else{
      squares.remove(i);
      squares.add( new square() );
    }
  }
  
  for(int i = 0; i < circles.size() ; i = i + 1){
    if(circles.get(i).lifetime > 0 ){
      circles.get(i).move();
      circles.get(i).display();
      circles.get(i).bounce();
    } else{
      circles.remove(i);
      circles.add( new circle() );
    }
  }
}


class circle{
  
  
  // variables
  float xpos;
  float ypos;
  float xspd;
  float yspd;
  float grav;
  color col;
  float lifetime;
  
  // constructor
  circle(){
    xpos = mouseX;
    ypos = mouseY;
    xspd = mouseX - pmouseX + random(-5,5);
    yspd = mouseY - pmouseY;
    grav = .5;
    col = color( random(250), random(250), random(250) );
    lifetime = 250 + random(-40, 40);
  }
  
  // functions (methods)
  void move(){
   xpos = xpos + xspd;
   ypos = ypos + yspd;
   yspd = yspd + grav;
   lifetime = lifetime - 4;
  }

   void display(){
     fill ( red(col), green(col), blue(col), lifetime );
     ellipse(xpos, ypos, 47, 47);
   }
   
  void bounce(){
   if( ypos > height){
     yspd = -.7*abs(yspd);
   }
  }
}


class square{
  
  
  // variables
  float xpos;
  float ypos;
  float xspd;
  float yspd;
  float grav;
  color col;
  float lifetime;
  
  // constructor
  square(){
    xpos = mouseX;
    ypos = mouseY;
    xspd = mouseX - pmouseX + random(-5,5);
    yspd = mouseY - pmouseY;
    grav = .5;
    col = color( random(250), random(250), random(250) );
    lifetime = 250 + random(-40, 40);
  }
  
  // functions (methods)
  void move(){
   xpos = xpos + xspd;
   ypos = ypos + yspd;
   yspd = yspd + grav;
   lifetime = lifetime - 4;
  }
  
  void display(){
    fill ( red(col), green(col), blue(col), lifetime );
    rect(xpos, ypos, 50, 50);
  }
 
  void bounce(){
    if( ypos > height){
      yspd = -.7*abs(yspd);
    }
  }
 
}
