
//initial values
PImage panda;
float xPos = 10;
float yPos = 20;

//setup
void setup (){
 size (900, 450);
 //panda
 panda = loadImage ("Cut-out panda copy.png");
   
}
//draw
void draw () {
  background (255,215,0);
  //rising sun
  noStroke ();
  fill (255,187,37);
  ellipse (20, 20, 200, 200);
  //bamboo loop
  for (int i=20; i<=width; i +=60){
   strokeWeight (17);
   stroke (139,139,0);
   line (i, 0, i, 500);}
   for (int i=20; i<=width; i +=130){
   strokeWeight (19);
   stroke (205,205,0);
   line (i, 0, i, 500);}
   //draw the panda
   pandafunction (xPos, yPos);
   //move panda
   if (keyPressed) {
   movePanda ();} 
   //bamboo loop in front of panda
   for (int i=50; i<=width; i +=90){
   strokeWeight (14);
   stroke (139,150,0);
   line (i, 0, i, 500);}

}
//panda function
void pandafunction (float xPos, float yPos) {
  image (panda, xPos, yPos);
}

//function that makes the panda move
void movePanda () {
if (key ==CODED) {
  if (keyCode == RIGHT) {
    xPos = (xPos + 1);
  }else if (keyCode == LEFT){
     xPos = (xPos-1);}
}
}

