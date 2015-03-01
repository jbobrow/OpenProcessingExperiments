
float posX;
float posY;

float dX;
float dY;

float pX;
float pY;

float ppX;
float ppY;

float pppX; 
float pppY;

float ppppX;
float ppppY;

float pppppX;
float pppppY;

float cloudX;
float cloudY;

float personX = 496;
float personY =500;

boolean backgroundStatic;

void setup () { 
  size (600, 600); 


  posX=cloudX;
  posY=cloudY;
  dX = posX;
  dY = posY;
  pX = posX; 
  pY = posY;
  ppX = posX;
  ppY = posY; 
  pppX = posX;
  pppY = posY;
  ppppX = posX;
  ppppY = posY;
  pppppX = posX;
  pppppY = posY;
}
void draw () {
  myFunction (232, 255, 200, 250, 10, 80, 50, 30) ;
  littlePerson ();
}
 

void littlePerson () {
 
  personX = sin(frameCount*0.03)* 300; 
  
  fill(0);
  rect (personX, personY, 10, 30);
  fill(80);
  ellipse (personX+4, personY, 20, 20);
  fill(255);
  ellipse (personX+1, personY, 2, 2);
  fill(255);
  ellipse (personX+7, personY, 2, 2);
  

  }
 // littlePerson wants to run away! ): 
//  if (keyPressed && (key == CODED))    
//    {
//      if (keyCode == RIGHT){ 
////        for (
//

//  myFunction (232, 255, 200, 250, 10, 80, 80, 90) ;
//}

void myFunction(float redMin, float redMax, float greenMin, float greenMax, float blueMin, float blueMax, float cloudX, float cloudY) {
  

  fill(255, 15);
  rect (0, 0, width, height);

  noStroke();
  fill(0);
  
cloudX=sin(frameCount*0.01)*50+mouseX;
cloudY=mouseY;

  ellipse (cloudX, cloudY, 30, 20);
  ellipse (cloudX+10, cloudY, 30, 30);
  ellipse (cloudX+30, cloudY, 40, 40);
  ellipse (cloudX+30, cloudY+10, 40, 20);
  ellipse (cloudX+30, cloudY+10, 40, 20);
  ellipse (cloudX+30, cloudY-10, 40, 40);
  ellipse (cloudX+10, cloudY+10, 40, 20);
  ellipse (cloudX+30, cloudY-20, 40, 40);
  ellipse (cloudX+50, cloudY, 40, 40);
  ellipse (cloudX+30, cloudY+10, 40, 20);
   fill(255);
  ellipse (cloudX+10, cloudY, 3, 5);
  ellipse (cloudX+30, cloudY, 3, 5);

  if (backgroundStatic ==true) {
    noStroke();
    fill(15, 40, 80, 8);
    rect(0, 0, width, height);
    fill(15, 40, 80, 8);
    rect(0, 0, width, 580);
    fill(15, 40, 80, 8);
    rect(0, 0, width, 560);
    fill(15, 40, 80, 8);
    rect(0, 0, width, 540);
  }
  // else { 
  //   fill (255, 10);
  //   rect (0, 0, width, height);
  //   
  // }

  // }
  // if i want static background
  // 1 - check if static background On variable is true
  // 2 - if its true, make it some color// fill (my static background color) - that we declared below 
  // 3 - draw rectangle
  // 4 - if its not true
  // 5 - draw nothing

  dX = random (-8, 15);
  dY = random (-8, 25);

  posX = posX + dX;
  posY = posY + dY;

  //float colorA = dist(posX, posY, pX,pY);
  float mappedColorR = map(mouseX, 0, width, redMin, redMax);
  float mappedColorG = map(mouseX, 0, width, greenMin, greenMax);
  float mappedColorB = map(mouseX, 0, width, blueMin, blueMax);

  noStroke();  
  fill(mappedColorR, mappedColorG, mappedColorB);//random(255), random(255), random(255), random(255));
  beginShape ();
  vertex (posX, posY);
  vertex (pX, pY);
  vertex (ppX, ppY);
  vertex (pppX, pppY);
  vertex (ppppX, ppppY);
  vertex (pppppX, pppppY);
  endShape (CLOSE);


  if (posX < 0 ) {
    posX = width; 
    pX= width;
    ppX = width;
    pppX = width;
    ppppX = width;
    pppppX = width;
  } else if (posX > width) {
    posX = cloudX; 
    pX = cloudX;
    ppX = cloudX;
    pppX = cloudX;
    ppppX = cloudX;
    pppppX = cloudX;
    posY = cloudY;
    pY = cloudY;
    ppY = cloudY;
    pppY = cloudY;
    ppppY = cloudY;
    pppppY = cloudY;
  }

  if (posY < 0) {
    posY = height;
    pY = height;
    ppY = height;
    pppY = height;
    ppppY = height;
    pppppY = height;
  } else if (posY > height) {
    posY = cloudY;
    pY = cloudY;
    ppY = cloudY;
    pppY = cloudY;
    ppppY = cloudY;
    pppppY = cloudY;
    posX = cloudX; 
    pX = cloudX;
    ppX = cloudX;
    pppX = cloudX;
    ppppX = cloudX;
    pppppX = cloudX;
  }
  if ( posX < width && posX > 0 && posY < height && posY > 0) {
    backgroundStatic = true;
    fill(0);
    
  } 

  pppppX=ppppX;
  pppppY = ppppY;
  ppppX=pppX;
  ppppY = pppY;
  pppX = ppX;
  pppY = ppY;
  ppX = pX; 
  ppY = pY; 
  pX = posX;
  pY = posY;
}



