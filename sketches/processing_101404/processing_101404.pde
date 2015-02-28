
float angle01, angle02, angle03, angle04,howBig,spin;

void setup() {
  size( 700,700 );
  background( 255 );
  smooth();
  frameRate( 30 );
 
}

void draw() {
  
  noStroke();
  fill( 255, 15 );
  rect( 0,0,width,height );
    
  imageMode( CENTER );
 
  noCursor(); 
  noStroke();
  
  
  fill( 255, 15 );
  rect( 0,0,width,height );
  
  
  angle01 += .065;
  angle02 += .05;
  angle03 += .09;
  angle04 += .08;
  howBig = random( 8 );
  
  stroke( #ff0000 );
  fill( 0 );
  
  
  spin += 1;
  
  pushMatrix();
  translate(  width/2+5+( 60*cos( angle01 )),148+( 60*sin( angle01 )));
  rotate(spin);
  ellipse( 0,0,howBig,howBig);
  popMatrix();
  
  //rect( width/2+5+( 60*sin( angle01 )), 148+( 60*cos( angle01 )),howBig, howBig );
  
  fill( #00C6FA );
  ellipse( width/2-45+( 60*cos( angle01 )), 168+( 60*sin( angle01 )),howBig, howBig );
  ellipse( width/2-45+( 60*sin( angle01 )), 168+( 60*cos( angle01 )),howBig, howBig );
  ellipse( width/2+65+( 60*cos( angle02 )), 168+( 60*sin( angle02 )),howBig, howBig );
  ellipse( width/2+65+( 60*sin( angle02 )), 168+( 60*cos( angle02 )),howBig, howBig );
  
  fill( #6F3902 );
  ellipse( width/2-95+( 60*cos( angle03 )), 208+( 60*sin( angle03 )),howBig, howBig );
  ellipse( width/2-95+( 60*sin( angle03 )), 208+( 60*cos( angle03 )),howBig, howBig );
  ellipse( width/2+115+( 60*cos( angle04 )), 208+( 60*sin( angle04 )),howBig, howBig );
  ellipse( width/2+115+( 60*sin( angle04 )), 208+( 60*cos( angle04 )),howBig, howBig );
  ellipse( width/2+5+( 60*cos( angle01 )), 208+( 60*sin( angle01 )),howBig, howBig );
  ellipse( width/2+5+( 60*sin( angle01 )), 208+( 60*cos( angle01 )),howBig, howBig );
  
  fill( #FFC505 );
  ellipse( width/2-95+( 60*cos( angle02 )), 268+( 60*sin( angle02 )),howBig, howBig );
  ellipse( width/2-95+( 60*sin( angle02 )), 268+( 60*cos( angle02 )),howBig, howBig );
  ellipse( width/2+5+( 60*cos( angle03 )), 268+( 60*sin( angle03 )),howBig, howBig );
  ellipse( width/2+5+( 60*sin( angle03 )), 268+( 60*cos( angle03 )),howBig, howBig );
  ellipse( width/2+115+( 60*cos( angle04 )), 268+( 60*sin( angle04 )),howBig, howBig );
  ellipse( width/2+115+( 60*sin( angle04 )), 268+( 60*cos( angle04 )),howBig, howBig );
  
  fill( #129502 );
  ellipse( width/2-155+( 60*cos( angle01 )), 288+( 60*sin( angle01 )),howBig, howBig );
  ellipse( width/2-155+( 60*sin( angle01 )), 288+( 60*cos( angle01 )),howBig, howBig );
  ellipse( width/2-45+( 60*cos( angle02 )), 288+( 60*sin( angle02 )),howBig, howBig );
  ellipse( width/2-45+( 60*sin( angle02 )), 288+( 60*cos( angle02 )),howBig, howBig );
  ellipse( width/2+65+( 60*cos( angle03 )), 288+( 60*sin( angle03 )),howBig, howBig );
  ellipse( width/2+65+( 60*sin( angle03 )), 288+( 60*cos( angle03 )),howBig, howBig );
  ellipse( width/2+175+( 60*cos( angle04 )), 288+( 60*sin( angle04 )),howBig, howBig );
  ellipse( width/2+175+( 60*sin( angle04 )), 288+( 60*cos( angle04 )),howBig, howBig );
  
  fill( #B40D69 );
  ellipse( width/2-155+( 60*cos( angle01 )), 228+( 60*sin( angle01 )),howBig, howBig );
  ellipse( width/2-155+( 60*sin( angle01 )), 228+( 60*cos( angle01 )),howBig, howBig );
  ellipse( width/2-45+( 60*cos( angle02 )), 228+( 60*sin( angle02 )),howBig, howBig );
  ellipse( width/2-45+( 60*sin( angle02 )), 228+( 60*cos( angle02 )),howBig, howBig );
  ellipse( width/2+65+( 60*cos( angle03 )), 228+( 60*sin( angle03 )),howBig, howBig );
  ellipse( width/2+65+( 60*sin( angle03 )), 228+( 60*cos( angle03 )),howBig, howBig );
  ellipse( width/2+168+( 60*cos( angle04 )), 234+( 60*sin( angle04 )),howBig, howBig );
  ellipse( width/2+168+( 60*sin( angle04 )), 234+( 60*cos( angle04 )),howBig, howBig );
  
  fill( #F50743 );
  ellipse( width/2-155+( 60*cos( angle01 )), 348+( 60*sin( angle01 )),howBig, howBig );
  ellipse( width/2-155+( 60*sin( angle01 )), 348+( 60*cos( angle01 )),howBig, howBig );
  ellipse( width/2-45+( 60*cos( angle02 )), 348+( 60*sin( angle02 )),howBig, howBig );
  ellipse( width/2-45+( 60*sin( angle02 )), 348+( 60*cos( angle02 )),howBig, howBig );
  ellipse( width/2+65+( 60*cos( angle03 )), 348+( 60*sin( angle03 )),howBig, howBig );
  ellipse( width/2+65+( 60*sin( angle03 )), 348+( 60*cos( angle03 )),howBig, howBig );
  ellipse( width/2+165+( 60*cos( angle04 )), 356+( 60*sin( angle04 )),howBig, howBig );
  ellipse( width/2+165+( 60*sin( angle04 )), 356+( 60*cos( angle04 )),howBig, howBig );
  
  fill( #07F5A7 );
  ellipse( width/2-95+( 60*cos( angle01 )), 328+( 60*sin( angle01 )),howBig, howBig );
  ellipse( width/2-95+( 60*sin( angle01 )), 328+( 60*cos( angle01 )),howBig, howBig );
  ellipse( width/2+5+( 60*cos( angle02 )), 328+( 60*sin( angle02 )),howBig, howBig );
  ellipse( width/2+5+( 60*sin( angle02 )), 328+( 60*cos( angle02 )),howBig, howBig );
  ellipse( width/2+115+( 60*cos( angle03 )), 328+( 60*sin( angle03 )),howBig, howBig );
  ellipse( width/2+115+( 60*sin( angle03 )), 328+( 60*cos( angle03 )),howBig, howBig );
  
  ellipse( width/2-95+( 60*cos( angle04 )), 388+( 60*sin( angle04 )),howBig, howBig );
  ellipse( width/2-95+( 60*sin( angle04 )), 388+( 60*cos( angle04 )),howBig, howBig );
  ellipse( width/2+5+( 60*cos( angle01 )), 388+( 60*sin( angle01 )),howBig, howBig );
  ellipse( width/2+5+( 60*sin( angle01 )), 388+( 60*cos( angle01 )),howBig, howBig );
  ellipse( width/2+115+( 60*cos( angle02 )), 388+( 60*sin( angle02 )),howBig, howBig );
  ellipse( width/2+115+( 60*sin( angle02 )), 388+( 60*cos( angle02 )),howBig, howBig );
  
  fill( #7907F5 );
  ellipse( width/2+65+( 60*cos( angle03 )), 408+( 60*sin( angle03 )),howBig, howBig );
  ellipse( width/2+65+( 60*sin( angle03 )), 408+( 60*cos( angle03 )),howBig, howBig );
  ellipse( width/2+165+( 60*cos( angle04 )), 425+( 60*sin( angle04 )),howBig, howBig );
  ellipse( width/2+165+( 60*sin( angle04 )), 425+( 60*cos( angle04 )),howBig, howBig );
  ellipse( width/2-45+( 60*cos( angle01 )), 408+( 60*sin( angle01 )),howBig, howBig );
  ellipse( width/2-45+( 60*sin( angle01 )), 408+( 60*cos( angle01 )),howBig, howBig );
  ellipse( width/2-155+( 60*cos( angle02 )), 408+( 60*sin( angle02 )),howBig, howBig );
  ellipse( width/2-155+( 60*sin( angle02 )), 408+( 60*cos( angle02 )),howBig, howBig );
  
  fill( #07F584 );
  ellipse( width/2-102+( 60*cos( angle03 )), 448+( 60*sin( angle03 )),howBig, howBig );
  ellipse( width/2-102+( 60*sin( angle03 )), 448+( 60*cos( angle03 )),howBig, howBig );
  ellipse( width/2+5+( 60*cos( angle04 )), 448+( 60*sin( angle04 )),howBig, howBig );
  ellipse( width/2+5+( 60*sin( angle04 )), 448+( 60*cos( angle04 )),howBig, howBig );
  ellipse( width/2+118+( 60*cos( angle01 )), 448+( 60*sin( angle01 )),howBig, howBig );
  ellipse( width/2+118+( 60*sin( angle01 )), 448+( 60*cos( angle01 )),howBig, howBig );
  
  fill( #072CF5 );
  ellipse( width/2-45+( 60*cos( angle02 )), 480+( 60*sin( angle02 )),howBig, howBig );
  ellipse( width/2-45+( 60*sin( angle02 )), 480+( 60*cos( angle02 )),howBig, howBig );
  ellipse( width/2+65+( 60*cos( angle03 )), 480+( 60*sin( angle03 )),howBig, howBig );
  ellipse( width/2+65+( 60*sin( angle03 )), 480+( 60*cos( angle03 )),howBig, howBig );
  
  ellipse( width/2+5+( 60*cos( angle04 )), 508+( 60*sin( angle04 )),howBig, howBig );
  ellipse( width/2+5+( 60*sin( angle04 )), 508+( 60*cos( angle04 )),howBig, howBig );

}
