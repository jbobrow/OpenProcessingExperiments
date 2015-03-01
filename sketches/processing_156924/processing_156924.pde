
float xpos=300;
float ypos=300;

float aFade = 0;

boolean mouseMoving;

void setup() {
  size(600, 600);
  background (30, 30, 100);
}

void mouseMoved() {
  mouseMoving = true;
}

void draw() {

  fill (30, 30, 100, 15);
  rect(0, 0, width, height);

  //float circle = 


  noStroke ();
  fill(100);



  float seed = (mouseX);

  randomSeed(mouseX);



  for (int i=0; i<width; i+=int (random (10, 30))) {

    //for (int j=200; j<400; j=int (abs(cos(mouseX*0.2)*200))) {


    //float distance = dist(i, j, mouseX, mouseY);
    float cosMouseX = cos(mouseX*random(0.1, 0.5))*100;
    float sparklyY = cos(mouseX*random(0.1, 0.5))*500;
    float wavyY = cos(mouseX*0.2)*200;
    float squigglyY = cos(mouseY*0.1)*200;
    ;

    //float sparklyY = cos(mouseX*random(0.1, 0.5))*500;
    //float wavyY = cos(mouseX*0.2)*200;
    //random(0,height);
    //float w = map(,0,1,1,20);
    //float w = map(mouseX, 0, width, 1, cos(mouseX);
    //float h = map(cosMouseX, 0, height, 1, 20);

    //float w = cos(mouseX*.1)
    //float s = map(distance,0,300,1,50); 

    //float circleStartB = 

    //fill(j, j, 255);

    fill(100+random(0, 100), 100+random(0, 100), 255, 200);
    ellipse(0+i, height/2+sparklyY, 1+cosMouseX, 1+cosMouseX);
    //}

    aFade+=20;

   /* if (mouseMoved()) {
    } else {
      fill (30, 30, 100);
      rect(0, 0, width, height);
    }*/

    if (mouseMoving==false) {
     fill (30, 30, 100);
     rect(0, 0, width, height);
     } else {
     }
     
       if (keyPressed) {
    if (key == 's') {
      saveFrame("line-######.jpg");
    }
  }

    /*
  {
     if (keyPressed==true) {
     if (key=='w') {
     ypos-=10;
     } else if (key=='a') {
     xpos-=10;
     } else if (key=='d') {
     xpos+=10;
     } else if (key=='s') {
     ypos+=10;
     } else {
     xpos=300;
     ypos=300;
     }
     }
     }*/
  }
}




