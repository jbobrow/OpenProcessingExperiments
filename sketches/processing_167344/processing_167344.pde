
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

    translate(50,50); 
    rotate(r);
    //rectangle will spin around one corner
    rect(-25,-25,50,50);
    
 //cancels the translate position
resetMatrix();
//new possition
    translate(150,50); 
    rotate(r);
    //rectangle will spin around one corner
    rect(-25,-25,50,50);
resetMatrix();

    translate(50,150); 
    rotate(r);
    //rectangle will spin around one corner
    rect(-25,-25,50,50);
resetMatrix();

    translate(150,150); 
    rotate(r);
    //rectangle will spin around one corner
    rect(-25,-25,50,50);
resetMatrix();


r=r+0.02;



}


