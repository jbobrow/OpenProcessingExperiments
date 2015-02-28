
/////////CLASS

class Bubble{
 String name;
 int numEmails;
 float posX, posY;
 float xspeed;
// color c;
 boolean displayName = false;
 //boolean displayNum = false;

 Bubble(String theName, int theNumEmails, float thePosX, float
thePosY, float theXSpeed){
   name = theName;
   numEmails = theNumEmails;
   posX = thePosX;
   posY = thePosY;
   xspeed = theXSpeed;
//    c = c_;
 }


/////////MOVE
 void move() {
   posY = posY - xspeed;
   if (posY < -height) {
     posY = height;
   }


   if (mouseX > ((width/3)*2)) {
     posX = posX + (xspeed/4);
   }

   if (mouseX < (width/3)) {
     posX = posX - (xspeed/4);
   }

   else {
    posX = posX;
   }

   if (posX > width) {
     posX = 0;
   }
 }


/////////DISPLAY

 void display() {
    stroke(0,0,0,80);
    fill(255,255,255,150);
    ellipse(posX,posY, numEmails,numEmails);

 }

/////////DRAWNAME

 void drawName(){
  if (displayName){
    fill (0);
    textFont(font);
    text(name, posX, posY);

  }
 }

/////////TESTHIT

 boolean testHit(float mouseX, float mouseY){
  float d = dist(mouseX, mouseY, posX, posY);
  if (d <= (numEmails/2))
    return true;
  else
    return false;
 }

}

