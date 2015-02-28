
float inc=0.0;
float t=5.0;
void setup(){

  size(500, 500);
  smooth();
}

void draw(){
  background(255);
  stroke(0);
  float a = sin(inc)/100;

  h(width/2, 80, a);
  h(width/2+100, 50, a*0.5);
  h(width/2-100, 40,  0.01+ a*20);
  inc+=0.05;
}

void h (int x, int nbr, float a){
  strokeWeight(nbr);
  pushMatrix();
  translate(x, height);
  for(int i= nbr; i>0; i--){
    stroke(0+ nbr/2);
    strokeWeight(200);
    line(0, 0, 0, -t);
    translate(0, -t);
    rotate(a);
    if(i==1){
      noStroke();
      fill(255);
      arc(0, 20, nbr/2, nbr, 0, PI);
      ellipse(-10, 0, nbr/5, nbr/5); 
      ellipse(10, 0, nbr/5, nbr/5); 
    }
  }
  popMatrix();
}


void mousePressed(){
 save("fantome2.jpg"); 
  
}




