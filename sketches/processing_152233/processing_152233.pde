
/* Tribute to Vera Molnare 25 Square 1991
*Creative Coding Future Learn
* Cliffface
* I spent a while looking carefully at a number of different version of this work
* and set out to adapt the code to match the origonals as closely as possible timeframe considered.
* I think the time spent looking and making notes was well spent in getting the propertion correct and the order that the squares go 
* down in; bottom right to top left this keeps the shadows from a light source top left.
* 
*/
 int nosquares=5; //sets number of squares accross canvas as global

void setup() {
  size(600,600);
  rectMode(CORNER);
  noStroke();
  frameRate(1);
  randomSeed(hour()+minute()+second()+millis());

 
   
}

void draw() {
  
   background(225,230,230); //clear screen
  
   //Relative Proportion unit values of drawn objects
  float guttpro=1; //Value of gutter = 1
  float margpro=3; //Value of margin = 3
  float squarepro=18; //Value of square = 18
  float propunit; // 
  
  
  propunit = width/(((nosquares-1)*guttpro)+(margpro*2)+(nosquares*squarepro)); //calcualte prounit (proportonal unit) value
  
 
  float guttsize=propunit*guttpro;
  float margsize=propunit*margpro;
  float sqrsize=squarepro*propunit;
  float offset=propunit;
  float rndshift;
     

  
  for(int i=nosquares; i>0; i=i-1){
    for(int j=nosquares; j>0; j=j-1){
      
//      Initialise base x and y postion
      float x=(margsize+(guttsize*(i-1))+(sqrsize*(i-1)));
      float y=((margsize+(guttsize*(j-1)))+(sqrsize*(j-1)));
      
      //create random shift from base position
      x=x+(random((-propunit),propunit));
      y=y+(random((-propunit),propunit));
      
//      Create two groupings of smaller random colour shifts
      float r; float g; float b;
      if (random(1,25)<11) {
        r=(random(129,139));
        g=(random(0,12));
        b=(random(17,28));
      } else {
       r=(random(54,64));
        g=(random(7,10));
        b=(random(16,24));
    }        
      
      fill(40,0,0,112);
      rect(x+offset,y+offset,sqrsize,sqrsize);
      fill(r,g,b,255);
      rect(x,y,sqrsize,sqrsize);
    

  }
  }
//  //Creating changing filename for auto image save
//  String mypic = "Cliffface";
//  mypic=mypic + str(year())+"_";  
//  mypic=mypic + str(month())+"_";
//  mypic=mypic + str(day())+"_";
//  mypic=mypic + str(hour())+"_";
//  mypic=mypic + str(minute())+"_";
//  mypic=mypic + str(second());  
//  mypic=mypic + ".png";
//  // image save
//  save(mypic);
}

void keyReleased() {

  // right arrow -- increase frame_rate_value
  if (keyCode == RIGHT && nosquares < 30) {
    nosquares++;
  }
    

  // left arrow -- decrease frame_rate_value
  if ( keyCode == LEFT && nosquares > 1) {
    nosquares--;
  }
}
  
  
  



