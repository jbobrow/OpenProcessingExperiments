
/*
Hackpact Arte Generativo 2011
Dia 27

Martin Zumaya Hernandez
*/


float ang = 0;
float k = 1;

void setup(){
 size(700,700);
 colorMode(HSB);
 smooth();
}

void draw(){
  
 k = mouseY/8; 

 fill(0,10);
 noStroke();
 rect(0,0,width,height);
 
 pushMatrix(); 
 translate(width/4,height/4); 
 points(ang,20,k); 
 popMatrix();
 
  pushMatrix(); 
 translate(3*width/4,height/4); 
 points(-ang,60,k); 
 popMatrix();
 
  pushMatrix(); 
 translate(width/4,3*height/4); 
 points(ang,80,k); 
 popMatrix();
 
  pushMatrix(); 
 translate(3*width/4,3*height/4); 
 points(-ang,140,k); 
  popMatrix();
  
  ang += 0.1;
}

void points(float ang,float base,float k){ 
     
  for (int i = 0; i < width/4; i += 1){
  stroke(base+50*sin(ang*5),200,200);
  strokeWeight(random(5));
  rotate(radians(ang/k));
  point(i,i);
  stroke(base+80*sin(ang*5),200,200);
  point(i,-i);
  stroke(base+20*sin(ang*5),200,200);
  point(-i,i);
  stroke(base+10*sin(ang*5),200,200);
  point(-i,-i);
  strokeWeight(1);
// line(i,i,-i,-i);
 }
 
 
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

