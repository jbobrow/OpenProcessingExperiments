
class Crumbs{
  float x= 0.0;
  float y = 0.0;
  //float vy = 1.0;
  float vyrandom = random(.1,4);
  boolean ismoving = false;
  float xrandom = random(120,280);
  float colorrandomR = random(0,255);
  float colorrandomG = random(0,255);
  float colorrandomB = random(0,255);


  Crumbs (float newX,float newY){
    x = newX;
    y = newY;

  }

  void show(){
    stroke(0);
    //strokeWeight(10);
    noStroke();
    fill(colorrandomR,colorrandomG,colorrandomB);
    rect(xrandom,y,5,5);


  }
  void move(){
    if (ismoving== true){
      y = y + vyrandom;
    }
    if(y >height){
      y =255;
      ismoving=false;
    }


  }

}







