
int g = 50;
public void setup(){
  size(400,400);
  background(20,227,193);
  
}

public void draw(){
  for(int j = 0; j<6; j++){
  pushMatrix();
  for(int i = 0; i < 6; i++){
    figure();
    translate(75,0);
        rotate(PI);
     figure();
    rotate(PI); 
  }
  popMatrix();
  translate(0,100);
  
  }
  
}


public void figure(){
  stroke(251,255,212);
  line(g+20,g+20,120,120);
  stroke(251,255,212);
   fill(227,20,54);
  arc(g, g, g, g, PI, TWO_PI);
  stroke(227,20,54);
  fill(251,255,212);
  ellipse(g+20, g+20, 20,20);
  
}
  
