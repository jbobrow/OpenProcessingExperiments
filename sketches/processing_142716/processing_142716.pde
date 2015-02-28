

// Built with 0.60 Alpha,
// based on Proce55ing noise() example.
// by Alessandro Capozzo - GHOSTAGENCY
// 3rd October 2003
// EDITED and UPDATED by Kevin Gutowski
// 1st April 2014

float noiseScale=0.03f; 
void setup(){
 size(1000,300);
 background(230,230,210);
 smooth();
}
float n=0.00f;
float d=0.5f;
void draw() {
  n=n+d;
  background(230,230,210); 
  for (int y=0; y<40; y++) {
   for(int x=0; x<300; x++) { 
    float noiseVal = noise((n+x)*noiseScale,(-n+y)*noiseScale,y*noiseScale); 
    stroke((noiseVal*400),100,(noiseVal*400)); 
    point(x*3.5,noiseVal*300);
    } 
  }
} 
