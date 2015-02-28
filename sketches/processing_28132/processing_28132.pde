
class Dancer {
  
  float x, y, headY, armX, armY, armX2, shoeY;   //create new floats and call them x and y
  
  Dancer(float x, float y) {  //this version takes this x and assigns it to this copy
    this.x=x;
    this.y=y;
    headY=y-525;
    armX=x-200;
    armY=y-350;
    armX2=x-400;
    //shoeY=y-50;
  }
  
  void display() {
    pushMatrix();
    translate(x,y);
   rectMode(CENTER);
    fill(0);
    ellipse(0,headY,100,100);   //head
    rect(0,0,30,250);    //body
    strokeWeight(40);
    line(10,-40,65,30);  //upper right arm
    line(-10,-40,-65,30);  //upper left arm
    line(65,30,armX,armY);    //lower right arm
    line(-65,30,armX2,armY);    //lower left arm
    line(15,130,30,210);     //upper right leg
    line(-15,130,-30,210);    //upper left leg
    line(30,210,20,300);      //lower right leg
    line(-30,210,-20,300);    //lower left leg
    ellipse(50,300,50,shoeY);      //right shoe
    ellipse(-50,300,-50,shoeY);    //left shoe
    popMatrix();
    
  }
}

//line(65,30,105,75);

