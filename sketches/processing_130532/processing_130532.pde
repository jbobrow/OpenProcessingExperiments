
//if statements, for loops, response
int timer =0; 
float fX = 200; 
float fY = 200; 
float eX = 250; 
float eY = 250; 
float pX = 300; 
float pY = 300; 
float easing = .03; 
void setup(){
    size (500,500);
    frameRate(24); 
  }
  void draw(){ 
    background(0); 
    food();
    player1();
  }
  void food (){
    //respawn 
    timer++;
    if (timer >=48){ 
      fX=random (width);
      fY=random (height);
      timer=0;
    }
    ellipse (fX,fY,30,30);
  }
   void player1(){
    float targetX=mouseX;
    float targetY=mouseY;
    pX += (targetX - pX) * easing;
    pY += (targetY - pY) * easing;
    fill(#E44DF0);  
    ellipse (pX,pY,30,30);
  }

