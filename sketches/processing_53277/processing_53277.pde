
//assignment #8
// Mi Jin Hwang copyright 2012
//press any key to change colors
//drag mouse to move the loops at the bottom 

void setup () {
background (0);
size (400, 400);

}

void draw () {
float w = 10;

    if (keyPressed == true)
  {
    strokeWeight (10);
    int e = 200;
    fill (random (200), random (200), random (200));
    ellipse (e, 100, width*0.1, height*0.1);
    ellipse (e*1.2, 100, width*0.1, height*0.1);
    ellipse (e*0.8, 100, width*0.1, height*0.1);
    ellipse (e*0.4, 100, width*0.1, height*0.1);
    ellipse (e*1.4, 100, width*0.1, height*0.1);
    ellipse (e*0.6, 100, width*0.1, height*0.1);
    ellipse (e*1.6, 100, width*0.1, height*0.1);
    stroke (40);
    e+= 5; }
    
    int i = 0;
  while (i < width) {
    float distance = abs(mouseX - i); 
    fill(distance);
    stroke (random (200), random (200), random (200));     
    rect(i,200,width,height);
    i += 20;
  }
}

