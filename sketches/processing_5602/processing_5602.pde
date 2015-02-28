
int page = 1; //stores current page
int startTime = 0;
int travelTime = 3000;
int effectTime = 4000;
float x;
float angle = 0.0;
float speed = 0.01;
color transparent = color (85, 248, 255, 255);
float m = 255;


//images
PImage wonkabar;
PImage goldenticket;
PImage chocolatebar;
PImage entrance;
PImage chocolateroom;
PImage out;
PImage transfer;
PImage inventingroom;
PImage textbox;
PImage pumpkin;
PImage candy;
PImage transferbg;
PImage bubblegum;
PImage longhair;
PImage win;


//robot
PShape bearbody;
PShape bearbody2;
PShape lArm;
PShape rArm;
PShape leftarm;
PShape rightarm;
PImage robotback;
PShape normalhead;
PShape eyes;
PShape wrinkle;


//texts
PFont font;
String letters = "";


void setup(){
  size(640, 480);
  startTime = millis();
  smooth();
  //load images
  wonkabar=loadImage("chocolatebar-2.jpg");
  goldenticket=loadImage("golden-ticket.gif");
  chocolatebar=loadImage("chocolatebar-1.png");
  entrance=loadImage("entrance.jpg");
  chocolateroom=loadImage("chocolate-room1.jpg");
  out=loadImage("kickedout.png");
  transfer=loadImage("boat.png");
  inventingroom=loadImage("inventingroom2.png");
  lArm=loadShape("larm.svg");
  rArm=loadShape("rarm.svg");
  leftarm=loadShape("leftarm.svg");
  rightarm=loadShape("rightarm.svg");  
  textbox=loadImage("textbox.png");
  pumpkin=loadImage("pumpkin.png");
  candy=loadImage("candies.png");
  robotback=loadImage("robotback.png");
  bearbody=loadShape("body.svg");
  bearbody2=loadShape("body-2.svg");
  transferbg=loadImage("transferbg.png");
  normalhead = loadShape("normalhead.svg");
  bubblegum=loadImage("bubblegum.png");
  longhair=loadImage("longhair.png");
  eyes=loadShape("eyesnose.svg");
  wrinkle=loadShape("wrinkle.svg");
  win=loadImage("win.jpg");



  font = loadFont("STHeiti-20.vlw");
  textFont(font);
  textAlign(CENTER);

}

void draw(){
  background(255);
  imageMode(CENTER);

  //Choose a chocolate bar
  if(page == 1){
    image(wonkabar, 165, height/2);
    image(wonkabar, 470, height/2);
/*    //swinging arms
    pushMatrix();
    translate(0, height/2);
    x += .60;
    rotate(PI*.75*abs(sin(x)));
    shape(lArm,-50,0); 
    popMatrix();
    pushMatrix();
    translate(width, height/2);
    x += .04;
    rotate(PI*-.60*abs(sin(x)));
    shape(rArm);
    popMatrix(); */
  }

  else if(page==2){ //regular Chocolate bar
    image(chocolatebar, width/2, height/2);
    fill(0);
    text("TRY AGAIN!", width/2, 420);
  }

  else if(page==3){ // Golden ticket
     image(textbox, width/2, height*.2);
         textSize(12);
    text("YOU are the chosen one to tour the Wonka Chocolate Factory!", width/2, 50);
        text("Pick up the ticket to accept!", width/2, 70);
    image(goldenticket, width/2, 320);
  }

  else if(page==4){ //entrance
    fill(0);
    image(entrance, width/2, 275);
    image(textbox, width/2, height*.2);
    text("You are about to face extreme danger.", width/2, 40);
    text("The Chocolate Factory is not responsible for any damages done both phsyically and emotionally.", width/2, 60);
    text("If you agree and insisted on entering, type 'agree' or if you decide to leave, type 'disagree'", width/2, 80);
    text(letters, width/2, 100);
    image(robotback, mouseX, 390);

  } 
  else if(page==5){ //chocolate room
    image(chocolateroom, width/2, height/2);
    //pumpkin
     if(mouseX> width/3*2) {
    image(pumpkin, 485, 350);
      fill(255);
      text("try the pumpkin candy!", mouseX+2, mouseY-200);
      noFill();
    } 
    else {
      tint(90);
      image(pumpkin, 485, 350);
      noTint();

    }
// fall
     if(mouseX>width/3 && mouseX< width/3*2) {
      fill(255);
      text("It is forbidden to try the chocolate fountain!", mouseX+2, mouseY-200);
     }
     
     //candy
   if(mouseX<width/3) {
    image(candy, 140, 282);
      fill(255);
      text("try the tree candy!", mouseX+2, mouseY-200);
      noFill();
    } 
    else {
      tint(90);
    image(candy, 140, 282);
      noTint();

    }

    
    
    image(robotback, mouseX, 363);
    
    startTime = millis();
  }

  else if(page==21){ //fall into the chocolate river
    text("you fell into the chocolate river", width/2, height*.35);
    if(millis() > startTime + travelTime){
      page = 6;
    }
  }


  else if(page==6){ //kicked out
    image(out, width/2, height/2);
    image(textbox, width/2, height*.2);
    fill(255);
    text("Sorry..You did not make it to the end.", width/2, 50);
    text("Thank you for visiting!", width/2, 70);
    
  }

  else if(page==7){ //pumpkin effect
    image(chocolateroom, width/2, height/2);
    image(textbox, width/2, height*.2);
    fill(0);
    text("Oh no! The candy is making your head transparent!!", width/2, 50);
    text("Let's hurry to the next room before you're tempted to eat another one!", width/2, 70);
    if(m>0){
      m = m-1; 
      transparent = color (85, 248, 255, m);
    }
    fill(transparent);
    strokeWeight(3);
    stroke(0);
    normalhead.disableStyle();
    shape(normalhead, width/2, height/4);
    shape(bearbody2, 327, height/4);

    if(millis() > startTime + effectTime){
      page = 9;
      startTime = millis();
    }

  }

  else if(page==8){ //candies effect
    image(chocolateroom, width/2, height/2);
    image(textbox, width/2, height*.2);
    text("The tree candies made you super hyper..", width/2, 50);
    text("Let's hurry to the next room before you're tempted to eat another one!", width/2, 70);
    image(pumpkin, 485, 350);
    image(candy, 140, 282);
    translate(120, 140);
    pushMatrix();
    //swinging arms
    pushMatrix();
    translate(115, 180);
    x += .10;
    rotate(PI*.75*abs(sin(x)));
    shape(leftarm,-50,0); 
    popMatrix();
    pushMatrix();
    translate(180, 206);
    x += .04;
    rotate(PI*-.60*abs(sin(x)));
    shape(rightarm);
    popMatrix();
    shape(bearbody);
    popMatrix();


    if(millis() > startTime + effectTime){
      page = 9;
      startTime = millis();
    }
  }


  else if(page == 9){ //transfering
    imageMode(CORNER);
    image(transferbg, 0, 0);
    angle = angle + speed;
    image(transfer, 0, (sin(angle + PI) * 5));
    if(millis() > startTime + travelTime){
      page = 10;
    }
  }
  else if(page == 10){ //inventing room
    imageMode(CORNER);
    image(inventingroom, 0, 0);

    if(mouseX>320){
      image(longhair, 270, 0);
      fill(255);
      text("try the wrinkle chocolate!", mouseX+2, mouseY+1);
      noFill();
    }
    else {
      tint(90);
      image(longhair, 270, 0);
      noTint();

    }


    if(mouseX < width/2 && mouseY<220) {
      image(bubblegum, 17, 0);
      fill(255);
      text("try the three course bubble gum!", mouseX+2, mouseY+1);
      noFill();
    } 
    else {
      tint(90);
      image(bubblegum, 17, 0);
      noTint();

    }

    startTime = millis();

  }

  else if(page == 11){ //3 course bubble gum effect
    image(inventingroom, width/2, height/2);
    fill(0);
    image(textbox, width/2, height*.2);
    text("oh no!! It went wrong at third course..You are beginning to look like a BLUEBERRY!", width/2, 50);
    text("You'll be back to normal very soon...hopefully.", width/2, 70);
    fill(89, 4, 201, 150);
    circlePhase(0.0);
    circlePhase(QUARTER_PI);
    circlePhase(HALF_PI);
    angle += speed;
    shape(eyes, 170, 100);

    if(millis() > startTime + effectTime){
      page = 6;
      startTime = millis();
    }

  }

 /* else if(page == 12){ //juicing room
    image(juicing, width/2, height/2);
    if(millis() > startTime + effectTime){
      page = 6;
    }
  }
  */

  else if(page == 13){ //wrinkle candy effect
    image(inventingroom, width/2, height/2);
    fill(255);
    text("fun?", width/2, 100);
    shape(wrinkle, width/2, 100);
    if(millis() > startTime + effectTime){
      page = 14;
    startTime = millis();
    }
  }

  else if(page == 14){ //transition
    imageMode(CORNER);
    image(transferbg, 0, 0);
    angle = angle + speed;
    image(transfer, 0, (sin(angle + PI) * 5));
    if(millis() > startTime + travelTime){
      page = 17;
    }
  }
    
      else if(page == 17){ // WIN!
          image(win, width/2, height/2);
    image(textbox, width/2, 400);
    text("CONGRATULATIONS!", width/2, 380);
    text("You have successfully gone through the tour!", width/2, 400);
      }

  println(page);
 save("screen.jpg");


}

void mousePressed(){
  //Choose a chocolate bar
  if(page == 1){
    if(mouseX > 10 && mouseX<width/2 && mouseY>150){
      page = 2;
    }
    else if(mouseX>width/2 && mouseY>150){
      page = 3;
    } 
  } 
  
    else if(page == 2){
    if(mouseY>410){
      page = 1;
    }
  } 
  
  
  // choose golden ticket
  else if(page == 3){
    if(mouseX >150 && mouseY>150){
      page = 4;
    }
  } 
  // clicking on chocolate room effect
  else if(page == 5){
    if(mouseX < width/3){
      page = 8;
    } 
    else if(mouseX>width/3 && mouseX< width/3*2){
      page = 21;
    } 
    else if(mouseX> width/3*2){
      page = 7;
    }
  }

  // inventing room choices   
  else if(page == 10){
    if(mouseX > width/2){
      page = 13;

    } 
    else {
      page = 11;
    }
  }

}


void keyPressed(){
  if((key == ENTER) || (key == RETURN)){
    letters = letters.toLowerCase();
    if(letters.equals("agree")){
      page = 5;
    } 
    else if(letters.equals("disagree")){
      page = 6;
    }
    letters = ""; // Clear the variable
  } 
  else if ((key > 31) && (key != CODED)) {
    // If the key is alphanumeric, add it to the String
    letters = letters + key;
  }
 
}

void circlePhase(float phase){
  noStroke();
  float diameter = 300 + (sin(angle+phase)*30);
  ellipse(width/2, height/2, diameter, diameter-3);
}





