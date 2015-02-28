
PImage img;
PImage img2;
PImage img3;
PImage img4;

int state = -1;

void setup() {

  size(700, 450);

  // tint(155); -> Bild einfärben

  img = loadImage("heaven.gif");
  img2 = loadImage("jesus.png");
  img3 = loadImage("gericht.png");
  img4 = loadImage("hell.png");
  smooth();
  noCursor();
}

void draw() 

{ 

  if (mousePressed) {

    image(img3, 0, 0);
    float d1= random(1400);
    float d2= random(1000);
    float d3= random(500);
    float d4= random(300);

    stroke(0, 99); 
    fill(255, 255, d4);

    ellipse(mouseX, mouseY, d1, d2);
    triangle(mouseX, mouseY, d1, d2, d3, d1);
    line(mouseX, mouseY, d1, d2);
    line(d2, d3, mouseX, mouseY);
    line(d1, d2, mouseX, mouseY);
    line(d1, d1, mouseX, mouseY);

    image(img2, mouseX-70, mouseY-100);
    
  }
  else {
    if(state == -1){
      image(img4, 0, 0);
    }else{
      image(img, 0, 0);
    }
    
    image(img2, mouseX-70, mouseY-100);
  }
  
  println(state);
}

void mousePressed(){
  state = state * -1;
}


