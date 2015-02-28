
float x = 50;
float y = 50;
int redammt = 200;
int blueammt = 200;
int greenammt = 5;
void setup(){
  size (700,400);
   

}
void draw(){
noFill();
   
}
void mouseDragged() {
  noStroke();
  ellipse(x, y, x, y);
  fill(redammt,blueammt,greenammt,10);

       x = x + (mouseX - x)/50.0;
  y = y + (mouseY - y)/50.0;
 if (mousePressed && (mouseButton == RIGHT)) {
  redammt = redammt - 5;
  blueammt = blueammt - 5;
  greenammt = greenammt + 5;
   }
   if (blueammt  < 1){
   blueammt = 200;
 }
    if (redammt  < 1){
   redammt = 200;
 }
   if (greenammt > 250){
     greenammt = 5;
   }
}


