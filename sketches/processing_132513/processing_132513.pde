
//Carlyn Maw, January 2014
//Week 4 "Rinse, repeat", Example 1
//Draw squares in a diagonal line

//how big should the square be.
int sq_width = 10;
//how far away from each other should they be
int sq_offset = sq_width;

void setup() {
  //how big is the stage
  size(300, 300);
  
 //keep drawing squares shifted "sq_offset" pixels down 
 //and to the right until the right edge is reached. 
 for (int i = 0; i < (width); i = i+sq_offset) {
    rect(i, i, sq_width, sq_width);
  }
  
}



