
color[] c = new color [16];

int [] xpos = new int [16];
int [] ypos = new int [16];

void setup(){
  size (500, 500);
  noStroke();
  smooth();
  background(255);
  

  
  c[0] = color(random(255), random(255), random(255));
  c[1] = color(random(255), random(255), random(255));
  c[2] = color(random(255), random(255), random(255));
  c[3] = color(random(255), random(255), random(255));
  c[4] = color(random(255), random(255), random(255));
  c[5] = color(100, 140, 200);
  c[6] = color(80, 100, 150);
  c[7] = color(140, 69, 90);
  c[8] = color(247, 151, 122);
  c[9] = color(249, 170, 129);
  c[10] = color(253, 198, 138);
  c[11] = color(255, 247, 154);
  c[12] = color(100, 170, 200);
  c[13] = color(150, 70, 100);
  c[14] = color(80, 200, 180);
  c[15] = color(240, 80, 150);
  
  ypos[0] = 100;
  ypos[1] = 200;
  ypos[2] = 300;
  
}

void draw(){
  
  c[0] = color(random(255), random(255), random(255));
  c[1] = color(random(255), random(255), random(255));
  c[2] = color(random(255), random(255), random(255));
  c[3] = color(random(255), random(255), random(255));
  c[4] = color(random(255), random(255), random(255));
  
  for (int x = 0; x < 16; x++){
    xpos[x] = x*20 + 50;
    
   for (int y = 0; y < 16; y++){
    ypos[y] = y*20 + 50; 
    
    fill(c[x]);
    ellipse(xpos[x],ypos[y], 20, 20);
    
  }
  
}
}


