
PShape svg_circles; 
PShape slice;
PShape slice_1;
PShape slice_2;
PShape slice_3;
PShape slice_4;
PShape slice_5;
PShape slice_6; 
PShape slice_7; 
PShape slice_8;

int num_part = 300;
Particle [] cuties = new Particle [num_part];
Boolean isSetup = false; 


void setup () { 
  size (612, 792); 
  background (255); 
  svg_circles = loadShape ("circles_1.svg"); 
  slice = loadShape("slice.svg");
  slice_1 = loadShape ("slice_1.svg"); 
  slice_2 = loadShape ("slice_2.svg");
  slice_3 = loadShape ("slice_3.svg");
  slice_4 = loadShape ("slice_4.svg");
  slice_5 = loadShape ("slice_5.svg"); 
  slice_6 = loadShape ("slice_6.svg"); 
  slice_7 = loadShape ("slice_7.svg"); 
  slice_8 = loadShape ("slice_8.svg"); 
  smooth ();
}





void draw () {
  shape (svg_circles, 0, 0, 612, 792); 
  ellipse (mouseX, mouseY, 40, 40); 
  noStroke(); 
  fill (60, 90, 100); 


  shape(slice, 157.5, 0);
  shape(slice, 357, 0);
  shape(slice_1, 0, 0); 
  shape(slice_2, 548.8, -2);
  shape (slice_3, 0, 117); 
  shape (slice_3, 0, 209); 
  shape (slice_4, 148.8, 112);
  shape (slice_4, 347, 112);   
  shape (slice_5, 547, 111);
  shape (slice_4, 148.7, 204.5); 
  shape (slice_4, 346.3, 204); 
  shape (slice_5, 547.7, 203); 
  shape (slice_3, 0, 300); 
  shape (slice_4, 148, 296);
  shape (slice_4, 346, 296); 
  shape (slice_5, 547, 295.5);
  shape (slice_3, 0, 393); 
  shape (slice_4, 149, 388.5); 
  shape (slice_4, 347, 388.5); 
  shape (slice_5, 548, 387); 
  shape (slice_3, 0, 485); 
  shape (slice_4, 148, 480); 
  shape (slice_4, 348, 480); 
  shape (slice_5, 548, 479); 
  shape (slice_3, 0, 578); 
  shape (slice_4, 149, 573.7);
  shape (slice_4, 347.5, 573.7); 
  shape (slice_5, 548, 572);
  shape (slice_6, -9, 663); 
  shape (slice_7, 147, 662);
  shape (slice_7, 344, 662); 
  shape (slice_8, 546, 664);
 
 
 
 if (mousePressed == true) {
    //make a particle here 
    for (int i = 0; i<num_part; i++) {
    cuties [i] = new Particle (mouseX, mouseY); 
  }
  isSetup= true; 
  } 
if (isSetup == true){
  for (int i = 0; i<num_part; i++) {
  cuties [i].update();
cuties [i].display (); 
  }
}
} //end of draw 

class Particle  {
  float x_pos; 
  float y_pos; 
  float x_speed; 
  float y_speed; 
  int w; 

Particle (int _x, int _y) {
  x_pos = _x;
  y_pos = _y;
 x_speed = int (random (-4, 4) );
y_speed= int (random (-4, 4) ); 
w= int (random (2, 15) ); 
} //end of contructor 
void update() {
  x_pos = x_pos + x_speed;
  y_pos = y_pos + y_speed; 
  y_speed +=.1; 

} //end update 
  void display () {
 ellipse( x_pos, y_pos, w, w); 
 
  
  } //display

}//end of particle 
 



