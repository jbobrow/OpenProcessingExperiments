
//from Enrica Beccalli :)

int numMonsters = 2;
 
Monsters[] bob = new Monsters[numMonsters];
 
 
 
void setup() {
  size(400, 400);
  for (int i=0;i<bob.length;i++) { 
    bob[i]=new Monsters();
    bob[i].prime(i* width/bob.length,height/2, 5);
     
 
  }
   
}
 
void draw() {
  background(0,mouseX,mouseY);
  for (int i=0;i<bob.length;i++) {
    bob[i].animate();
    bob[i].move();
     
  }
 
 
 
 
}

class Monsters {
 
  float x;
  float y;
  float gravity= .8;
  float ySpeed;
}
  void prime(float a, float b) {
    x=a;
    y=b;
    ySpeed = random(1, 5);
  }

 
  void animate() {
    // Body
    fill(mouseY,mouseX,0,50);
    ellipse(x, y, 40, 40);
    
 
 
    //bob Eyes
    fill (255);
    ellipse(x+20, y+20, 5, 5);
    ellipse(x+40, y+20, 5, 5);
 
  }
 
 
  
  void move(){
    
     
    //if(y<=0 || y>=height-150) {
     // ySpeed= ySpeed *-1;}
     y = y + ySpeed;
     //ySpeed = ySpeed+gravity;
     
  }
