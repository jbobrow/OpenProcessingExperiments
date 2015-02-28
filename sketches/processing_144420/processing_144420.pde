
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: Seo Yu Mi
 // ID: 201420082 Seo Yu Mi



void setup(){
  size(600,600);
  textSize(17);
  
}

void draw(){
  background(255,255,255);
  translate(width/2, height/2);
  fill(#FFAE17);
  stroke(255);
  strokeWeight(10);
  
 pushMatrix();
 arc(0,0,350,350,0, radians(minute()*6));
 text(second(),200,0);
 popMatrix();
 
 pushMatrix();
 arc(0,0,350,350,0,radians(minute()*6));
 rotate(radians(minute()*6));
 text(minute(),200,0);
 popMatrix();
 
 pushMatrix();
 arc(0,0,300,300,0, radians(hour()*15));
 rotate(radians(hour()*15));
 text(hour(),180,0);
 popMatrix();
  

}
