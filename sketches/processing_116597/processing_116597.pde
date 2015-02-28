
int redvalue = int(random (0, 255));
int greenvalue = int(random(125));
int bluevalue = int(random(125));
int redding = 0;

void setup() {
  
  size (500, 500);
  background (redvalue, greenvalue, bluevalue);
}




void draw() {
  
 fill (redvalue, greenvalue,bluevalue);
 noStroke ();
 rect (random(490), random(490), 10, 10);
  
 if (redding == 0) {
redvalue --; // this bit decrements the red value;
 }
 
  if (redding == 1) {
redvalue ++; // this bit increments the red value;
 }
  
 if (redvalue == 0){
   redding = 1;
 }

  if (redvalue == 255){
   redding = 0;
 }


 
 
}
