
///import fullscreen.*;
//FullScreen fs; 
PImage img;int a;int ci[];
color back=color(0);//background color
color fore=color(255);//circle color

/* edit the colors this way ^. to find a color go to the tools menu, 
and click color selecter, then type the r,g,and b (the 2nd one) numbers in 
color parenthesis, like color back=color(1,2,3);
'c' turns off cursor, 'C' turns it on again
space clears everything
holding down mousebutton draws cracks
holding down any key makes the zoomr rate stay constant
from left to right it zooms out quickly, then stays about the same, then zooms in
for fullscreen change the size to screen.width and screen. height*/
void setup(){
  size(600,600);
  //fs = new FullScreen(this); 
  
  // enter fullscreen mode
  //fs.enter(); 
  ci=new int[width*height];
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
      if(abs(y-height/2)<sqrt(sq(width/2)-sq(x-width/2))) {
       ci[x+y*width]=1;
      }
    }
  }
  //smooth();
  imageMode(CENTER);ellipseMode(CORNER);
  img=createImage(width,height,ARGB);
  strokeWeight(5);
  stroke(fore);
  fill(back);
  rect(0,0,width-1,height-1);
    strokeWeight(1.5);
  noFill();
  noCursor();
}
void draw(){
  img.loadPixels();
  loadPixels();
  for(int x=0;x<img.pixels.length;x++){
    img.pixels[x]=(ci[x]==1) ? pixels[x] : color(255,0);
  }
  img.updatePixels();
if(!keyPressed){a=mouseX*2;}
image(img,width/2,height/2,a,a);
  strokeWeight(5);
  ellipse(0,0,width-1,height-1);
    strokeWeight(1.5);


}
void keyPressed(){
  if(key==' '){
  fill(back);
  strokeWeight(7);
  rect(0,0,width-1,height-1);
    strokeWeight(1.5);
    noFill();
  }
  else if(key=='c'){
    noCursor();
  }else if(key=='C'){
    cursor(ARROW);
  }
}
  

