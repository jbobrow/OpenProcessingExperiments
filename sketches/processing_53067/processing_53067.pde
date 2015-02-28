
//set size of image
size(250,250);
//smoothing out lines (anti-aliasing)
smooth();
//background colour is white
background(255);
//use loop to draw four quadrants of lines
for(int x=10;x<=120;x+=20){
  //top left
  line(x,125,125,(120-x));
  //top right
  line(x+130,125,125,x);
  //bottom left
  line(x,125,125,x+130);
  //bottom right
  line(x+130,125,125,(250-x));
}
