
int d = 50;
int elps_pos_x = 100;
int elps_pos_y = 200;

int elps_pos_2_x = 100;
int elps_pos_2_y = 250;

int direction = 3;
int direction_2 =- 3;

void setup () {
  size (400, 400, P2D);
  background (255);
  smooth (8);  

   
}


void draw () {

  
 fill (23, 8, 200);
  
ellipse (elps_pos_x,elps_pos_y, d,d ); 
ellipse (elps_pos_x + elps_pos_x ,elps_pos_y, d,d ); 
ellipse (3*elps_pos_x, elps_pos_y, d,d ); 



elps_pos_y =  elps_pos_y +direction;

  
 if (elps_pos_y < 50) {
  direction = - direction;
 elps_pos_y =  elps_pos_y + direction;
 } else if (elps_pos_y > height - d) {
 direction = - direction;
 }
  

fill (255, 107, 8);
 
 ellipse (elps_pos_2_x - d,elps_pos_2_y, d,d ); 
ellipse (elps_pos_2_x + d,elps_pos_2_y, d,d ); 
ellipse (2*elps_pos_2_x +d,elps_pos_2_y, d,d ); 
ellipse (3*elps_pos_2_x +d, elps_pos_2_y, d,d ); 



elps_pos_2_y =  elps_pos_2_y  + direction_2;

 if (elps_pos_2_y < 50) {
  direction_2 = - direction_2;
 elps_pos_2_y =  elps_pos_2_y + direction_2;
 } else if (elps_pos_2_y > height - d) {
 direction_2 = - direction_2;
 }

 if (keyPressed) {
    if (key == 'z' || key == 'Z' && elps_pos_2_y < 50  ) {
      direction_2 = - direction_2;
 elps_pos_2_y =  elps_pos_2_y + 2*direction_2;
   } else if (key == 'z' || key == 'Z' && elps_pos_2_y > height - d)
   {
    direction_2 = - direction_2;
   }
     }
  
  if (keyPressed) {
    if (key == 'x' || key == 'X' && elps_pos_y < 50  ) {
      direction = - direction;
 elps_pos_y =  elps_pos_y + 2*direction;
   } else if (key == 'x' || key == 'X' && elps_pos_y > height - d)
   {
    direction = - direction;
   }
  }
       
       
      
 


}
