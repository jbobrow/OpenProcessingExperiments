
class Osc  {   

  PVector angle;
  PVector velocity;
  PVector amplitude;

  Osc()  {   
    angle = new PVector(random(0.01),random(0.01));
    velocity = new PVector(random(0.01), 0.1);
    amplitude = new PVector(width/4,height/4);    
  }   

  void osc()  {
    angle.add(velocity);
  }   

  void display()  {   
  
    PVector wind = new PVector(random(0.1,0.1),0);
    float x = cos(angle.x)*amplitude.x;
    float y = sin(angle.y)*amplitude.y;

 pushMatrix();
  translate(width/2,height/2);
  for (int j=0;j<4;j++){
  rotate(PI/2*j);
  for (int k = 0; k<7; k++) {
  fill(random(250),random(40),random(200));
  stroke(150);
  rect(x-10,y+140,20,20);
  rect(x-30,y+160,60,20);
  rect(x-50,y+180,100,20);
  rect(x-30,y+200,60,20);
  rect(x-10,y+220,20,20);
  rect(x-30,y+300,20,20);
  rect(x-50,y,0,20);
  rect(x-70,y+340,20,20);
  rect(x-90,y+360,20,40);
//  fill(random(200));
    }}
  popMatrix();
  }
}   




