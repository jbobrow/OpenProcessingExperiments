
int yPos=0;

void setup() {  //setup function called initially, only once
  size(400,400);
  smooth();
  background(126);  //set background white
}

void draw() {  //draw function loops 
  yPos = mouseY;
  if (yPos < 150){
    background(0);
   }
   else if (yPos >= 150 && yPos <= 250){
     background(0,0,255);
   {
   else{
     brackground(255);
   }
 }
