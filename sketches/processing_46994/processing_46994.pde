
/*
Hackpact Arte Generativo 2011
Dia 17

Martin Zumaya Hernandez
*/


float ang = 0;

void setup(){
 size(700,700);
 smooth();
}

void draw(){
 
 fill(0,100);
 noStroke();
 rect(0,0,width,height);
 translate(width/2,height/2);
 
 for (int i = 0; i < width/2; i ++){
  stroke(255);
  rotate(radians(ang));
  point(i,i);
  stroke(255,0,0); 
  strokeWeight(random(5));
  point(-i,-i);
 }
  ang += 0.1;
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

