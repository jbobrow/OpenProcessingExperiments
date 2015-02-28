
/**

* 
* Reading and displaying an image from an attached Capture device. 
*/ 

import processing.video.*;

float signal;

Capture cam;

void setup() {
 size(1000,1000);
 
   String[] devices = Capture.list();
 cam = new Capture(this, width, height, devices[1]);
}


void draw() {
 if (cam.available() == true) {
   cam.read();
   image(cam, 0,0);

  cam.loadPixels();
   loadPixels();
       
   
//fill (0,0,0,200);
//rect(0,0,1000,1000);



//  int mx = constrain(mouseX, 0, cam.width-1);
 //  int my = constrain(mouseY, 0, cam.height-1);
   
   int mx = width/2;
   int my = height/2;
   
   
   signal = my*cam.width + mx;


 int sx = int(signal) % cam.width;
 int sy = int(signal) / cam.width;

 color ca = cam.get(sx-100, sy-100);
 color cb = cam.get(sx, sy);
  color cc = cam.get(sx-20, sy-20);
   color cd = cam.get(sx-20, sy-100);
   color ce = cam.get(sx-100, sy-20);
   color cf = cam.get(sx-80, sy-80);
   color cg = cam.get(sx-60, sy-60);

    //   rect(20,20,40,40);
//   fill(ca);

noStroke();

   beginShape();
fill(ca);
vertex(499, 120);
vertex(333, 509);
vertex(339, 509);
vertex(438, 275);
vertex(512, 275);
vertex(612, 509);
vertex(735, 509);
vertex(732, 503);
vertex(661, 503);
endShape();



 //  rect(70,20,40,40);
  // fill(cb);


   beginShape();
fill(cb);
vertex(339, 509);
vertex(380, 509);
vertex(450, 275);
vertex(438, 275);
endShape();






 //  rect(120,20,40,40);
 //  fill(cc);


   beginShape();
fill(cc);
vertex(380, 509);
vertex(432, 509);
vertex(468, 275);
vertex(450, 275);
endShape();






 //  rect(170,20,40,40);
   //fill(cd);


   beginShape();
fill(cd);
vertex(432, 509);
vertex(484, 509);
vertex(480, 275);
vertex(468, 275);
endShape();

     //  rect(170,20,40,40);
   //fill(ce);

   beginShape();
fill(ce);
vertex(484, 509);
vertex(536, 509);
vertex(496, 275);
vertex(480, 275);
endShape();


     //  rect(170,20,40,40);
   //fill(cf);


   beginShape();
fill(cf);
vertex(536, 509);
vertex(574, 509);
vertex(502, 275);
vertex(496, 275);
endShape();


        //  rect(170,20,40,40);
   //fill(cg); 

   beginShape();
fill(cg);
vertex(574, 509);
vertex(612, 509);
vertex(512, 275);
vertex(502, 275);
endShape();



/////   BOTTOM LAYER



// outer dark blue
beginShape();
fill(ca);

vertex(498, 898);
vertex(663, 509);
vertex(657, 509);
vertex(558, 740);
vertex(482, 740);
vertex(386, 509);
vertex(262, 509);
vertex(268, 515);
vertex(336, 515);
endShape();



//inner taupe
beginShape();
fill(cb);
vertex(657, 509);
vertex(617, 509);
vertex(543, 740);
vertex(558, 740);
endShape();



//cream 1
beginShape();
fill(cc);
vertex(617, 509);
vertex(560, 509);
vertex(529, 740);
vertex(543, 740);
endShape();



//royal blue
beginShape();
fill(cd);

vertex(560, 509);
vertex(498, 509);
vertex(514, 740);
vertex(529, 740);
endShape();


//sky blue
beginShape();
fill(ce);
vertex(498, 509);
vertex(458, 509);
vertex(504, 740);
vertex(514, 740);
endShape();



//cream 2
beginShape();
fill(cf);
vertex(458, 509);
vertex(417, 509);
vertex(496, 740);
vertex(504, 740);
endShape();


//pink
beginShape();
fill(cg);
vertex(417, 509);
vertex(386, 509);
vertex(482, 740);
vertex(496, 740);
endShape();




 }
}


