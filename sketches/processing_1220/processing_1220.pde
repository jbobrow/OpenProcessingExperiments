
import motion.*;

Sprite o = new Sprite();

void setup(){
  size(500,500); 
  
  smooth(); 
  o.content = loadShape("bot1.svg");
  new Tween(o,"scaleX",1.5,1.5,Tween.EASEOUTELASTIC,1);
  new Tween(o,"scaleY",1.5,1.5,Tween.EASEOUTELASTIC,1.1);
}

void draw(){
  background(100) ;
  shapeMode(CENTER);

  translate(o.x,o.y);
  scale(o.scaleX,o.scaleY);
  shape(o.content,0,0);
}



public class Sprite{
  public float x = 250;
  public float y = 250;
  public float scaleX = 0.0001;
  public float scaleY = 0.0001;
  public PShape content;
  
  public void onTweenUpdate(String prop){
    //println("update"+prop);
  } 
  public void onTweenComplete(String prop){
    // println("complete"+prop);
    noLoop();
  } 

}


