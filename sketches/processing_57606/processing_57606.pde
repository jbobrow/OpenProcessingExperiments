
class CharacterGraphics{
  int PWidth;
  int PHeight;
  
  CharacterGraphics(int PWidth_,int PHeight_){
    PWidth = PWidth_;
    PHeight = PHeight_;
  }
  
  void display(){
    stroke(color(0, 0, 0));
    strokeWeight(2);
    fill(255);
    ellipse(0, 0, PWidth, PHeight);
    
    stroke(color(255,0,0));
    strokeWeight(4);
    point(-PWidth/2,0);
    point(-PWidth/2+1/physicsWorldScale,2/physicsWorldScale);
    point(PWidth/2,0);
    point(0,PHeight/2);
    point(-1/physicsWorldScale,PHeight/2);
  }
}

class FemaleGraphics extends CharacterGraphics{
  FemaleGraphics(int PWidth_,int PHeight_){
    super(PWidth_, PHeight_);
  }
  
  void display(){
    stroke(color(0, 0, 0));
    fill(255);
    //Buste
    strokeWeight(1);
    ellipse(0, 0, PWidth, PHeight/3);
    ellipse(PWidth/4, -PHeight/7, PWidth/3, PHeight/5);
    ellipse(-PWidth/4, -PHeight/7, PWidth/3, PHeight/5);
    point(2*PWidth/7, -PHeight/7);
    point(-2*PWidth/7, -PHeight/7);
    strokeWeight(2);
    point(0,0);
    //Head
    strokeWeight(1);
    ellipse(0, -3*PHeight/8, 5*PHeight/14, 5*PHeight/14);
    line(0, -5*PHeight/16, 0, -3*PHeight/8);
    line(-PHeight/10, -3*PHeight/8,  PHeight/10, -3*PHeight/8);
    //Hair
    line(-PHeight/10, -7*PHeight/16,  PHeight/10, -7*PHeight/16);
    line(-PHeight/12, -PHeight/2,  PHeight/12, -PHeight/2);
    //line(-PWidth/4, -PHeight/4,  -PWidth/4, -7*PHeight/16);
    //line(PWidth/4, -PHeight/4,  PWidth/4, -7*PHeight/16);
    //Feet
    ellipse(PWidth/7, 7*PHeight/16, PWidth/4, PHeight/4);
    ellipse(-PWidth/7, 7*PHeight/16, PWidth/4, PHeight/4);
    //Legs
    pushMatrix();
    rotate(0.1);
    ellipse(PWidth/4, PHeight/4, PWidth/3, PHeight/3);
    rotate(-0.1);
    popMatrix();
    pushMatrix();
    rotate(-0.1);
    ellipse(-PWidth/4, PHeight/4, PWidth/3, PHeight/3);
    rotate(0.1);
    popMatrix();
    point(0,PHeight/5);
    //Genitals
    fill(0);
    triangle(0,PHeight/4, PWidth/7, PHeight/8, -PWidth/7, PHeight/8);
    
    /**stroke(color(255, 0, 0));
    strokeWeight(4);
    point(0, PHeight/2);
    point(PWidth/2, 0);
    point(0, PHeight/2);
    point(0, -PHeight/2);
    point(-PWidth/2, 0);**/
  }
}



class MaleGraphics extends CharacterGraphics{
  
  MaleGraphics(int PWidth_,int PHeight_){
    super(PWidth_, PHeight_);
  }
  
  void display(){
    stroke(color(0, 0, 0));
    fill(255);
    //Body
    strokeWeight(1);
    ellipse(0, PHeight/8, 3*PWidth/4, 3*PHeight/4);
    ellipse(0, -3*PHeight/8, PWidth/2, PHeight/3);
    line(0, -5*PHeight/16, 0, -3*PHeight/8);
    point(-PWidth/8, -3*PHeight/8);
    point(PWidth/8, -3*PHeight/8);
    //Arms
    strokeWeight(2);
    line(PWidth/7, -PHeight/7, 7*PWidth/16, PHeight/5);
    line(-PWidth/7, -PHeight/7, -7*PWidth/16, PHeight/5);
    //Genitals
    strokeWeight(1);
    //ellipse(0, PHeight/8, 3*PWidth/4, 3*PHeight/4);
    strokeWeight(2);
    line(0, PHeight/3, 0, PHeight/5);
    point(-PWidth/7, PHeight/3);
    point(PWidth/7, PHeight/3);
    
  }
}

