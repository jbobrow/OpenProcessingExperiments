
background(176,196,222);

int x = 700;
int y = 700;
size(x,y);

//line//
line(width,height,width/2,height/2);
line(width*25, height+25, width/2,height/2);
line(width*35,height*35, width/2,height/2);
line(width*100,height +25,width/2,height/2);
line(width*200,height, width/2,height/2);

//ellipse//
noStroke();
fill(255,25,50,100);
ellipse(width,height,width/2,height/2);
ellipse(width +25, height +25, width/2,height/2);
ellipse(width +35,height +35, width/2,height/2);
ellipse(width +45,height +45, width/2,height/2);
ellipse(width +60,height +60, width/2,height/2);
ellipse(width +80,height +80, width/2,height/2);
ellipse(width +105,height +105, width/2,height/2);
ellipse(width +140,height +140, width/2,height/2);
ellipse(width + 185, height + 185,width/2,height/2);
fill(25,25,255,100);
ellipse(x +25,y+25,x/2,y/2);

//triangle//
fill(25,200,255,75);
triangle(x/2,y/2,x/2,y,x,y/2);

//rectangle//
fill(25,150,200,25);
rect(x/2,y/2,x/2,y);
