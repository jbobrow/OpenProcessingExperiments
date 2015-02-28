
class Ground {
  //FIELDS
  int r = 255;                       //COLOR VARIABLES
  int g = 255; 
  int b = 255;
  int a = 100;
  int h = 359;
  int s = 100;
  int hsB = 100;
  int black = 0;
  int white = color(255);
  int dkPurple = color(155,80,138);
  int purple = color(216,120,196);
  
  float backColor = 175;
  float backRect;
  float backRectColor = 100;
  float backY = 140;

//ground
void ground(){
     backRect = 65;
     colorMode(RGB);
     fill(backRectColor);
     rect(width/2,height - height/7,width,backRect);
  
     backRect = 3;
     fill(backRectColor - 75);
     rect(width/2,backY,width,backRect);
}
}

