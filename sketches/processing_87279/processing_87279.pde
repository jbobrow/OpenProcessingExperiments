
float xoff = 0.0;
boolean apple = true;
float colr =50.0;
void setup(){
size(600,600);
rectMode(CENTER);
background(0);
}
 
void draw(){
   if(apple == true){
   colr ++;}
   else
   {
     colr--;
   }
 if (colr == 225){
   apple = false;
 }
 if (colr==50){
   apple = true;
 }
 
  noFill();
  strokeWeight(random(1,5));
  stroke(colr,0,0,random(10,30));

  smooth();
   
  xoff = xoff +.005;
  float n = noise(xoff) * width;
  
for( int i = 110; i<500; i+=40)
{
for( int j = 110; j<500; j+=40)
{
 
  rect(i,j,random(20+n),random(20-n));
}
}
 
 frameRate(23);
 
 
 
}


