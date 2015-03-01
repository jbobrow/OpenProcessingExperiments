
class Coord {
 int x;
 int y;
 Coord(int _x, int _y) {
  x = _x;
  y = _y;
 } 
}

void setup(){
 size(600, 600);
 
 int gridCount = 20;
  for(int i=0 ; i<gridCount ; i++) {
    for(int j=0 ; j<gridCount ; j++) {
     
     Coord leftUpper =  new Coord(i*width/gridCount,j*height/gridCount);
     Coord leftLower = new Coord( i*width/gridCount,j*height/gridCount+height/gridCount);
     Coord rightUpper = new Coord( i*width/gridCount+width/gridCount,j*height/gridCount );
     Coord rightLower = new Coord( i*width/gridCount+width/gridCount,j*height/gridCount + height/gridCount);
     
     int rand = (int)random(0,4);
     switch(rand) {
      case 0: 
      fill(random(255),j*3%125,125,255);
      triangle(leftUpper.x, leftUpper.y, leftLower.x, leftLower.y, rightLower.x, rightLower.y);
      fill(random(255),j*3%125,125,100);
      triangle(rightLower.x, rightLower.y, rightUpper.x, rightUpper.y, leftUpper.x, leftUpper.y);
      break;
      case 1: 
      fill(random(255),j*3%125,125,255);
      triangle(leftLower.x, leftLower.y, rightLower.x, rightLower.y, rightUpper.x, rightUpper.y);
      fill(random(255),j*3%125,125,100);
      triangle(rightUpper.x, rightUpper.y, leftUpper.x, leftUpper.y, leftLower.x, leftLower.y);
      break;
      case 2: 
      fill(random(255),j*3%125,125,255);
      triangle(rightLower.x, rightLower.y, rightUpper.x, rightUpper.y, leftUpper.x, leftUpper.y);
      fill(random(255),j*3%125,125,100);
      triangle(leftUpper.x, leftUpper.y, leftLower.x, leftLower.y, rightLower.x, rightLower.y);
      break;
      case 3: 
      fill(random(255),j*3%125,125,255);
      triangle(rightUpper.x, rightUpper.y, leftUpper.x, leftUpper.y, leftLower.x, leftLower.y);
      fill(random(255),j*3%125,125,100);
      triangle(leftLower.x, leftLower.y, rightLower.x, rightLower.y, rightUpper.x, rightUpper.y);
      break;
     }
    } 
  }
}

void draw() {
  
}


