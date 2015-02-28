
class Chameleon extends PPPoly implements Mousable, EveryTicker,DropletCollider {
float sz = 50;
float alpha = 0;
  Chameleon(float x, float y, float angle){
    setPosition(x,y);

vertex(-39,-34);
vertex(-19,-41);
vertex(8,-44);
vertex(35,-28);
vertex(49,20);
vertex(47,36);
vertex(40,45);
vertex(24,35);
vertex(33,22);
vertex(35,8);
vertex(18,-4);
vertex(18,11);
vertex(9,13);
vertex(5,4);
vertex(7,-8);
vertex(-2,-10);
vertex(-5,8);
vertex(-16,11);
vertex(-20,-4);
vertex(-19,-10);
vertex(-48,-14);
vertex(-42,-32);
    setStaticBody(true);
    setRestitution(1.5);
    attachImage(loadImage("art/camo_lean.png")); 
    setImageAlpha(alpha);
  }

boolean isDragged;
float mXoff,mYoff;

void handleTick(){
   if(alpha > 0){
      alpha--; 
   
   }
   if(alpha < 0) {
      alpha = 0; 
   }
   setImageAlpha(alpha);
}

  boolean isMouseOver(){
    
    if( dist(mouseX,mouseY,getX(),  getY()) < sz){
     // setFillColor(new Color(150,255,150));
   // msg="on";
      return true;
    } 
    else {
     // setFillColor(new Color(100,255,100));
     msg="";
      return false;
    }
  } 

  void handleMousePressed(){
    if(isMouseOver()){
       isDragged = true; 
    }
    mXoff = getX() - mouseX;
    mYoff = getY() - mouseY;
  } 
  void handleMouseDragged(){
    if(isDragged){
      setPosition(mouseX+mXoff,mouseY+mYoff);

    }
  }
  void handleMouseReleased(){
    isDragged = false;
  }
  boolean checkDropletCollision(Droplet d){
     if(isTouchingBody(d) && abs(d.getVelocityX())+abs(d.getVelocityY()) > 40  ){
       alpha = 100;
       return true; 
     } else {
        return false; 
     }
  }
  boolean shouldRemoveOnDropletCollision(){
    return false;
  }


}


