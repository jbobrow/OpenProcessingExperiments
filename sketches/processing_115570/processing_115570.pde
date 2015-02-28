
int x = 100;
int y = 100;
int x2 = 5;
int y2 = 430;
boolean reverseX = false;
boolean reverseY = false;
boolean reverseX2 = false;
boolean reverseY2 = false;
float gradientColor = 0;


void setup () {
  size (500,500);
}

void draw () {
  background (0);
  
  for (int j = 0; j < 5; j++){
    for (int i = 0; i < 5; i++) {
      float xPos = 100 * i;
      float yPos = 100 * j;
      rect(xPos, yPos, 50, 50);
 
    }
  }
  fill(255, 255, 255);
  for (int j = 0; j < 5; j++){
    for (int i = 0; i < 5; i++) {
      float xPos = 50 + 100 * i;
      float yPos = 50 + 100 * j;
      rect(xPos, yPos, 50, 50); 
    }
  }

  
  fill (255);
  rect (x,y,40,40);
  //x axis Square 1
  if ( x >= 470) {
 reverseX = true;
  } else if( x  <=-0){
    reverseX = false;
  }
 if(reverseX) {
   x-=5;
    }else{
     x+=5;
    }
    //y axis
    if ( y >= 470) {
 reverseY = true;
  } else if( y  <=-0){
    reverseY = false;
  }
 if(reverseY) {
   y-=4;
    }else{
     y+=4;
    }
    
    
    rect (x2,y2,50,50);
  //x axis Square 2
  if ( x2 >= 450) {
 reverseX2 = true;
  } else if( x2  <=-10){
    reverseX2 = false;
  }
 if(reverseX2) {
   x2-=10;
    }else{
     x2+=10;
    }
    //y axis
    if ( y2 >= 475) {
 reverseY2 = true;
  } else if( y2  <=25){
    reverseY2 = false;
  }
 if(reverseY2) {
   y2-=11;
    }else{
     y2+=11;
    }

}
