
int comparesec = second(); 
int comparehour = hour();
int inmotion=0, iangl=0;
int inmotion0=0;

void draw(){ 
  int sec = second();
  int hr = hour();



  if (comparesec < sec){ 
    inmotion=1;
    inmotion0=3;
    secrot -= 6;
  } 

  if (comparesec > sec){ 
    inmotion=2;
    inmotion0=1;
    minrot -= 6;
  }

  if (comparehour < hr){ 
    inmotion=3;
    inmotion0=2;
    hourot -= 6;
  }

  background(255);
  stroke(0);

  translate(width, height);

  pushMatrix();
  translate(0,0,-501);
  noStroke();
  fill(255);
  rect(-480,-240,480,480);
  fill(255);
  rect(480,-240,480,480);
  fill(255);
  rect(-50,-50,width/2,height/2);
  popMatrix(); 



  pushMatrix();
  translate(450,-450,-502);
  stroke(0);
  strokeWeight(1);
  grid();
  popMatrix();

  pushMatrix();
  translate(-200,-200,1);
  rubiksdraw();
  pushMatrix();
  rotateX(radians(-45));
  rotateY(radians(-45));
  scale(30); 
  for (int i=0; i<54;i++){
    stroke(0);
    strokeWeight(1.5);
    square[i].display();
  }
  popMatrix(); 
  popMatrix(); 

  pushMatrix();
  translate(-220,180,-10);  
  //Whitney  
  startTime = -(cycleLength) / (float) height;
  float timer = (millis()*.001 - startTime)*speed;
  float timer2 = (millis()*.001 - startTime)*speed2;
  float timer3 = (millis()*.001 - startTime)*speed3;
  speed = 5;
  speed2 = 0.16;
  speed3 = 0.0138;
  rotateX(radians(-45));
  strokeWeight(2);
  pushMatrix();
  rotateY(radians(45));
  whitney(speed,timer);
  popMatrix();
  pushMatrix();
  rotateY(radians(-45));
  whitney(speed2,timer2);
  popMatrix();
  pushMatrix();
  rotateX(radians(90));
  rotateZ(radians(45));
  whitney(speed3,timer3);
  popMatrix();
  popMatrix();

  pushMatrix();
  translate(-60,-75,-501);
  clock();
  popMatrix();
  comparesec = sec;
  comparehour = hr;

  fill(50);
  textFont(font); 
  textMode(SCREEN);

  pushMatrix();
  translate(0,0,5);
  image(texts,-100,-220, 400,400);
  popMatrix(); 

  String s = "x = s y = h z = m";
  //text(s, 10, 10, 32, 100);
  //textAlign(CENTER);
  //  text("Rubik's Clock", 10, 25);
  //  text("Euclid's Clock", 410, 25);
  //  text("Dali's Clock (perhaps)", 410, 425);
  //  text("Whitney's Clock", 10, 425);
  stroke(0);
  strokeWeight(1);
  //  line(-400,0,400,0);
  //  line(0,-400,0,400);
} 























