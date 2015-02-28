
float cervena, modra, zelena;

void setup(){
 smooth(1) ;
 size(326,300);
}

void draw(){
  
  //background(208,255);
cervena = cervena + 1;
modra = modra + 0.7;
zelena = zelena +0.2;

  if(cervena > 255){
   cervena = 0; 
  }
  if(modra > 255){
   modra = 0; 
  }
  if(zelena > 255){
   zelena = 0; 
  }
}

void mouseDragged(){
  
  float r = random(1);
  float vzdalenost = dist(mouseX,mouseY,pmouseX,pmouseY);
  println(vzdalenost);
  stroke(cervena, zelena, modra);
  //strokeWeight(abs(pmouseX - mouseX) ); 
  strokeWeight(vzdalenost * r);
  line(mouseX, mouseY, pmouseX, pmouseY); 
  
  if(abs(pmouseX - mouseX) > 30 ){
    ellipseMode(CENTER);
    ellipse(mouseX,mouseY,10,10);
  }
  

}


