
//Youshin Song. CC-SecB
// Key press = 0 background change
// Key press = any number

void setup () {
 size (500,500);
 background (255);
 smooth ();
 noStroke (); 
}

void draw () {
 int ellipse_color = round (map(mouseX, 0, width, 0, 255));
 ellipse (100, 100, 100, 100);
 ellipse (250, 100, 100, 100);
 ellipse (400, 100, 100, 100);
 ellipse (100, 250, 100, 100);
 ellipse (250, 250, 100, 100);
 ellipse (400, 250, 100, 100); 
 ellipse (100, 400, 100, 100);
 ellipse (250, 400, 100, 100);
 ellipse (400, 400, 100, 100);
 

 if (keyPressed) {
   if (key == '1') {
   fill (100, 100, ellipse_color);
   }
   else if (key == '2') {
   fill (100, ellipse_color, 100);
   }
   else if (key == '3') {
   fill (ellipse_color, 100, 100);
   }
   else if (key == '4') {
   fill (200, ellipse_color, 200);
   }
   else if (key == '5') {
   fill (ellipse_color, 200, 200);
   }
   else if (key == '6') {
   fill (200, 200, ellipse_color);
   }
   else if (key == '7') {
   fill (250, ellipse_color, 250);
   }
   else if (key == '8') {
   fill (ellipse_color, 250, 250);
   }
   else if (key == '9') {
   fill (250, 250, ellipse_color);
   }
 }
 
 if (keyPressed){
   if (key == '0') {
   background (ellipse_color);
   }
 }
}


