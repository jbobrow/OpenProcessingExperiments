
//April Lee
//D|MA 28 Interactivity
//26 January 2012

void setup()
{
  size(500, 500);
  smooth();
  noStroke();
  rectMode(CENTER);
}

void draw()
{
  float bg = map(mouseX, 0, width, 230, 0);
  background(bg);
  float fx = map(mouseX, 0, width, width*0.4, width*0.9);

  //face
  fill(255);
  rect(width/2, height/2, fx, fx);

  //whiskers
  noFill();
  stroke(200);
  strokeWeight(1);
  float br11 = map(mouseX, 0, width, 270, 305);
  float br12 = map(mouseX, 0, width, 260, 285);
  float br13 = map(mouseX, 0, width, 288, 377);
  float br14 = map(mouseX, 0, width, 276, 253);
  float br15 = map(mouseX, 0, width, 345, 404);
  float br16 = map(mouseX, 0, width, 281, 363);
  float br17 = map(mouseX, 0, width, 373, 498);
  float br18 = map(mouseX, 0, width, 248, 288);
  bezier(br11, br12, br13, br14, br15, br16, br17, br18);

  float br21 = map(mouseX, 0, width, 268, 297);
  float br22 = map(mouseX, 0, width, 262, 295);
  float br23 = map(mouseX, 0, width, 307, 425);
  float br24 = map(mouseX, 0, width, 292, 274);
  float br25 = map(mouseX, 0, width, 347, 372);
  float br26 = map(mouseX, 0, width, 286, 407);
  float br27 = map(mouseX, 0, width, 384, 506);
  float br28 = map(mouseX, 0, width, 264, 313);
  bezier(br21, br22, br23, br24, br25, br26, br27, br28);

  float br31 = map(mouseX, 0, width, 271, 314);
  float br32 = map(mouseX, 0, width, 267, 304);
  float br33 = map(mouseX, 0, width, 303, 388);
  float br34 = map(mouseX, 0, width, 295, 281);
  float br35 = map(mouseX, 0, width, 346, 361);
  float br36 = map(mouseX, 0, width, 302, 422);
  float br37 = map(mouseX, 0, width, 377, 492);
  float br38 = map(mouseX, 0, width, 286, 363);
  bezier(br31, br32, br33, br34, br35, br36, br37, br38);

  float bl11 = map(mouseX, 0, width, 227, 200);
  float bl12 = map(mouseX, 0, width, 260, 281);
  float bl13 = map(mouseX, 0, width, 161, 100);
  float bl14 = map(mouseX, 0, width, 278, 251);
  float bl15 = map(mouseX, 0, width, 140, 83);
  float bl16 = map(mouseX, 0, width, 253, 347);
  float bl17 = map(mouseX, 0, width, 131, 16);
  float bl18 = map(mouseX, 0, width, 244, 261);
  bezier(bl11, bl12, bl13, bl14, bl15, bl16, bl17, bl18);

  float bl21 = map(mouseX, 0, width, 234, 211);
  float bl22 = map(mouseX, 0, width, 261, 292);
  float bl23 = map(mouseX, 0, width, 186, 134);
  float bl24 = map(mouseX, 0, width, 281, 252);
  float bl25 = map(mouseX, 0, width, 152, 63);
  float bl26 = map(mouseX, 0, width, 274, 374);
  float bl27 = map(mouseX, 0, width, 120, 7);
  float bl28 = map(mouseX, 0, width, 255, 285);
  bezier(bl21, bl22, bl23, bl24, bl25, bl26, bl27, bl28);

  float bl31 = map(mouseX, 0, width, 232, 202);
  float bl32 = map(mouseX, 0, width, 265, 298);
  float bl33 = map(mouseX, 0, width, 186, 98);
  float bl34 = map(mouseX, 0, width, 289, 271);
  float bl35 = map(mouseX, 0, width, 161, 101);
  float bl36 = map(mouseX, 0, width, 292, 398);
  float bl37 = map(mouseX, 0, width, 127, 18);
  float bl38 = map(mouseX, 0, width, 277, 341);
  bezier(bl31, bl32, bl33, bl34, bl35, bl36, bl37, bl38);

  //belly
  noStroke();
  fill(240);
  float bellyY = map(mouseX, 0, width, 0.697*width, 0.95*width);
  float bellyHR = map(mouseX, 0, width, 0.1*width, 0.098*width);
  float bellyWR = map(mouseX, 0, width, 0.3*width, 0.898*width);
  arc(width/2, bellyY, bellyWR, bellyHR, radians(180), radians(360));

  //outer ears
  fill(255);
  float lEarX = (width - fx)/2;
  float rEarX = (width - lEarX);
  float EarY = (height - fx + 2)/2;
  float lEarStart = map(mouseX, 0, width, 270, 200);
  float rEarStop = map(mouseX, 0, width, 270, 330);
  arc(lEarX, EarY, fx/2, fx/2, radians(lEarStart), radians(360));
  arc(rEarX, EarY, fx/2, fx/2, radians(180), radians(rEarStop));

  //mouth
  float mouthY = map(mouseX, 0, 400, 0.596 * width, 0.982 * width);
  float mouthR = map(mouseX, 0, 400, width/9, fx*0.8);
  float mouthStart = map(mouseX, 0, 400, 255, 180);
  float mouthStop = map(mouseX, 0, 400, 285, 360);
  float mouthGB = map(mouseX, 0, 400, 150, 0);
  fill(255, mouthGB, mouthGB);
  arc(width/2, mouthY, mouthR, mouthR, radians(mouthStart), radians(mouthStop));

  //inner ear
  float lInEarX = map(mouseX, 0, width, 0.312*width, 0.074*width);
  float rInEarX = map(mouseX, 0, width, 0.69*width, 0.93*width);
  fill(255, 200, 200);
  arc(lInEarX, EarY - 3, fx/2.55, fx/2.55, radians(lEarStart), radians(360));
  arc(rInEarX, EarY - 3, fx/2.55, fx/2.55, radians(180), radians(rEarStop));

  //nose
  float noseY = map(mouseX, 0, width, 0.536*width, 0.61*width);
  float noseXR = map(mouseX, 0, width, width/9, 0.296*width);
  float noseYR = map(mouseX, 0, width, width/11, 0.296*width);
  float noseStart = map(mouseX, 0, width, 230, 220);
  float noseStop = map(mouseX, 0, width, 310, 320);
  arc(width/2, noseY, noseXR, noseYR, radians(noseStart), radians(noseStop));

  //eyes
  float lEyeX = map(mouseX, 0, width, 0.37 * width, 0.226 * width);
  float rEyeX = map(mouseX, 0, width, 0.633 * width, 0.78 * width);
  float eyeY = map(mouseX, 0, width, 9 * height/20, 0.308 * height);
  float eyeR = map(mouseX, 0, width, width/15, 0.43 * width);
  float lEyeStart = map(mouseX, 0, width, 0, 20);
  float lEyeStop = map(mouseX, 0, width, 340, 200);
  float rEyeStart = map(mouseX, 0, width, 0, -20);
  float rEyeStop = map(mouseX, 0, width, 340, 160);
  float strW = map(mouseX, 0, width, 5, 10);
  float lStrR = map(mouseX, 0, width, 0, 255);
  float lStrG = map(mouseX, 0, width, 191, 100);
  float lStrB = map(mouseX, 0, width, 255, 100);
  float rStrR = map(mouseX, 0, width, 127, 255);
  float rStrG = map(mouseX, 0, width, 255, 100);
  float rStrB = map(mouseX, 0, width, 212, 100);

  if (strW >= 0)
  {
    fill(0);
    strokeWeight(strW);
    stroke(lStrR, lStrG, lStrB, 150);
    strokeCap(SQUARE);
    arc(lEyeX, eyeY, eyeR, eyeR, radians(lEyeStart), radians(lEyeStop));
    stroke(rStrR, rStrG, rStrB, 150);
    arc(rEyeX, eyeY, eyeR, eyeR, radians(rEyeStart), radians(rEyeStop));
  }

  //eyesparkles
  float sparkleR = map(mouseX, 0, width, width/90, width/20);
  noStroke();
  fill(255);
  ellipse(lEyeX, eyeY, sparkleR, sparkleR);
  ellipse(rEyeX, eyeY, sparkleR, sparkleR);

  //nosewedge
  float noseWedgeY = map(mouseX, 0, width, 0.50*width, 0.49*width);
  float noseWedgeR = map(mouseX, 0, width, 0.02*width, 0.064*width);
  noStroke();
  fill(255);
  arc(width/2, noseWedgeY, noseWedgeR, noseWedgeR, radians(250), radians(290));

  //nostrils
  float lNostrilX = map(mouseX, 0, width, 0.488*width, 0.45*width);
  float rNostrilX = map(mouseX, 0, width, 0.5135*width, 0.55*width);
  float NostrilY = map(mouseX, 0, width, 0.513*width, 0.54*width);
  float NostrilR = map(mouseX, 0, width, width/130, fx*0.02777);
  float NostrilF = map(mouseX, 0, width, 100, 70);
  fill(NostrilF);
  ellipse(lNostrilX, NostrilY, NostrilR, NostrilR);
  ellipse(rNostrilX, NostrilY, NostrilR, NostrilR);

  //teeth
  float lToothX = map(mouseX, 0, width, 0.492*width, 0.382*width);
  float rToothX = map(mouseX, 0, width, 0.508*width, 0.61*width);
  float toothY = map(mouseX, 0, width, 0.553*width, 0.89*width);
  float toothR = map(mouseX, 0, width, width*0.026, fx/2);
  float lToothStart = map(mouseX, 0, width, 255, 245);
  float lToothStop = map(mouseX, 0, width, 285, 270);
  float rToothStart = map(mouseX, 0, width, 255, 270);
  float rToothStop = map(mouseX, 0, width, 285, 295);
  fill(255, 250, 205);
  arc(lToothX, toothY, toothR, toothR, radians(lToothStart), radians(lToothStop));
  arc(rToothX, toothY, toothR, toothR, radians(rToothStart), radians(rToothStop));
}


