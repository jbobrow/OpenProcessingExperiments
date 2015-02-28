

Monster A = new Monster();
Monster B = new Monster();
Monster C = new Monster();

void setup() {
  size(500, 500);
  fill(random(0,255));  
  
  A.prime(0, height/2, 2);
  B.prime(width/4, height/4,random(-2,2));
  C.prime(2* width/3, height/2,random(-2,2));

}

void draw(){
  
  background(255);
  A.animate();
  B.animate();
  C.animate();
  
 // println(A.x);
  
}


void keyPressed(){
  A.move();
  C.move();
 
}




  


class Monster {

  float x;
  float y;
  float xspeed;
  float yspeed;


  void prime(float a, float b, float c) {
    x=a;
    y=b;
    xspeed=random(-5,5);
    yspeed=random(-10,10);
  }

  void animate() {
    //Body
    fill(random(0,144));
    rect(x, y, 100, 100);
    rect(x, y+20, 20, 20);
    rect(x+100, y+20, 20, 20);

    //Eyes
    fill(255);
    rect(x+30, y+20, 10, 10);
    rect(x+60, y+20, 10, 10);

    //Mouth

    stroke(255);
    line(x+30, y+40, x+70, y+40);
  }
  
  void move() {
    x+= xspeed;
    y+= yspeed;
  }
  void keyPressed() {
    if(keyCode == RIGHT)
    x+= xspeed;
    if(keyCode == LEFT)
    x-= xspeed; 
    if(keyCode == UP)
    y+= yspeed;
    if(keyCode == DOWN)
    y-= yspeed; 
  }
  }
  
  





