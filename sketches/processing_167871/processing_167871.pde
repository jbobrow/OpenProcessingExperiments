
//SPERICAL LIGHT made by LEE KUNHEE(39 lines, 35 lines without comments)
float x, y, z, phi, theta;//For Vector value.
float r=10;//initial light spread amount(focus)
int i=1;//sphere sizecount

void setup(){ 
  size(640, 360, P3D);//SCREEN SIZE
  background(0);
}
void draw(){ 
  strokeWeight(0.2+map(i, 0, 1000, 0, 20));//increase strokeWeight as frameCount goes up.
  translate(width/2, height/2, 0);//move (0,0,0) to the center of display 
    
  //draw horizontal line 
  if (i>2000) {stroke(0,5);}//MAKE FADE OUT SCENE AFTER SUNSET. 
  else {stroke(127-map(i, 0, 1000, 0, 100), 255-map(i, 0, 1000, 0, 100), 212-map(i, 0, 1000, 0, 100), 10);}
  spread(180, 950);//180 MEANS DRAW SEMI-SPHERE, 950 MEANS X_POSITION-OFFSET FROM THE CENTER
  spread(180, -950); 
  
  //draw sunlight
  if (i<2000) {stroke(255, 255, 212, 5);}//MAKE SUNSET SCENE. 
  else if (i>3000) {stroke(0, 10);}//MAKE FADE OUT SCENE AFTER SUNSET.  
  else {stroke(255, 150, 50, 5);}//SUNRISING.
  spread(360, 0);//MAKE SPERICAL LIGHT.
  
  i++;//increase the light length.

  if (i==4500)i=0;//initialize if sunset was done.
}

void spread(int degree, float position) {
  //this function generates random line from (0,0,0)center to multiflied vector(ix,iy,iz)
  phi = radians(random(0, degree));
  theta = radians(random(0, degree));
  x = r * sin(phi) * cos(theta);
  y = r * sin(phi) * sin(theta);
  z = r * cos(phi);
  line(position, 0, 0, position+ i*x, i*y, i*z);
}//END
