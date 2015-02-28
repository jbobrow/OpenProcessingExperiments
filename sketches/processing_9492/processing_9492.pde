
//Class Cone
class Cone {
  
  float startSize, startHue, startSat, startAngle, endAngle, rotateAngle;
  int step=20;
  
  //define Cone constructor
  Cone (float mx, float my) {
    rotateAngle = atan2(my-height/2, mx-width/2);
    
    startAngle = rotateAngle - PI/step;
    endAngle = rotateAngle + PI/step;
    startHue = rotateAngle + PI;
    startSize = 200;
    startSat = 100;
  }
  
  //difene functions
  void displayTint(){
    
    for(int i=0; i<step; i++){
          
      stroke(0,0,bgColor);
      strokeWeight(1);
      fill(startHue, startSat, 100);
      arc(0, 0, startSize, startSize, startAngle, endAngle);
      startSize = startSize - 240/step;
      startSat = startSat - 120/step;
    }
  }
  
  
  void displayShade(){
    for(int i=0; i<step; i++){
      stroke(0,0,bgColor);
      strokeWeight(1);
      fill(startHue,  100, startSat);
      arc(0, 0, startSize, startSize, startAngle, endAngle);
      startSize = startSize - 240/step;
      startSat = startSat - 120/step;
    }
  }
  
}

    

