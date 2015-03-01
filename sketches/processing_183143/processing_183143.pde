
int ellipseXTransform;
int ellipseYTransform;
 
int toTheRight = 1000;
int toTheWall = 0;
int raiseTheRoof = 0;
int dropItDropItLow = 1000;
 
boolean toTheWindow = true;
boolean toTheCeiling = true;
 
void setup() {
  size(1000, 1000);
  ellipseXTransform = 10;
  ellipseYTransform = 10;
}
 
void draw() {
  background (240, 240, 0);
 
  if (toTheWindow == true && toTheCeiling == true) {
    if (ellipseXTransform < toTheRight) {
      ellipseXTransform = ellipseXTransform + 15;
       
    } else {
      toTheWindow = false;
    }
  } else if (toTheWindow == false && toTheCeiling == true) {
 
    if (ellipseYTransform > raiseTheRoof) {
      ellipseYTransform = ellipseYTransform - 15;
    } else {
      toTheCeiling = false;
    }
  } else if (toTheWindow == false && toTheCeiling == false) {
      if (ellipseXTransform > toTheWall) {
        ellipseXTransform = ellipseXTransform - 10;
      } else {
          toTheWindow = true;
      }
  } else {
      if (ellipseYTransform < dropItDropItLow) {
        ellipseYTransform = ellipseYTransform + 20;
      } else {
         toTheCeiling = true;
      }
  }
 
  fill (110,0,0);
  stroke (200, 200, 200);
  ellipse(ellipseXTransform, ellipseYTransform, 100, 100);
}



