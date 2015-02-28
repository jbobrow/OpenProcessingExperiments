

void setup (){
  size (800,800);
  smooth ();
  

}


void draw(){
  background (70, 110, 250);
  stroke (2);
  translate (width/2, height/2);
  float n = mouseX/40 + 2;
  
 for ( float i=0;i<n; i++){ 
 
  aLine (-mouseY, random (7) +i*360/n, -mouseY+ (i+1)*360/n);
 
  
}
  
  
}


void aLine (float r, float a1, float a2){
  
  line (r*cos (radians(a1)), r*sin (radians(a1)),r*cos (radians(a2)), r*sin (radians(a2)));
}

