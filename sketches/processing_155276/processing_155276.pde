
float theta = 0.1;
float x = 220;
float x2 = 60;

void setup(){
  size(500, 1000);
  smooth();
  background(255);
}

void draw(){
  fill(255);
  stroke(0);
  arc(250, 500, 250, 250, radians(220), radians(x));
  fill(255);
  arc(250, 500, 50, 50, radians(220), radians(x));
  if(220<= x && x <= 320){
    x++;
  }
  
  fill(0);
  arc(250, 500, 50, 50, radians(60), radians(x2));
  if(60<= x2 && x2 <= 120){
    x2+= 0.6;
  }
  
  if(x2 >= 120){
    line(152, 420, 250, 500);
    line(348, 420, 250, 500);
    ellipse(250+150*cos(theta), 450+150*sin(theta), 1, 1);
    fill(255, 0, 0);
    noStroke();
    ellipse(250, 425, 40, 40);
    theta+=0.1;
  }
  
  
  
}


