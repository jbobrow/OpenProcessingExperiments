
/*Purpose - plot pixels based upon mathematical equation

*/

void setup() {
  size(255,500);
  background(0,0,0);
  smooth();
 }

int x=0;  //* horizontal 
float y=0; //* vertical
float r=255;
float g=0;
float b=255;

void draw(){
  strokeWeight(2);
  background(0);
  
  
  float chng=random(0.2,5.0);  //* rate of change
  
 //* Plot pixels
 
 for (float x = 0; x < 255; x = x+chng) {
  
   g=0;
  
     
  for (int n = 1; n < x; n = n+1) {
  g++;
    y=n*10*cos(x);
    stroke(int(100),int(g),int(b));
    point(int(x),int(y));
    y=(n*10)*cos(x);
    stroke(int(100),int(g/chng),int(b));
    point(int(x),int(y*(chng)));
    y=(n*x)*cos(x);
    stroke(int(100),int(g/chng),int(b/chng));
    point(int(x),int(y*(chng*10)));
  }
   
   }
   
    r=r-chng; 

}  

/* Need to include noloop() in setup method
to avoid the entire code in draw() method from
repeating.
*/

