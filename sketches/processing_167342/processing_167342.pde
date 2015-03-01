
float r=0;

void setup(){
  //Setting up background size
  size(200,200); 
  //Setting up a white background
  background(255); 
 
}

void draw(){
  
//redraws the background so that shapes are not drawn ontop of old ones
background(255);

    translate(100,100); 
    rotate(r);
    //rectangle will spin around one corner
    rect(0,0,50,50);
resetMatrix();

r=r+0.02;




}


