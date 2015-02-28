
ArrayList <square> squares;
ArrayList <circle> circles;

void setup(){
  size(1000, 520);
  
  squares = new ArrayList();
  circles = new ArrayList();
  
   for(int i = 0; i < 100; i = i + 1){
     squares.add(new square() );
     circles.add(new circle() );
     
     
   }
}

void draw(){
  background(250, 486, 87);

  for(int i = 0; i < squares.size(); i = i + 1){
   if(squares.get(i).lifeTime > 0 ){ 
     squares.get(i).display(); 
     squares.get(i).move();
     squares.get(i).bounce();
     
   } else{
     squares.remove(i);
     squares.add( new square() );
   }
  }
  for(int i = 0; i < circles.size(); i = i + 1){
   if(circles.get(i).lifeTime > 0 ){ 
     circles.get(i).display(); 
     circles.get(i).move();
     circles.get(i).bounce();
     
   } else{
     circles.remove(i);
     circles.add( new circle() );
   }
  }
}

class circle{
  float lifeTime;
  
  // variables  
  float xpos; 
  float ypos;
  float xspd;
  float yspd; 
  float grav;
  color col;
  // constructor
  circle(){
    xpos = mouseX;
    ypos = mouseY;
    xspd = mouseX - pmouseX + random(-4, 4);
    yspd = mouseY - pmouseY;
    grav= 0.89;
    col = color(random(250), random(250), random(250));
    lifeTime = 250 + random(-50, 50);
  }
  
  // functions (methods)
  void move(){
    xpos = xpos + xspd;
    ypos = ypos + yspd; 
    yspd = yspd + grav;
    lifeTime = lifeTime - 4;
    
  }
  
  void display(){
    fill(red(col), green(col), blue(col), lifeTime);
    ellipse(xpos, ypos, 50, 50);
  }

 void bounce(){
    if(ypos > height){
      yspd = -.65*abs(yspd);
    }
  }
}
class square{
  float lifeTime;
  
  // variables 
  float xpos; 
  float ypos;
  float xspd;
  float yspd; 
  float grav;
  color col;
  // constructor
  square(){
    xpos = mouseX;
    ypos = mouseY;
    xspd = mouseX - pmouseX + random(-4, 4);
    yspd = mouseY - pmouseY;
    grav= 0.89;
    col = color(random(250), random(250), random(250));
    lifeTime = 250 + random(-50, 50);
  }
  
  // functions (methods)
  void move(){
    xpos = xpos + xspd;
    ypos = ypos + yspd; 
    yspd = yspd + grav;
    lifeTime = lifeTime - 4;
    
  }
  
  void display(){
    fill(red(col), green(col), blue(col), lifeTime);
    rect(xpos, ypos, 50, 50);
  }
  void bounce(){
    if(ypos > height){
      yspd = -.65*abs(yspd);
    }
  }
}
