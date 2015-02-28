
 PFont font;
 PImage img;
 PImage pic;
 PImage grass;
 PImage yellow;
boolean happeningNow;
int startTime=0;
int timeleft=int(random(2078144000));


void setup() {
  int lastSecond;
  font = loadFont("Serif-16.vlw");
  textFont(font);
  img = loadImage("imgres.jpg"); 
  pic = loadImage("Empty-frame.png");
  grass = loadImage("images.jpg");
  yellow = loadImage("yellow.png");

  //int currentTime = second();
  //int countime = 60; 



  size(650, 725);
}

void draw() {
  frameRate(3);
     
  background(35, 35, 57);
  
  //tint(255, 178);
  image(img, 0, 0);
  image(grass,0,400);
  image(yellow, 40, 670);
  //image(yellow, 357, 347);
  image(yellow, 584, 499);
  //image(yellow, 120, 670);
  
  int secyear=31536000;
  int secvar=timeleft-secyear;
  int starttime=millis();


 
if(starttime==0){//this shit makes the initial text disappear
  happeningNow = false;
  starttime = millis();
}
if (starttime-millis()<3){
  
text("Press any key to reveal your fate.", 250, 415);
}

if((keyPressed && key == ' ')&& !happeningNow){
  
  happeningNow = true;
  starttime = millis();
}
if (happeningNow && millis()-starttime<10000){
  stroke(255);
  fill(204, 169, 169);
  rect(175,375, 300,50);
  //image(pic, 155, 370,330, 60);
  if(int(random(0,4))==0){
  fill(255);
  }
  else{
    noFill();
  }
  text("LOADING...", 275,400);
  frameRate(3);
  



  //if ((keyPressed && key == ' ')&& !happeningNow){//this shit makes the time appear
  
    happeningNow = true;
    startTime = millis();
    
  }
  if (happeningNow && millis()+starttime>10000) {
    
    image(pic,130, 195, 410, 275);

    


    

frameRate(3);

    

    noStroke();
    fill(204, 169, 169);
    strokeWeight(7);
    rect(168, 230, 340, 205);//little rect


    frameRate(1);
    fill(255);  
    text("If you're lucky", 300, 250);
    text("(or, depending on how you look at things, unlucky),", 175, 275);
    text("you have:", 315, 300);
    text(timeleft-second(), 250, 325);
    text("seconds", 360, 325);
    text("of life left.", 310, 350);
    text("And you're wasting all of them", 250, 375);
    text("by staring at this screen.", 270, 400);
    //text("Kinda sad, dontcha think?", 265, 425);
     
    
  }


  
    
}










