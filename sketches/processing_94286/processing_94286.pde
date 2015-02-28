
float beardCrazyX =  0.0;
float beardCrazyY =  0.0;
float noseFlare = 0.0;

float random1 = random(60);


void setup() {
  size(1000, 1000);
  background(0, 255, 255);
  noStroke();
  smooth();

  mouseX = width/2 - 300;
  mouseY = height/2 - 300;
}

void draw() {



  // this is the hair... there's a lot of hair.
  fill(0, 0, 0, random(200));
  ellipse(200+random1, 500 + random1, 200, 200);
  ellipse(150+random1, 400+random1, 200, 200);
  ellipse(300+random1, 400+random1, 200, 200);
  ellipse(200+random1, 300+random1, 200, 200);
  ellipse(300+random1, 250+random1, 200, 200);
  ellipse(400+random1, 250+random1, 200, 200);
  ellipse(500+random1, 200+random1, 200, 200);

  ellipse(width-200+random1, 500+random1, 200, 200);
  ellipse(width-150+random1, 400+random1, 200, 200);
  ellipse(width-300+random1, 400+random1, 200, 200);
  ellipse(width-200+random1, 300+random1, 200, 200);
  ellipse(width-300+random1, 250+random1, 200, 200);
  ellipse(width-400+random1, 250+random1, 200, 200);


  // He's affraid of peing clicked, it's a phase I'm going through, I need it.
  if ( mouseX <= width/2) {
    beardCrazyX =  map(constrain(mouseX, 100, width/2), 200, width/2, 0, 50);
    beardCrazyY =  beardCrazyX;
    noseFlare = map(constrain(mouseX, 100, width/2), 200, width/2, 0, 7);
  } 
  else {
    beardCrazyX =  map(constrain(mouseX, width/2, width - 100), width/2, width - 200, 50, 0);
    beardCrazyY =  beardCrazyX;
    noseFlare = map(constrain(mouseX, width/2, width - 100), width/2, width - 200, 7, 0);
  }


  //the "invisible" face ellipse
  fill(#FAF0EB);
  stroke(0);
  strokeWeight(40);
  rect(250, height/2, 500, 500);
  ellipse(width/2, height/2, 500, 500);
  noStroke();
  ellipse(width/2, height/2, 500, 500);
  rect(250, height/2, 500, 500);

  //the eyes, with shadows
  noStroke();
  fill(#EAE0DA);
  ellipse(350, height/2+10, 50 + noseFlare, 50 + noseFlare);
  ellipse(650, height/2+10, 50 + noseFlare, 50 + noseFlare);
  fill(255);
  stroke(0);
  strokeWeight(5);
  ellipse(350, height/2, 50 + noseFlare, 50 + noseFlare);
  ellipse(650, height/2, 50 + noseFlare, 50 + noseFlare);


  // pupils that follow you around?
  frameRate(10);
  float pupilX =  map(constrain(mouseX, 150, 900), 0, 1000, -20, 20) ;
  float pupilY =  map(constrain(mouseY, 150, 900), 0, 1000, -20, 20) ;

  fill(0);
  noStroke();
  ellipse(350 + pupilX, height/2 + pupilY, 10, 10);
  ellipse(650 + pupilX, height/2 + pupilY, 10, 10);


  // The little nose
  fill(#EAE0DA);
  ellipse(425, 650, 25 + noseFlare, 25 + noseFlare);
  ellipse(475, 650, 25 + noseFlare, 25 + noseFlare);

  // the mouth
  fill(0, 0, 0, 200);
  ellipse(300+random(10+beardCrazyX), 750+random(beardCrazyY), 75, 75);
  ellipse(325+random(10+beardCrazyX), 750+random(beardCrazyY), 75, 75);
  ellipse(350+random(10+beardCrazyX), 750+random(beardCrazyY), 75, 75);
  ellipse(375+random(10+beardCrazyX), 750+random(beardCrazyY), 75, 75);
  ellipse(400+random(10+beardCrazyX), 750+random(beardCrazyY), 75, 75);
  ellipse(425+random(10+beardCrazyX), 750+random(beardCrazyY), 75, 75);
  ellipse(450+random(10+beardCrazyX), 750+random(beardCrazyY), 75, 75);
  ellipse(475+random(10+beardCrazyX), 750+random(beardCrazyY), 75, 75);
  ellipse(500+random(10+beardCrazyX), 750+random(beardCrazyY), 75, 75);
  ellipse(525+random(10+beardCrazyX), 750+random(beardCrazyY), 75, 75);
  ellipse(550+random(10+beardCrazyX), 750+random(beardCrazyY), 75, 75);


  //println(mouseX+" "+mouseY);
}
