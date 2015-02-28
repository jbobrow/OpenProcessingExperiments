
// What do Robots Dream About? -By Sabrina Woods


// robot move - scaler1 code inserted
//////////////////////////////////////////////////////////////
float bodyX = 90.0;
float bodyY = 151.0;
float bodyWidth = 86.0;
float bodyHeight = 176.0;
float targetX, targetY;
float easing = 0.5;
float scaler = 2;
//////////////////////////////////////////////////////////////
PImage worldview2;
PImage visor1;
PImage visor2;
PImage lazer;
PImage nogun;
boolean vector = false;
// robot move ///////////////////////////////////////////////

// Start of Story Line
int page = 1; // page 1

PFont abd28; // font 
PImage head; 
PImage space1;
PImage sun1;
PImage vegas;
PImage pillow;
PImage surf;
PImage tornado;
PImage cake;
PImage roof;
PImage bag;
PImage water;
PImage pride;
PImage bomb;
PImage nasa;
PImage pop;
PImage money;

//> SETUP <//

void setup () {
  size (640,480) ;
  background (150);

  // robot_scaler
  smooth();
  frameRate(10);
  noCursor ();

  visor1 = loadImage("visor1.png");
  visor2 = loadImage("visor2.png");
  lazer = loadImage("lazer.png");
  nogun = loadImage("nogun.png");

  // robot_scaler inserted

  //////////////////////////////////////////////// load images 

  head = loadImage ("head.png"); // picture of the head for the intro and main screens
  space1= loadImage ("space1.png");
  sun1 = loadImage ("sun2.png"); 
  vegas = loadImage ("vegas1.png");
  pillow = loadImage ("pillowpage1.png"); // page 1
  surf = loadImage ("surf.png");
  tornado = loadImage ("tornado.png");
  cake = loadImage ("cake.png");
  roof = loadImage ("roof.png");
  bag = loadImage ("bag.png");
  water = loadImage ("water.png");
  pride = loadImage ("pride.png");
  bomb = loadImage ("bomb.png");
  nasa = loadImage ("nasa.png");
  pop = loadImage ("pop.png");
  money = loadImage ("money.png");

  //////////////////////////////////////////////// load font
  abd28 = loadFont ("abd28.vlw"); // load font
  textFont(abd28);
  textAlign (CENTER);
  fill (250); 

}
//info for the rotating ear/headphone piece & the jett propellers
float angle;
float jitter;
// > DRAW < // 

void draw () {
  background (100); // grey
  fill (212, 140, 234);
  if (page == 1) {
    image (pillow,-40, 0, 840,680);
    textSize(40);
    text ("What do Robots Dream About?", width/2, height/2 + 10);

    textSize(20);
    text ("click here to roll over left",120, 450); // left == sun trip, page 2
    text ("      click here to roll over right", 500, 450); // right == vegas trip, page 3
  }
  else if (page == 2) {
    image (space1, 0, 0); // you choose to roll over left
    textSize(22);
    text ("As you are sleeping you rolled over facing the sun.", width/2, height/5);
    text ("In your dream you go visit your family on the sun", width/2, height/4);
    text ("You havent seen your family in months, you have so much to tell them.", width/2, height/3);
    text ("So you tell them about about?", width/2, height/2 );
    text ("Saving your Best Friends life",140, 450); // left side tornado
    text ("      Surfing this summer", 500, 450);          // right side surfing

  }
  else if (page == 3) {

    // Go to vegas screen

    image (vegas, 0, 0); 
    textSize(32);
    text ("You head to VEGAS", width/2, height/4);
    text ("What do you dream about?", width/2, height/3);
    textSize(20);
    text ("the Bad Times",140, 250);        // left side -- night mare (end story) on page 11  
    text ("the Good Times", 480, 250);      // right side -- nasa vs world vision page 12

  }
  else if (page == 4) {
    // Tornado (end story)
    fill(255);
    image(tornado, 0 , 0, 640,480); // load pic
    textSize(20);
    text ("You tell your family about you saving your friend from a tornado:", width/2, height/5);
    text ("BUT, for some reason they seem unimpressed... Then they tell you", width/2, height/4);
    text ("that your brother saved the whole family from a comet last week.", width/2, height/3);
    text ("Suddenly your story sucks in comparison", width/2, height/2.5 );
    text ("you're bored now so you go back to earth", width/2, height/2 );

    textSize(30);
    text ("(click to continue)", width/2, 340 );

  }
  else if (page == 5) {
    // Surfing story
    fill(255);
    image(surf, 0 , 0); // load pic
    textSize(30);
    text ("You tell your family about your awesome surfing trip", width/2, height/5);
    text ("they are super interested!", width/2, height/4);
    text ("You choose to:", width/2, height/3);
    text ("a. Stay longer",120, 450);            // left stay longer
    text ("b. Go back home", 500, 450);          // right side Go home 

  }
  else if (page == 19) {
    // You go back home (end story)
    fill(0);
    image (pillow,-40, 0, 840,680);
    textSize(40);
    text ("You go back home ", width/2, height/5);
    text ("and roll over to the right side...", width/2, height/3.5);

    textSize(20);
    text ("      click here to choose again", 290, 450); // right == vegas trip, page 3
    text ("or END Now", 300, 270); 
  }
  else if (page == 6) {
    // You wake up and hit your head on the roof (end story)

    image (roof,-40, 0, 840,680);
    fill(0);
    textSize(30);
    text ("You wake up", width/2, height/5);
    text ("and hit your head on the roof...  ", width/2, height/3.5);

    textSize(20);
    text ("click here to roll over again", 300, 250);  
    text ("or END Now", 300, 270); 

  }
  else if (page == 7) {
    // You stay longer
    fill(212, 170, 24);

    image (cake,-40, 0, 840,680);
    textSize(30);
    text ("You eat and stay longer", width/2, height/5);
    text (" but sudenly you see hundreds of", width/2, height/4);
    text ("electric bunnies coming out of your moms cake", width/2, height/3); 

    textSize(15);
    text ("a. This is wayyy too crazy,I must be",140, 430);                  // left side
    text ("dreaming, you wake up and...",140, 450);                  // left side
    text ("b. you try to lasso all the bunnies", 480, 430);    // right side
    text ("using your awesome rodeo skills.", 480, 450);    // right side


  }
  else if (page == 8) {
    // (end story)

    fill(255);
    image(bag, -40, 0, 840, 680); // load pic
    textSize(25);
    text ("After you lasso the bunnies you put them in a huge black bag, ", width/2, height/4);
    text ("then you drop them off on mars on your way back home", width/2, height/3);

    textSize(20);
    text ("click here to roll over again", 300, 250);   
    text ("or END Now", 300, 270);    

  }
  else if (page == 12) {
    // Good Times

    image (vegas, 0, 0); 
    text ("Good Times", width/2, height/6);
    text ("You dream about going to vegas and getting a noble prize", width/2, height/5);
    text ("for inventing a solar paneled sticker .", width/2, height/4);
    text ("after excepting your award you:", width/2, height/3);


    text ("a. Sell your product to NASA.",140, 250);                             // left side
    text ("b. Donate $$ to WorldVision.com", 480, 250);     // right side
  }  
  else if (page == 11) {
    // Bad times  (end story)
    image (vegas, 0, 0); 
    fill(255);
    textSize (25);
    text ("You have a horrible time time in Vegas", width/2, height/5);

    textSize (22);

    text ("you can't get on any of the rides at the carnival hotel. ", width/2, height/4);
    text ("you leave and go back home to", width/2, height/3);
    textSize(20);
    text ("click here to roll over again", 300, 250); 
    text ("or END Now", 300, 270);  

  }  
  else if (page == 13) {
    // Nasa Vs. World vision screen

    image(nasa, 0 , 0); // load pic
    textSize (45);
    text ("You sell your product to NASA . ", width/2, height/2);

    textSize (22);
    text ("You sell your product to NASA and the President is", width/2, height/5);
    text ("the first person to use it. He: ", width/2, height/4);

    textSize (16);
    text ("a. makes popcorn with the solar panels .",140, 450);                    // left side
    text ("b. drops it into a fountain and", 480, 450);    // right side
    text (" causes a huge explosion", 480, 460);    // right side
  }  
  else if (page == 14) {
    // World Vision (end story)

    fill(255);
    image(water, 0 , 0); // load pic
    image(water, 300 ,0); // load pic

    textSize (26);
    text ("You help people all across the world boil their drinking water", width/2, height/4);
    text ("with the solar panels to make it safe for them to drink.", width/2, height/3);
    textSize (20);
    text ("click here to roll over again", 300, 250);  
    text ("or END Now", 300, 270); 
  }  
  else if (page == 16) {
    // The President Drops your invention (end story)
    image(bomb, 0 , 0); // load pic
    image(bomb, 300 , 0); // load pic

    textSize (26);
    text ("The president drops your example and it explodes, ", width/2, height/5);
    text ("now you: go back home and try ", width/2, height/4);
    text ("and remake your panels water proof", width/2, height/3);

    textSize (20);
    text ("click here to roll over again", 300, 250); 
    text ("or END Now", 300, 270); 
  }  
  else if (page == 15) {
    // The President Makes popcorn
    image(pop, -40, 0, 840, 680); // load pic
    fill(343,94,0);
    textSize (25);
    text ("The president makes popcorn with your solar panels,", width/2, height/5);

    textSize (22);
    text ("the popcorn is done to perfection and your new product", width/2, height/4);
    text ("sells 30 million in 2 hours online", width/2, height/3);

    text ("what do you do with the fame:", width/2, height/2);

    textSize (19);
    text ("a. you're so excited",140, 450);             // left side
    text ("You ..",140, 460);             // left side

    text ("b. buy pink diamond for your new body.", 480, 450);    // right side

  }  
  else if (page == 17) {
    // Humble (end story)

    textSize (26);
    image(money, 0, 0, 840, 680); 
    text ("You give to more local charities,", width/2, height/5);
    textSize (20);
    text ("click here to roll over again", 300, 250); 
    text ("or END Now", 300, 270); 
  }  
  else if (page == 18) {
    // PRIDE (end story)
    fill(255);
    image(pride, 0, 0, 840, 680); // load pic
    textSize (26);
    text ("In your 15 minutes of fame", width/2, height/6);
    text ("You forget all about the charities", width/2, height/4);

    textSize (20);
    text ("instead you buy pink diamonds for your new motor cover.", width/2, height/3 );
    text ("but it all burns off when you start the motor", width/2, height/2 );

    textSize (25);
    text ("click here to roll over again", 300, 350); 
    text ("or END Now", 300, 370); 

  }


  // robot_scaler draw info :

  //jitter funtions for earpiece & 
  if(second()%2 == 0){
    jitter = (random(-0.1, 0.1));
  }
  angle = angle + jitter;
  ellipseMode(CENTER);
  // scale the entire body 
  pushMatrix ();            ///push

  scale (1/ scaler); 

  //ellipse body
  fill(255);
  strokeWeight(5);
  ellipse(bodyX,bodyY,bodyWidth,bodyHeight);


  //head ellipse shape
  ellipse (bodyX - 3, bodyY - 59, bodyWidth + 64, bodyHeight - 51);
  fill(255);
  strokeWeight(5);
  // left ear/headphone

  fill(255);
  stroke(0);
  strokeWeight(5);
  float rx = random(-2,2);
  ellipse(bodyX - 65 + rx, bodyY - 59, bodyWidth - 62, bodyHeight - 151);


  // eyes/visor blacks
  if(vector == true) {
    image(visor1, bodyX - 38, bodyY-69, bodyWidth +34, bodyHeight - 134);
  }
  else
  {
    image(visor2, bodyX - 38, bodyY-69, bodyWidth +34, bodyHeight - 134);
  }


  //arm
  fill(255);
  strokeWeight(5);
  stroke(0);
  //    ellipse(bodyX -31 , bodyY + 37, bodyWidth - 58, bodyHeight - 108);

  if(vector == true) {
    image(lazer ,bodyX -31 , bodyY + 7, bodyWidth - 18, bodyHeight - 138);
  }
  else
  {
    image(nogun ,bodyX -31 , bodyY + 7, bodyWidth - 58, bodyHeight - 108);
  }


  frameRate(40);
  //legs/propelled motion!
  fill(0);
  strokeWeight(2);
  float ry = random(-2,2);
  ellipse(bodyX -1 + ry ,bodyY +95 ,26,4);
  float rt = random(-2,2);
  ellipse(bodyX -1 + rt,bodyY +101 ,20,4);
  float rh = random(-2,2);
  ellipse(bodyX -1 +rh ,bodyY +107 ,14,4);

  popMatrix (); 

  bodyX = mouseX * scaler ; 
  bodyY = mouseY * scaler ;

  scaler = map(mouseY, 0, height,6.0, 0.5); 

  // Story Pages -- Start Draw //

} 

void mousePressed () {
  if (page == 1) {    // what do robots dream about?
    if (mouseX < width/2 && mouseY > height/2) {      // roll over left -- go to vegas
      page = 2; // changed to the sun pic ---- the vegas picture

    }
    else if (mouseX > width/2 && mouseY > height/2) { // roll over right -- go to sun trip
      page = 3; // changed to the vegas pic ---- the sun picture
    }


  }
  else if  (page == 2) {                          // now you're in space, what do you tell your parents
    if (mouseX < width/2 && mouseY > height/2) {
      page = 4; // tornado -- (end story)

    }
    else if (mouseX > width/2 && mouseY > height/2) {
      page = 5; // tell your family about surfing 

    }
  }

  else if  (page == 5) {                          // Surfing trip, stay longer or wake up
    if (mouseX < width/2 && mouseY > height/2) {
      page = 7; 
    }
    else if (mouseX > width/2 && mouseY > height/2) {
      page = 19;
    }
  }

  else if  (page == 7) {                          // you stay longer choose lasso or wake up
    if (mouseX < width/2 && mouseY > height/2) {
      page = 6; 
    }
    else if (mouseX > width/2 && mouseY > height/2) {
      page = 8;
    }
  }


  else if  (page == 3) {                          // vegas trip
    if (mouseX < width/2 && mouseY > height/2) {
      page = 11; 
    }
    else if (mouseX > width/2 && mouseY > height/2) {
      page = 12; 
    }
  }

  else if  (page == 12) {                          // Good Times
    if (mouseX < width/2 && mouseY > height/2) {
      page = 13; // sell your product to the president
    }
    else if (mouseX > width/2 && mouseY > height/2) {
      page = 14;  // you help the kids boil water (end story)
    }
  }

  else if  (page == 13) {                          // Sell your product to NASA
    if (mouseX < width/2 && mouseY > height/2) {
      page = 15; // drops (end story)
    }
    else if (mouseX > width/2 && mouseY > height/2) {
      page = 16; // what do you do with your fame?
    }
  }

  else if  (page == 15) {                          // what do you do with your fame?
    if (mouseX < width/2 && mouseY > height/2) {
      page = 17; // humility
    }
    else if (mouseX > width/2 && mouseY > height/2) {
      page = 18; // pride
    }
  }




  else if(page == 18 || page == 14 || page == 17 || page == 19 || page == 11 || page == 6 || page == 4|| page == 8 || page == 16 ) { // takes you back to the beginning page
    page = 1; // roll over on different side now






  }
}





