

size (300, 300);
colorMode(RGB, width/2);//width determines area affected
smooth();

for (int y=0; y<height; y++){
  for(int x=0; x<width;x++){
    stroke(width/-4,x-260,y-260);//width/4 affects color range of spectrum and negative shapes background 
    point(x,y);
  }
}


int margin =15;//space from edge
int spacing = 40;//number of objects--larger is like a zoom factor-more objects

for (int y=margin; y< height-margin; y+=spacing) {

  pushMatrix();

  translate(0-40, spacing);//x origin

  for (int x=margin; x<width-margin; x+=spacing) {//concept is to draw one and then it is copied multiple times
    translate(spacing, 0-40);//y origin

    stroke (128);//line color
    fill (7, 199, 245, 50);//fill and transparency
    pushMatrix();//
    rotate(radians(random (100)));//degree conversion locked to 90

      rect (0, 0, spacing-5, spacing-5);


    fill (245, 194, 7, 50);
    ellipse (0, 0, (spacing-5)/2, 10);
    popMatrix();//
  }
  popMatrix();//resets origin to 0
  translate (0, spacing);
}




