
class Robit{
  float scalar,blur, xpos, ypos,velx,vely;
  PShape rob;

  Robit(float s, float b, float x, float y, float vx, float vy){
    rob=loadShape("rob8.svg");
    scalar=s;
    blur=b;
    xpos=x;
    ypos=y;
    velx=vx;
    vely=vy;
  }


  void move(){

    float xpos=0;
    float ypos=0;
    float targetX,targetY;
    float ez=1.25;
    targetX =Unimotion.getSMSX()+80;
    map(targetX,0,255,0,width);
    float dx = targetX - xpos;
    if(abs(dx) > 1) {
      xpos += dx * ez;
    }

    targetY = Unimotion.getSMSY()-80;
    float dy = targetY - ypos;
    if(abs(dy) > 1) {
      ypos += dy * ez;
    }


    pushMatrix();
   // filter(BLUR, blur);
    scale(scalar/12);

    shape (rob,xpos,ypos);
    popMatrix(); 
  }


}


