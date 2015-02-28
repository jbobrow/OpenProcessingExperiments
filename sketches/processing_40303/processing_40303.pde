
/*Franklin Romero Jr
ICA in Boston, I sought to create a 3d diagram of the concept for the ICA,
I did it in 3d because that's the best way to understand the conceptual 'fold
of the city fabric'. through horizontal movement, the glass in front of the 
gallery area, was supposed to go from opaque to transparent (0nly revealing 
the city perpendicular to the person inside), unfortunately in the final 
building the mayor requested that it be removed. The gallery (box)in this diagram
changes in transparancy for this reason.
*/
void setup () { 
size(1000, 1000, P3D);
smooth();
strokeWeight(1);
stroke(0);
}


//Draw loop statement to redraw 3dbuilding
void draw () {
   background(255,200,0);
   fill (255,mouseX/4);

  //DRAW MUSEUM
  int x,y,z;
    x=360;
    y=70;
    z=240;
  box(x,y,z);

  //DRAW PUBLIC SPACE
  for (int a=0; a<=360; a++) { 
    line(x/2-a, y/2, z/2, x/2-a, y/2, z/-2);
  }
  for (int b=0; b<=25; b++){
    line(x/2-360, y/2+b, z/2, x/2-360, y/2+b, z/-2);
  }
  //LEFT CAFE AREA
  for (int b=0; b<=240; b++){
    line(x/2-360+b, y/2+25, z/2, x/2-360+b, y/2+25, z/-2+z/2);
  }
  for (int b=0; b<=35; b++){
    line(x/2-120, y/2+25+b, z/2, x/2-120, y/2+25+b, z/-2+z/2);
  }
  for (int b=0; b<=35; b++){
    line(x/2-120-b, y/2+60, z/2, x/2-120-b, y/2+60, z/-2+z/2);
  }
  for (int b=0; b<=35; b++){
    line(x/2-155, y/2+60+b, z/2, x/2-155, y/2+60+b, z/-2+z/2);
  }
    //LEFT CAFE AREA PUBLIC
     for (int b=0; b<=115; b++){
      line(x/2-155+b, y/2+95, z/2, x/2-155+b, y/2+95, z/-2+z/2);
    }
    
    //PUBLIC WALK
    for (int b=0; b<=40; b++){
      line(x/2-40+b, y/2+95, 700, x/2-40+b, y/2+95, -700);
    }
  //RIGHT STAGE AREA
   for (int b=0; b<=35; b++){
    line(x/2-360+(b*4), y/2+25+b, z/-2+z/2, x/2-360+(b*4), y/2+25+b, z/-2);
   }
   for (int b=0; b<=40; b++){
    line(x/2-220+b, y/2+60, z/-2+z/2, x/2-220+b, y/2+60, z/-2);
   }
   for (int b=0; b<=35; b++){
    line(x/2-180+(b*4), y/2+60+b, z/-2+z/2, x/2-180+(b*4), y/2+60+b, z/-2);
   }
  
if (mousePressed == true) {
  //From Camera Reference on processing.org
      beginCamera();
      camera(-0, mouseY/8, 600.0,
      0, 0, 0, 
      0.0, 1.0, 0);
    endCamera();
} else {
    beginCamera();
      camera(mouseX+200, mouseY/10, 220.0, // eyeX, eyeY, eyeZ
      0.0, 0.0, 0.0, // centerX, centerY, centerZ
      0.0, 1.0, 0.0); // upX, upY, upZ
    endCamera();
 }

}


