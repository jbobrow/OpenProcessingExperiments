
/* @pjs preload="images.jpg"; */
void setup(){
  size(700,600);
  PImage img;
  img = loadImage("images.jpg");
  image(img, 0,0,700,600);
  strokeWeight(10);
  translate(width/2,height);
  arbol(0);
}
void arbol(int noP){
  if(noP>16)return;
  line(0,0,0,-height/3);
      if(noP>12)stroke(0,51,0);
      else stroke(0);
      pushMatrix();
      {
        translate(0,-height/5);
        rotate(random(-PI/3,PI/3));
        //rotate(PI/4);
        scale(0.7);
        arbol(noP + 1);
      }
      popMatrix();
      if(noP>12)stroke(0,255,0);
      else stroke(0);
      pushMatrix();
      {
        translate(0,-height/3);
        rotate(random(-PI/3,PI/3));
        //rotate(-PI/4);
        scale(0.7);
        arbol(noP + 1);
      }
      popMatrix();
  
}




