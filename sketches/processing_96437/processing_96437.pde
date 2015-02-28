
class needle{
  float angle;
  needle(float ang){
    angle =ang;
  }
  void draw(){
    
    pushMatrix();
    translate(width/2,height/2);
    rotate(radians(angle));
    noStroke();
    fill(255);
    ellipse(200,0,100,100);
    popMatrix();
  }
}
PFont f;
needle Needle;
void setup(){
  size(500,500);
  Needle = new needle(0);
  f = createFont("Arial",16,true); 
}
void draw(){
  background(0);
   Needle.draw();
  for(int i=0;i<12;i++){
    pushMatrix();
    int j=i+1;
    textAlign(CENTER);
    translate(width/2+cos(radians(30*j-90))*(width/2-60),height/2+sin(radians(30*j-90))*(height/2-60)+70);
    fill(0);
    textFont(f,80);
    
    text((i+1),0,-40);
    popMatrix();
  }  
    
 if(mousePressed != true){
  Needle.angle =30*hour()+0.5*minute()-90;
 }
}
void mouseDragged(){
  Needle.angle = mouseX;
}
