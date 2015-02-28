

void setup() { 
  float x, y, larg, vx, vy;
  size(990, 990);
  smooth();
  background(050, 050, 050, 050);//cor do fundo
  x=width /2;
  y=height/2;
  larg=100;
  vx=2;
  vy=3;
}


void draw() {
fill(255);
  stroke(521, 215, 365, 254);
 ellipse (mouseX, mouseY, (mouseY-150)/4, (mouseX-150)/4);
  line(mouseX, mouseY, 125, mouseX);


  stroke(100, 226, 150, 226);//cor da linha 
  //rect(mouseX, mouseY, mouseY-200, mouseX-300);

 // triangle(250, mouseX, 145, mouseY, 152, mouseX);
  line (mouseX, mouseY, mouseY-185, mouseX-251);

  fill(652, 256, mouseX/1+15,100);


  if (mousePressed == true) {
    float Mspeed=abs(mouseX-pmouseX);
    //println(Mspeed);
    noStroke();
    float taille_ellipse=Mspeed;

    color ellipse_color = color(155+random(220, 110), random(255, 10), random(255, 10),100);
    fill(ellipse_color);
    ellipse(mouseX+random(-05, 10), mouseY+random(-05, 10), taille_ellipse, taille_ellipse);
    
    fill(ellipse_color);
    ellipse(mouseX+random(-05,10), mouseY+random(-05,10),taille_ellipse, taille_ellipse);
  }

  if (keyPressed == true) {
    background(255);
    //rect(mouseX, random(300), 150, mouseY, random(250), 200);
    fill(204, 809, 701, 205);
  }
  fill(0,5);
  rect (0,0,width,height);
}



