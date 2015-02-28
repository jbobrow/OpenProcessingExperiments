
   
float a=1;
void setup() {
  size(640, 360);
  noStroke();
  smooth();
  background(160,203,255);
  fill(70,6,6,200);
  translate(width/2,height);
  pushMatrix();
  tree(4);
}

void tree(float s) {
  s *= 0.99;
  if (s > 1.3) {
    if (s>1.5){
      fill(70,6,6);
      if (random(100)<92){
        rotate(radians(a));
        translate(0,-s-.5);
        rect(0,0,s,s);
        tree(s);
      }else {      
        pushMatrix();    
        rotate(radians(a));
        translate(0,-s-.5);
        rect(0,0,s,s);
        tree(s);     
        popMatrix();  
        pushMatrix();
        a=-1*a;
        rotate(radians(a));
        translate(0,-s-.5);
        rect(0,0,s,s);
        tree(s);      
        popMatrix(); 
      }
    }else{
      fill(100,240,100,130);
      ellipse(0,0,5,10);
    }
  }
}
void mouseClicked(){
  background(160,203,255);
  fill(70,6,6,200);
  translate(width/2,height);
  pushMatrix();
  tree(4);
}
  




