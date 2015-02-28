

class Fur{
  float yfur;      // Vertical location of each line
  float xfur;       // Initial horizontal location for first line
  float len;

  
  Fur(float tempY ,float tempX,float tempLen){ 
    yfur = tempY;      // Vertical location of each line
    xfur = tempX;       // Initial horizontal location for first line
    len = tempLen;   // Length of each line
}
  
  void display(){
    stroke(0);
    strokeWeight(1.5);
    line (xfur,yfur,xfur+ random(-1,1),yfur+len);
if(yfur+len>530){
 line (xfur,yfur,xfur+ random(-1,1),yfur);
     }
  }

  void grows() {
  len = len + 1; 
if(yfur+len>530){
roomStep=2;
     }
}


}


