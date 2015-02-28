
/* 
 
Cindy Ng 
June 14,2009 
cindy.ng@cindysng.com
blast
 
*/ 

void setup() {
  
  size(500,500);//set the size of the window
  background(0); //set the background color
  smooth();//turn on smoothing
  stroke(50,350,0);
 
 
};

//This is he draw wrapper. Anything in herehappens once per frame.
void draw() {
  line(250,250,mouseX,mouseY);
  
};

