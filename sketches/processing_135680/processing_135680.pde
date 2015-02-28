
//Exercise for Creating Geometric and Generative Art with Code with
//Kunstwurfelspiel Academy

//square original composition 
//trying to combine random choices to create artistic composition

// set canvas size
size(600, 600);

// set square x and y coordinates to be random between 20 and 200
rectx = random(20, 200);
recty = random(20, 200);

//set the sides to be random between 250 and 400
rectside = random(250, 400);

// set colour mode to be HSB and give range of 360
colorMode(HSB, 360);

//set the hue to be random up to 160
myhue = random(160);

//set the background to be myhue, with 100% brightness and saturation
background(myhue, 360,360);

// change the hue to be random amount between 10 and 30
myhue = myhue + (random(10,30));

//set no stroke
noStroke();

//fill with new hue
fill(myhue,  360,360);

// put square in random set coordinates with random set sides
rect(rectx, recty, rectside, rectside);

// do the following 5 times
for(int i = 0; i < 6; i++) {
  // increase hue randomly between 10 and 20
  myhue = myhue + (random(10,20));
  
  // if hue more than 360, decrease it randomly by 10-20
  if (myhue >360) {
    myhue = myhue - (random(10,20));
  }
  
  // fill with myhue
  fill(myhue,  360,360);
  
  // inset square coordinates by 10 px
  rectx = rectx + 10;
  recty = recty + 10;
  
  // reduce sides randomly by 15-30 px
  rectside = rectside - (random(15,30));
  
  // draw square at random set coordinates with random set sides
  rect(rectx, recty, rectside, rectside);
}



