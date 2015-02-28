






void setup ( ) {
  size (800, 800);
  background (#D8C3D8);
  smooth ( );

  colorMode(HSB);
}






void draw () {




  if (mouseX < 100) {
    fill(50, 128, map(mouseX, 0, 100, 255, 0)); // changes the color from yellow to green in the between '0' and '100'
    //fill(  map(mouseX,hh 0, 100, 255,0),  map(mouseX, 0, 100, 255,0), map(mouseX, 0, 100,255, 0));
  }
  if (mouseX>100 && mouseX < 300) {
    fill (95, 123, map(mouseX, 100, 300, 0, 255));// changes the color from black to pale saturated green between 100 and 300
  }
  if (mouseX> 300 && mouseX< 600) { 
    fill (96, 299, map (mouseX, 300, 600, 255, 0));// changes color from light green to darker green between 300 and 600
  }

  if (mouseX> 600 && mouseX <800) {
    fill (mouseX, random (0, 255), random (0, 255)); // randomizes the colour from 400 to 600
  }


  rect (350, 270, 100, 100);// shirt

  beginShape ();// start skirt
  vertex ( 350, 370);
  vertex (310, 470);
  vertex ( 490, 470);
  vertex (450, 370);
  endShape ();// end skirt

  arc (500, 600, 60, 40, PI, TWO_PI);// right shoe
  arc (300, 600, 60, 40, PI, TWO_PI);// left shoe

  strokeWeight (2);
  line (0, 600, 800, 600);// ground

  if (mouseX> 300 && mouseX <800) {// creates red hat  WHY WHY WHY WHY WHY
  fill (map(5, 0, 359, 0, 255), map (mouseX,300,800,0, 255 ), map(96, 0, 100, 0, 255));
    arc (400, 150, 70, 70, radians (180), radians (360));
    rect (350, 140, 100, 10);
  } 
  
  if (mouseX>600 && mouseX<800){// randomizes the color of the hat
    fill (mouseX, random (0, 255), random (0, 255));
    arc (400, 150, 70, 70, radians (180), radians (360));
    rect (350, 140, 100, 10);
  }
  
  if (mouseX<200){// deletes hat when prior to 400
    deletehat ();
  }

    if (mouseX>400 && mouseX<500){// dark purple circles
          fill (#69196A);
     makecircle (random (0,800), random(0, 500));
    }
    
    if (mouseX>500 && mouseX<600){//mid purple circles
          fill (#C645C9);
     makecircle (random (0,800), random(0, 500));
    }
     if (mouseX>600 && mouseX<700){//light purple circles
          fill (#F593F7);
     makecircle (random (0,800), random(0, 500));

    }
    
     if (mouseX>700 && mouseX<750){//lightest purple circles
          fill (#FBBFFC);
     makecircle (random (0,800), random(0, 500));
     }
    
      if (mouseX>750 && mouseX<800){//lightest purple circles
          fill (#E5DAE5);
     makecircle (random (0,800), random(0, 500));
     }
     
   if (mouseX > 400 && mouseX < 800){// blurs screen
     filter(BLUR);
    }
    
    
    if (mouseX> 700 && mouseX <800){// inverts background
      filter (INVERT);
     }
     
     
 
    
  // // if (mouseX>500) {
  //  //  fill (0, 234, 174);
  //  //  arc (400, 150, 70, 70, radians (180), radians (360));
  //  //  rect (350, 140, 100, 10);
  // filter(INVERT);
  ////  }
  //
  //  if (mouseX>400) {
  //    fill (#69196A);
  //    makesquare (random (0, width), random (0, height));
  //  }
  //
  //  if (mouseX>400) {
  //    filter( BLUR); 
  //    filter (ERODE);
  //  }
  //

 stroke (0,0,0);
  fill (#E5E0AB);
  ellipse (400, 200, 100, 100);
  rect (375, 250, 50, 20);
  line ( 350, 300, 270, 400);
  line (450, 300, 530, 400);
  arc (270, 400, 30, 60, 0, PI);
  arc (530, 400, 30, 60, 0, PI);

  line (450, 470, 500, 600);
  line (350, 470, 300, 600);

  // arc (500, 600, 60, 40, PI, TWO_PI);
  // arc (300, 600, 60, 40, PI, TWO_PI);
  
  if (mouseX>0 && mouseX<700){
  
   fill (#82CE81);
    ellipse (380, 190, 15, 15);
    ellipse (420, 190, 15, 15);
    arc (400, 200, 60, 60, radians (0), radians (180));
  }
  
   if (mouseX> 700 && mouseX<800){// face

    fill (#C645C9);
    ellipse (380, 190, 15, 15);
    ellipse (420, 190, 15, 15);
    arc (400, 230, 60, 60, radians (180), radians (360));
  }
}


 void deletehat (){// deletes hat
   
   fill(#D8C3D8);
   stroke (#D8C3D8 );
       arc (400, 150, 70, 70, radians (180), radians (360));
    rect (350, 140, 100, 10);
 }
   
void keyPressed () {// erases background
  if (key==' ') {
    background (#787953);
  }
  else if (key=='e') {//erodes
    filter (ERODE);
  }
  else if (key=='d') {//dilates
    filter( DILATE);
  }
  else if (key =='i') {//inverts
    filter(INVERT);
  }
  if (key== '1') {//makes circles
    fill (#C26FF0);
    makecircle (random(0, width), random (0, height));
  }
  if (key=='2') {//changes stroke
    strokeWeight (10);
    stroke (#B27DD8);
  }
  if (key=='3') {//changes stroke
    strokeWeight (5);
    stroke (#AA46AA);
  }

  if (key=='4') {//makes squares
    fill (#69196A);
    makesquare (random (0, width), random (0, height));
  }
  if (key=='5') {// fills shirt
    fill (175, 37, 175);
    rect (350, 270, 100, 100);
  }
  if (key=='6') {// fills shoes
    fill (234, 215, 0);

    arc (500, 600, 60, 40, PI, TWO_PI);
    arc (300, 600, 60, 40, PI, TWO_PI);
  }

  if (key=='7') {//fills skirt
    fill (0, 234, 174);
    beginShape ();
    vertex ( 350, 370);
    vertex (310, 470);
    vertex ( 490, 470);
    vertex (450, 370);
    endShape ();
  }

  if (key=='h') {//makes hat red
    fill (0, 234, 174);
    arc (400, 150, 70, 70, radians (180), radians (360));
    rect (350, 140, 100, 10);
  }

  if (key=='b') {//blurs
    filter( BLUR);
  }

  if (key=='t') {//threshold
    filter (THRESHOLD);
  }

  if (key=='8') {// makes face8
    fill (#82CE81);
    ellipse (380, 190, 15, 15);
    ellipse (420, 190, 15, 15);
    arc (400, 200, 60, 60, radians (0), radians (180));
  }
}
void makecircle (float x, float y) {// makes circles
  for (int k=0; k<=25; k=k+5) {
    ellipse (x, y, 10, 20);
  }
}
void makesquare (float x, float y) {// makes squares 
  for (int c=0; c<=25; c=c+5) {
    rect (x, y, c, c);
  }
}


