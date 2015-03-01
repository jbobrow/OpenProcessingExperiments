
float alpha = 140;
float easing = 0.09;
float easing2 = 0.11;
float mx;
float mxx;
float my;
float myy;

void setup(){
   size(400,400,P3D); 
   rectMode(CORNERS);
}

void draw(){
background(255);
  
if ((mouseY - my) > .1) {
    my = my + (mouseY- my) * easing;
}
else{
    my = my + (mouseY- my) * easing2;
}
if ((mouseY - myy) > .1) {
    myy = myy + (mouseY- myy) * easing2;
}
else{
    myy = myy + (mouseY- myy) * easing;
}

my = constrain(my,10,310);
myy = constrain(myy,20,320);
  
noStroke();  
  
fill(#146CB9,190); //Front wing 
  beginShape();
    vertex(200, my);
    vertex(201, 194);
    vertex(110, 150);
  endShape();  
  
fill(#66B2FF,230); //Neck of crane    
  beginShape();
    vertex(100, 90);
    vertex(110, 150);
    vertex(140, 125);
  endShape();   
  
fill(#9AD0FF,alpha);  //Head of the crane
  beginShape();
    vertex(100, 90);
    vertex(134, 118);
    vertex(60, 115);
  endShape();     
  
  fill(#66B2FF,230); //Body of crane     
  beginShape();
    vertex(140, 125);
    vertex(280, 230);
    vertex(110, 150);
  endShape();  
  
fill(#137BD5,195); //Back wing
  beginShape();
    vertex(240, myy);
    vertex(200, 192);
    vertex(110, 150);
  endShape();

}
