
//import PDF library
import processing.pdf.*;
//create a boolean to turn recording on/off
boolean record;
void setup () {
size (480, 720);
background (232,150,74); 
}
void draw () {
//use an if statement to start recording
if (record) {
// Note that #### will be replaced with the frame number. Fancy!
beginRecord(PDF, "frame-####.pdf");
}
noStroke();
fill (28,109,113);
rectMode (CENTER);

triangle (width/2+50, height/2-50, width/2, height/2+50, width/2-50, height/2-50);
triangle (width/2-50, height/2+50, width/2, height/2-50, width/2+50, height/2+50);

rectMode (CENTER);
triangle (width/2+50, height/2-100, width/2, height/2, width/2-50, height/2-100); // light blue triangle top
triangle (width/2+50, height/2-150, width/2, height/2, width/2-50, height/2-150);
triangle (width/2+50, height/2-200, width/2, height/2, width/2-50, height/2-200);
triangle (width/2+50, height/2-250, width/2, height/2, width/2-50, height/2-250);
triangle (width/2+65, height/2-300, width/2, height/2, width/2-65, height/2-300);

triangle (width/2-50, height/2+100, width/2, height/2, width/2+50, height/2+100); // light blue triangles bottom
triangle (width/2-50, height/2+150, width/2, height/2, width/2+50, height/2+150);
triangle (width/2-50, height/2+200, width/2, height/2, width/2+50, height/2+200);
triangle (width/2-50, height/2+250, width/2, height/2, width/2+50, height/2+250);
triangle (width/2-65, height/2+300, width/2, height/2, width/2+65, height/2+300);
 

rect (width/4, height/4+120, 20, 20); // light blue rec, left up middle
rect (width/4-10, height/4+130, 20, 20);
rect (width/4-25, height/4+140, 20, 20);
rect (width/4+10, height/4+130, 20, 20);
rect (width/4+25, height/4+140, 20, 20);


rect (width/4, height-height/4-120, 20, 20); // light blue rec, left dowm middle
rect (width/4+10, height-height/4-130, 20, 20);
rect (width/4+25, height-height/4-140, 20, 20);
rect (width/4-10, height-height/4-130, 20, 20);
rect (width/4-25, height-height/4-140, 20, 20);

rect (width-width/4, height-height/4-120, 20, 20); // light blue rec, right down middle
rect (width-width/4+10, height-height/4-130, 20, 20);
rect (width-width/4+25, height-height/4-140, 20, 20);
rect (width-width/4-10, height-height/4-130, 20, 20);
rect (width-width/4-25, height-height/4-140, 20, 20);

rect (width-width/4, height/4+120, 20, 20); // light blue rec, right up middle
rect (width-width/4-10, height/4+130, 20, 20);
rect (width-width/4-25, height/4+140, 20, 20);
rect (width-width/4+10, height/4+130, 20, 20);
rect (width-width/4+25, height/4+140, 20, 20);


rect (width/4, height/4-120, 20, 20); // light blue rec, left top
rect (width/4+10, height/4-130, 20, 20);
rect (width/4+25, height/4-140, 20, 20);
rect (width/4-10, height/4-130, 20, 20);
rect (width/4-25, height/4-140, 20, 20);

rect (width/4, height-height/4+120, 20, 20); // light blue rec,  bottom
rect (width/4-10, height-height/4+130, 20, 20);
rect (width/4-25, height-height/4+140, 20, 20);
rect (width/4+10, height-height/4+130, 20, 20);
rect (width/4+25, height-height/4+140, 20, 20);


rect (width-width/4, height/4-120, 20, 20); // light blue rec, right top
rect (width-width/4+10, height/4-130, 20, 20);
rect (width-width/4+25, height/4-140, 20, 20);
rect (width-width/4-10, height/4-130, 20, 20);
rect (width-width/4-25, height/4-140, 20, 20);

rect (width-width/4, height-height/4+120, 20, 20); // light blue rec, bottom
rect (width-width/4-10, height-height/4+130, 20, 20);
rect (width-width/4-25, height-height/4+140, 20, 20);
rect (width-width/4+10, height-height/4+130, 20, 20);
rect (width-width/4+25, height-height/4+140, 20, 20);




fill (208,56,15); // left top orange
rect (width/4+2, height/4-70, 20, 20);
rect (width/4+20, height/4-80, 20, 20);
rect (width/4+35, height/4-90, 20, 20);
rect (width/4-15, height/4-80, 20, 20);
rect (width/4-31, height/4-90, 20, 20);
rect (width/4+2, height/4-60, 20, 20);
rect (width/4+20, height/4-70, 20, 20);
rect (width/4+35, height/4-80, 20, 20);
rect (width/4-15, height/4-70, 20, 20);
rect (width/4-31, height/4-80, 20, 20);
rect (width/4+2, height/4+60, 20, 20); // middle lef
rect (width/4+20, height/4+70, 20, 20);
rect (width/4+35, height/4+80, 20, 20);
rect (width/4-15, height/4+70, 20, 20);
rect (width/4-31, height/4+80, 20, 20);
rect (width/4+2, height/4+50, 20, 20); 
rect (width/4+20, height/4+60, 20, 20);
rect (width/4+35, height/4+70, 20, 20);
rect (width/4-15, height/4+60, 20, 20);
rect (width/4-31, height/4+70, 20, 20);

rect (width-width/4-2, height/4-70, 20, 20); // right
rect (width-width/4-20, height/4-80, 20, 20);
rect (width-width/4-35, height/4-90, 20, 20);
rect (width-width/4+15, height/4-80, 20, 20);
rect (width-width/4+31, height/4-90, 20, 20);
rect (width-width/4-2, height/4-60, 20, 20); // right
rect (width-width/4-20, height/4-70, 20, 20);
rect (width-width/4-35, height/4-80, 20, 20);
rect (width-width/4+15, height/4-70, 20, 20);
rect (width-width/4+31, height/4-80, 20, 20);

rect (width-width/4-2, height-height/4-70, 20, 20); // right down
rect (width-width/4-20, height-height/4-80, 20, 20);
rect (width-width/4-35, height-height/4-90, 20, 20);
rect (width-width/4+15, height-height/4-80, 20, 20);
rect (width-width/4+31, height-height/4-90, 20, 20);
rect (width-width/4-2, height-height/4-60, 20, 20); // right down
rect (width-width/4-20, height-height/4-70, 20, 20);
rect (width-width/4-35, height-height/4-80, 20, 20);
rect (width-width/4+15, height-height/4-70, 20, 20);
rect (width-width/4+31, height-height/4-80, 20, 20);


rect (width-width/4-2, height/4+60, 20, 20); // right down
rect (width-width/4-20, height/4+70, 20, 20);
rect (width-width/4-35, height/4+80, 20, 20);
rect (width-width/4+15, height/4+70, 20, 20);
rect (width-width/4+31, height/4+80, 20, 20);
rect (width-width/4-2, height/4+50, 20, 20); // right down
rect (width-width/4-20, height/4+60, 20, 20);
rect (width-width/4-35, height/4+70, 20, 20);
rect (width-width/4+15, height/4+60, 20, 20);
rect (width-width/4+31, height/4+70, 20, 20);
rect (width-width/4-2, height-height/4+60, 20, 20); // right down down
rect (width-width/4-20, height-height/4+70, 20, 20);
rect (width-width/4-35, height-height/4+80, 20, 20);
rect (width-width/4+15, height-height/4+70, 20, 20);
rect (width-width/4+31, height-height/4+80, 20, 20);
rect (width-width/4-2, height-height/4+50, 20, 20); // right down down
rect (width-width/4-20, height-height/4+60, 20, 20);
rect (width-width/4-35, height-height/4+70, 20, 20);
rect (width-width/4+15, height-height/4+60, 20, 20);
rect (width-width/4+31, height-height/4+70, 20, 20);

fill (208,56,15); // left d 
rect (width/4+2, height-height/4+70, 20, 20);
rect (width/4+20, height-height/4+80, 20, 20);
rect (width/4+35, height-height/4+90, 20, 20);
rect (width/4-15, height-height/4+80, 20, 20);
rect (width/4-31, height-height/4+90, 20, 20);
rect (width/4+2, height-height/4+60, 20, 20);
rect (width/4+20, height-height/4+70, 20, 20);
rect (width/4+35, height-height/4+80, 20, 20);
rect (width/4-15, height-height/4+70, 20, 20);
rect (width/4-31, height-height/4+80, 20, 20);

rect (width/4+2, height-height/4-60, 20, 20); // left down
rect (width/4+20, height-height/4-70, 20, 20);
rect (width/4+35, height-height/4-80, 20, 20);
rect (width/4-15, height-height/4-70, 20, 20);
rect (width/4-31, height-height/4-80, 20, 20);

rect (width/4+2, height-height/4-50, 20, 20); // left down
rect (width/4+20, height-height/4-60, 20, 20);
rect (width/4+35, height-height/4-70, 20, 20);
rect (width/4-15, height-height/4-60, 20, 20);
rect (width/4-31, height-height/4-70, 20, 20);



fill(107,76,43);
rect (width/4, height/4, 100, 60);
rect (width-width/4, height/4, 100, 60);
rect (width/4, height-height/4, 100, 60);
rect (width-width/4, height-height/4, 100, 60);


fill(61,54,46);
rect (width/4, height/4, 80, 40);
rect (width-width/4, height/4, 80, 40);
rect (width/4, height-height/4, 80, 40);
rect (width-width/4, height-height/4, 80, 40);

fill(107,76,43);
rect (width/4, height/4, 50, 10);
rect (width-width/4, height/4, 50, 10);
rect (width/4, height-height/4, 50, 10);
rect (width-width/4, height-height/4, 50, 10);

fill (232,150,74);
rect (width/4, height/4, 20, 2.5);
rect (width-width/4, height/4, 20, 2.5);
rect (width/4, height-height/4, 20, 2.5);
rect (width-width/4, height-height/4, 20, 2.5);

fill (107,76,43);
triangle (width/4+15, height/2-15, width/4, height/2+15, width/4-15, height/2-15);
triangle (width/4-15, height/2+15, width/4, height/2-15, width/4+15, height/2+15);
triangle (width-width/4+15, height/2-15, width-width/4, height/2+15, width-width/4-15, height/2-15);
triangle (width-width/4-15, height/2+15, width-width/4, height/2-15, width-width/4+15, height/2+15);

noFill();
stroke (61,54,46);
strokeWeight (25);
//outer rectangle3
rect (width/2, height/2, width, height);
strokeWeight (10); //thick line
//draw rectangles
for (int i = 1; i < 3; i++) {
rect (width/2, height/2, width -i*50, height-i*50);
}
for (int i = 45; i <=675; i +=30) {
//draw left inner edge
 stroke (61,54,46); 
rect (30, i, 5, 5);
rect (450, i, 5, 5);
}
for (int i = 45; i <=450; i +=30){
rect (i, 30, 5, 5);
rect (i, 690, 5, 5);
}

}


                
                                
