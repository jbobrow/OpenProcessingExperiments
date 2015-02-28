
//Nikolina Borak //Architectural Computing//ARCH1391//Module Two

//inspired by ancientsoundby josé henrique padovani 
//http://www.openprocessing.org/visuals/?visualID=3831 

//the code is the same as original

int w=792,z=99;void setup(){background(0);size(w,w);} 
 
void draw(){ 
//mousePressed added to make interactive

if (mousePressed){ 

//stroke added instead of noStroke to allow interaction to cause a change
  stroke (110,193,16); //colour added
}else { 

//secondary colour added to create constrast
  stroke (255,255,255);} 

//rect defined by properties instead of a formulae
  rect (100,100, 0,0); 

//the rest of the code is the smae
fill(r(w),r(w),0,9);rotate(r(.04));rect(i(),i(),z,z);}  
float r(float a){return random(-a,a);}float i(){return int(r(8))*z;}  
 
 


