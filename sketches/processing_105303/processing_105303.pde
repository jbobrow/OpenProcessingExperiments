
int w=50; // light ellipse width
int h=50; // light ellipse hieght

PImage lights; // switch
PFont variables; //count

int it=10; // image tint variable
int c; // brightness

boolean ls;

void setup () {
  lights=loadImage("lights.jpg");
  variables=loadFont("Baskerville.vlw");

  c=50;
  it=10;

  size(500, 500);

  boolean ls=false; //light switch

  imageMode(CENTER);
  tint(255, it);
  image(lights, width/2, height/2);
} 

void draw () {

  fill(255, 255, 255, 90);
  text(c, 455, 455); //brightness counter

  imageMode(CENTER);
  tint(255, it);
  image(lights, width/2, height/2);

  fill(250, 250, 210, 10);
  noStroke();
  ellipse(width/2, height/2, 50, 50);

  //light on

  if (ls==true) {

    //light switch 

    if (mouseX>200 && mouseX<300 && mouseY>200 && mouseY<300) {
      fill(250, 250, 210, 10);
      noStroke();
      ellipse(width/2, height/2, 50, 50);
    }

    //fill(10, 10, 10, 10);
    //stroke(10, 10, 10);
    //ellipse(width/2, height/2, w, h);

    if (c>=height && it<=100) {
      it++;
    }

    c++;
  }

  //light off

  else { 
    if (mouseX>200 && mouseX<300 && mouseY>200 && mouseY<300) {
      fill(250, 250, 210, 10);
      stroke(255, 255, 255);
      noStroke();
      ellipse(width/2, height/2, 50, 50);
    }

    fill(10, 10, 10, 10);
    ellipse(width/2, height/2, w+=5, h+=5);

    c--;
  }
}

//turning the light on and off

void mouseClicked() {

  if (mouseX>200 && mouseX<300 && mouseY>200 && mouseY<300) {
    ls=!ls;
    if (ls==true) {
      c=0;
    }
    else {
      c=0;
      it=10;
    }
  }
}



