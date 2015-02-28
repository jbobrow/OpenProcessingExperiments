
ship shape[];








//change this for a different number of circles;
int numShips = 100;




void setup() {
  size(600,600);
  smooth();
  background(0);
colorMode(RGB);
  
  
  shape = new ship[numShips];
  
  
  
  for (int j = 0; j < numShips; j++) {
    shape[j] = new ship(j, j*3);




  }
 
}




void draw() {
   fill(0, 20);
  rect(0, 0, width, height);
  if(mousePressed) {
background(0);
}
  for (int i = 0; i < numShips; i++)  {
    shape[i].draw();
  }
}




class ship {
float dup;
 float d = 0;
 float xpos;
 float ypos;
  float radius;












  ship(float Speedvar, float tempradius) {
    dup = Speedvar;
    radius = tempradius;
  }




  void draw() {
    d += dup/1200;




xpos = width/2+sin(d) *radius;
ypos = height/2+cos(d)*radius;








    fill(ypos, radius, xpos);
    ellipse(xpos, ypos, 10, 10);
    fill(0);
    ellipse(300, 300, 20, 20);
}
}

