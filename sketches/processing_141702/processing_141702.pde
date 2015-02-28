
//variables


//call classes
 
 Orbs [] t = new Orbs [18];

//void setup                         //OBJECTS, BACKGROUND, SIZE, FRAMERATE
void setup(){
  size(600,600);
  background(250);
  frameRate(60);
  
//objects from classes
  
  for (int i = 0; i < t.length; i++) {     //making 18 orbs (i includes all 18)
    t[i] = new Orbs ();   //variable assignments
  }//end for loop
  
}//end setup

//void draw
void draw(){                        //FUNCTIONS
  for (int i = 0; i < t.length; i++) {    //same for loop, but doing the actions to all 18 at once
  t[i].walk();
  t[i].display();
  
  
   for (int j = 0; j < t.length; j++){
   if( ( t[i].bump(t[j]))){
    t[i].block();
   }else{
    t[i].free();
   }//end if
  }//end 2nd for loop

 }//end 1st for loop
  
}//end drawclass Orbs {
  
  class Orbs{
 //variables
  
   float x; 
   float y;
   int z;
   color c = color(int(random(100,255)),int(random(100,255)),int(random(100,255)));
   //above gives one random color to each orb
   int opac = 30;
 //constructor
 
 Orbs(){
 x = random(width);
 y = random(height);
 z = 5;
 
 

 }//end orbs constructor
 
 //functions

 
 void display(){                                 //display
   noStroke();
   fill(c,opac);   //putting the values for color down here gives each individ. ellipse its own color
   ellipse(x,y,z,z);
   
 }//end display
  
  void walk(){                                    //walk
   int step = int(random(4));
   if (step == 0){
     x = x + 3;
   } else if(step ==1){
     x = x - 3;
   } else if(step == 2){
     y = y + 3;
   }else {
     y= y - 3;
   }//end step
   
   x = constrain(x,0,width);
   y = constrain(y,0,height);
   
 }//end walk
 
 void block(){                               //block

   z = z+2;
   opac = 5;
 }//end block
 
 void free(){                              //free of blockage
 z = z;
}//end free

boolean bump (Orbs t0){
  float d = dist(x, y, t0.x, t0.y);  //distance of orbs
  if ((d > 0) && (d < z)){
    return true;
  } else {
    return false;
  }//end else
}//end boolean

}//end class
