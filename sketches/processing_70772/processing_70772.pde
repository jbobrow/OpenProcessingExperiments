
//marcela ortiz r s
//creative computing hmw 3 button
//9.18.12

//set circle info
//the actual ellipse will be added at the end
int circle_x;
int circle_y; 
int circle_diameter = 150; 

//boolean
boolean overCircle = false; 
//setup runs one time
void setup() { 
 //set window size and circle width and height - /2 is the same as .5
 //with /2 it will always be in the middle of the window
  size (550,550);
  circle_x = width/2;
  circle_y = height/2;
}; 

  void draw () {
    background(20, 60, 200); //blue background
    
    //distance of mouse to center of circle should be less than the radius to be inside circle
        if ( dist(circle_x, circle_y, mouseX, mouseY) < circle_diameter/2 ) {
    fill(226, 67, 108); 
    overCircle = true; 
 } else {
//i had a lot of problems with "else".. review
//also it said unexpected token &&

    overCircle=false;
   fill(255, 222, 57); 
 };
  if ((mousePressed == true) && (overCircle == true)) {
    //if mouse is pressed and overCircle is true, change fill to light green
    fill(108, 222, 57);
  };
  //ellipse (circle)
  ellipse(circle_x, circle_y, circle_diameter, circle_diameter); 
   if (overCircle == false) {
  };
};

