
//Carlyn Maw, January 2014
//Week 4 "Rinse, repeat", Example 2
//Draw squares in a grid with padding

//how big should the square be.
int sq_width = 10;
//how far away from each other should they be
int sq_offset = sq_width + 5;


void setup() {
  //how big is the stage
  size(300, 300);
  
 //keep drawing squares shifted "sq_offset" pixels to the right 
 for (int i = 0; i < width; i = i+sq_offset) {
  //and then j pixels down
  for (int j = 0; j < height; j = j+sq_offset) {
    rect(i, j, sq_width, sq_width);
  }
}
  
}



