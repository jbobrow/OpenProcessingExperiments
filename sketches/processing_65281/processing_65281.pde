
int r = (7); // ball radius
float xmag, ymag = 0;
float newXmag, newYmag = 0; 
int x , y , z;
int cbsz=8 , cbsps=50; // cube size, cube space

void setup(){
  size(600,600,P3D);
  noStroke();
  colorMode(RGB, 1); 
}

void draw(){
  background(0.5);
  lights();
  translate((550-(cbsps*cbsz))/2, (550-(cbsps*cbsz))/2, 0);

    translate(cbsps*(cbsz/2) , cbsps*(cbsz/2) , -cbsps*(cbsz)); 
    newXmag = mouseX/float(width) * TWO_PI;
    newYmag = mouseY/float(height) * TWO_PI;
    
    float diff = xmag-newXmag;
    if (abs(diff) >  0.01) { xmag -= diff/4.0; }
    
    diff = ymag-newYmag;
    if (abs(diff) >  0.01) { ymag -= diff/4.0; }
    
    rotateX(-ymag); 
    rotateY(-xmag); 
    
    translate(-cbsps*(cbsz/2) , -cbsps*(cbsz/2) , cbsps*(cbsz/2));  

  for(z=0 ; z<cbsz ; z++){
    translate(0, 0, -cbsps);
    for(y=0 ; y<cbsz ; y++){
      translate(0, cbsps, 0);
      for(x=0 ; x<cbsz ; x++){
        translate(cbsps, 0, 0);
        sphere(r);
      }
      translate(-cbsps*cbsz, 0, 0);
    }
    translate(0, -cbsps*cbsz, 0);
  }
  translate(0, 0, cbsps*cbsz);

}

