
int counter;
scrW = 800;
scrH = 400;

void setup() {  //setup function called initially, only once
  size(scrW, scrH);
  background(255);  //set background white
  colorMode(RGB);
  counter = 0;
  x = 0; y = 1; z = 5;
  b = 8/3; s = 10; r = 28;
  k = 0.001;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),random(255),random(255),100);
  stroke(random(255),random(255),random(255),100);
  rect(0,0,20,10);
  //for(i=0;i<1;i++){
      dx = s*(y-x);
      dy = x*(r-z)-y;
      dz = x*y-b*z;
      xp = x; yp = y;
      x = k*dx + x;
      y = k*dy + y;
      //ellipse(10*x+scrW/2, 10*y+scrH/2, 2, 2);
      line(1*xp+scrW/2, 1*yp+scrH/2, 1*x+scrW/2, 1*y+scrH/2);
  //}
  if(mousePressed == true) { //add some interaction
    if(mouseX < 20 && mouseY < 10){
        fill(255,20);
        noStroke();
        x = random(20)-10;
        y = random(20)-10;
        z = random(20)-10;
        rect(0, 0, scrW, scrH);
    }
  }
}
