
void setup()         //Always starts a program
{                    //program starts
   size(300,400);    //Sets the size for the background
   background(255);  //Sets the backround color
   smooth();   //Sets the backround to smooth rendering
   
   rectMode(CENTER); //show the surrounding boxes that the arcs fit in
   stroke(128);      //Tells the color of the boxes
   rect(35,35, 50,50);
   rect(105, 35, 50, 50);
   rect(175, 35, 50, 50);
   rect(105, 100, 50, 50);
   
   stroke(0);
   arc(35, 35, 50, 0, 0,0);
}

