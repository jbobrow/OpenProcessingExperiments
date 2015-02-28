
void setup(){
size(920,580);
stroke(255,0,0,200);
frameRate(60);
}
//float x=950,y=550,xn=950,yn=550; 
 void draw(){
 background(255);
 for(float i=0; i<30; i++){
 pushMatrix();
 rectMode(CENTER);
 noFill();
 translate(460,290);
 scale(1/(i/mouseX),1/(i/mouseX)); 
 rotate(radians(i*mouseY));
  rect(0,0,50,50);
  popMatrix();
  }
 }


//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
