
//vars for quad
int pt1_x, pt1_y, pt2_x, pt2_y, pt3_x, pt3_y, pt4_x, pt4_y;
//other vars
int randomVal, level;

void setup() {
  size(500, 750);
  stroke(0);
  strokeWeight(1);
  noFill();
  background(255); 
  
  //setup vars for first quad
  pt1_x = 0;
  pt1_y = 0;
  pt2_x = 50;
  pt2_y = 0;
  pt3_x = 50;
  pt3_y = 50;
  pt4_x = 0;
  pt4_y = 50;
  
  level = 50;
  randomVal = 1;
  
}

void draw() {
      while (pt4_x < width) {
        quad(pt1_x + (int)random(randomVal),
              pt1_y - (int)random(randomVal),
              pt2_x + (int)random(randomVal), 
              pt2_y - (int)random(randomVal),
              pt3_x + (int)random(randomVal),
              pt3_y + (int)random(randomVal),
              pt4_x - (int)random(randomVal),
              pt4_y + (int)random(randomVal)
              );        
        pt1_x += 50;
        pt2_x += 50;
        pt3_x += 50;
        pt4_x += 50;
      }
      
      randomVal++;
      level += 50;
      
      pt1_x = 0;
      pt2_x = 50;
      pt3_x = 50;
      pt4_x = 0;
      
      pt1_y = level - 50;
      pt2_y = level - 50;
      pt3_y = level;
      pt4_y = level;
}
