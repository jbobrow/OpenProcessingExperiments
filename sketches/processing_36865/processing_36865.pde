
float ellipseWH;
int switcher = 0;
int smallAmountColor = 0;
size(500,500);
float currentX;
float currentY;
float lineMeetX;
float lineMeetY;

for (int row = 0; row <= height; row++){
    for(int col = 0; col <= width; col++){
      stroke(random(230,255),0,random(30,100));
      //stroke(random(240,255),random(222,232),random(0,80));
      point(row,col);
    }
}

 for (int i = 0; i<=5; i++) {
   //fill(random(0,255),random(0,255),random(0,255), random(230,255);
   fill(random(240,255),random(222,232),random(0,80),random(10,150));
   stroke(random(0,255),random(0,255),random(0,255));
   quad(random(0,width), random(0,height), random(0,width), random(0,height), random(0,width), random(0,height), random(0,width), random(0,height));
 }

lineMeetX = (random(0,width));
lineMeetY = (random(0,height));

for(int i = 0; i<100; i++) {
    float ellipseColor = random(100,255);
    //Color Switcher;
      if(switcher == 0) fill(smallAmountColor,ellipseColor,ellipseColor);
      else if(switcher == 1) fill(smallAmountColor,ellipseColor,ellipseColor/2);
      else if(switcher == 2) fill(smallAmountColor,ellipseColor/2,ellipseColor);
      else if (switcher == 3) fill(ellipseColor, smallAmountColor, ellipseColor);
      else if (switcher == 4) fill(ellipseColor/2, smallAmountColor, ellipseColor);
      else if (switcher == 5) fill(ellipseColor, smallAmountColor, ellipseColor/2);
      else if (switcher == 6) fill(ellipseColor,ellipseColor,smallAmountColor);
      else if (switcher == 7) fill(ellipseColor,ellipseColor/2,smallAmountColor);
      else if (switcher == 8) fill(ellipseColor/2,ellipseColor,smallAmountColor);
    //Ellipse Drawing
    ellipseWH = random(10,40);
    currentX = random(0,500);
    currentY = random(0,500);
    stroke(255);
    line(currentX, currentY, lineMeetX, lineMeetY); 
    stroke(random(0,255));
    ellipse(currentX, currentY, ellipseWH, ellipseWH);
    //Color Switcher and grayTone Incrementer
    switcher++;
    if(switcher == 9) switcher = 0;
 }
 
 

