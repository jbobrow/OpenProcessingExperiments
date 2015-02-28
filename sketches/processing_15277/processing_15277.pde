
class Fish{
  color c;
  float xpos;
  float ypos;
  float xvel;
  
  Fish(color c_,float xp, float yp, float xv){
    c = c_;
    xpos = xp;
    ypos = yp;
    xvel = xv;
  }
  
  void display(){
    fill(c);
    noStroke();
    beginShape();
      curveVertex(xpos,ypos);
      curveVertex(xpos,ypos);
      curveVertex(xpos+10,ypos+10);
      curveVertex(xpos+10,ypos+10);
      curveVertex(xpos+25,ypos);
      curveVertex(xpos+40,ypos+10);
      curveVertex(xpos+25,ypos+20);
      curveVertex(xpos+10,ypos+10);
      curveVertex(xpos+10,ypos+10);
      curveVertex(xpos,ypos+20);
      curveVertex(xpos,ypos);
      curveVertex(xpos,ypos);
    endShape();
  }
  
  void swim(){
    xpos = xpos + xvel;
    ypos = ypos + (random(-.5,.5));
    if (ypos>height){ ypos-=10;}
    if (ypos<500){ ypos+=10;}
    if (xpos>width+50){xpos = -50;}
  }
}


