
int x,y,ix,iy;
PImage i1;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(250,150,250);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  ix=iy=1;
  x=30;
 i1 = loadImage("http://files.softicons.com/download/web-icons/free-colored-minicons-by-pixlsby.me/png/16x16/Pacman.png");
}

void draw() {  //draw function loops 
  noStroke();
//  fill(random(255),100,255,50);
  background(250,150,250);
  x=x+ix;
  y=y+iy;
  ellipse(x,y,20,20);
image(i1,x,y);
  if( x>=250||x<=0 )ix = -ix;//*1+random(1);
    if( y>=250||y<=0 )iy = -iy;//*1+random(1);
   

/*

  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
  */
}
