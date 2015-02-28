
void setup(){

  size (900,700);
  background (0);
  
}

void sunearth(){
 //sun
  translate (450,350);
  fill(250,200,0);
  ellipse(0,0,75,75); 
  rotate(radians(millis()/20));
  //fill (0,0,200);
  //ellipse(150,100,50,50);
  
}

void earthMoon(){
  
  translate(200,150);
  fill (0,0,200);
  ellipse(0,0,50,50);
  rotate(radians(millis()/10));
 // fill(255);
  //ellipse(50,10,15,15);
  

  
}

void moonsat(){

  translate (50,150);
  fill(255);
  ellipse(0,0,15,15);
  rotate(radians(millis()/5));
  fill (0,250,200);
  ellipse(50,10,5,5);
  
}

void draw(){
  
  background (0);
  sunearth();
  earthMoon();
  moonsat();


}
