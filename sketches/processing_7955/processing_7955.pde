
 float ang;
 void setup(){
  size(700,700);
  smooth();
  background(0);
}
void draw(){
   scale(1.4);
  rotate(ang);
  nero(250,250);
  }
  void nero(float x,float y){
    pushMatrix();
    translate(x,y);
    
     rotate(y+millis()/50.1);
    fill(random(0),0,0);
    ellipse(100,100,100,100);
    
    rotate(x+millis()/100.1);
    fill(random(250),0,0);
    triangle(0,200,0,0,200,0);
    
   
 
    
    popMatrix();
  }

