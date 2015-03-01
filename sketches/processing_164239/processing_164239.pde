
int x,y,ix,iy;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(250,150,250);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  ix=iy=1;
  x=30;
}

void draw() {  //draw function loops 
  noStroke();
  fill(random(255),100,255,50);

  x=x+ix;
  y=y+iy;
  ellipse(x,y,20,20);
  if( x>=250||x<=0 )ix = -ix;
    if( y>=250||y<=0 )iy = -iy;
   

/*

  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
  */
}
