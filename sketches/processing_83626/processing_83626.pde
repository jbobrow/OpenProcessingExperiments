
boolean goldrectclick = false; // determine whether or not a rectangle will pop up
boolean bar_2007 = false;//determine whether or not 2007 data shows up
boolean bar_2008 = false;//determine whether or not 2008 data shows up
boolean bar_2009 = false;//determine whether or not 2009 data shows up
boolean bar_2010 = false;//determine whether or not 2010 data shows up
boolean bar_2011 = false;//determine whether or not 2011 data shows up

void setup() {
  size(1700, 600);
} //size of screen
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



/////////////////////////////////////BEGINDRAW
void draw () {
  background(#cccccc);
  rect(25, 75, 100, 60); //draw main 'button' rectangle

  if (goldrectclick == true) { buttons2005(30, 150); } //if this is true, create what is in but buttons2005 function, carry x and y data to pass it on
  
  if (bar_2007 == true) { bars(100,160); } //if this is true, create what is in bar2007
  if (bar_2008 == true);
  if (bar_2009 == true);
  if (bar_2010 == true);
  if (bar_2011 == true);
  
 ////////////////////////////////////ENDOFDRAW




//////////////////////////////////////BUTTONS2005
void buttons2005(float _x, float _y) {
  int buttonW=70;
  int buttonH=30;
  rect(_x, _y, buttonW, buttonH);
  rect(_x, _y+50, buttonW, buttonH);
  rect(_x, _y+100, buttonW, buttonH);
  rect(_x, _y+150, buttonW, buttonH);
  rect(_x, _y+200, buttonW, buttonH);
}/////////////////////////////////ENDOFBUTTONS2005


//////////////////////////////////BEGINBARS
void bars(float _x, float _y); {
  int barH=20;
  rect(_x,_y, 699, barH);
  rect(_x,_y, 874, barH);
  rect(_x,_y, 975, barH);
  rect(_x,_y, 1227, barH);
  rect(_x,_y, 1227, barH);
}/////////////////////////////////ENDOFBARS


/////////////////////////////////BEGINMOUSECLICKED
void mouseClicked() { //if the mouse is clicked within the first button boundaries, set the boolean to true
  if ((mouseX > 25 && mouseX < 126) && (mouseY > 75  && mouseY < 136)) {
  if (goldrectclick == true) {
        goldrectclick = false;
      } 
      else {
        goldrectclick = true;
      }
    }
  }
