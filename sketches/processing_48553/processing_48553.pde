
class Jet {
  //properties
  int jet_x = 150; //start posX///
  int jet_y = 180;
  int yspeed = 2;

  float diam = 10; ///jetsize///

  int  distance = 35; ///spacebwtjetsize///
  
  //constructor
  Jet() {

  }
  //method
  void drawMe() {
  jet_y = jet_y + yspeed;
  for(int i = 0; i<30; i++) {
    ellipse( jet_x, jet_y+ distance*i, diam, diam);
   } 
   fill(255, 0, 0);
   if(jet_y>=250){
     fill(255);
   }
   if(jet_y>=350){
    fill(0,180,0);
   }
    if(jet_y>=450){
     fill(0,0,150);   
    } 
  } 
}  

