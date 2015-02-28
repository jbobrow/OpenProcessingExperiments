
PShape bg_1, bg_2,bg_3, heart_p, heart_g, heartbeat;
PShape bg_4, bg_5;
PFont font, font_s;
int page = 1;
int startTime = 0;
int page1topage2 = 4000;
int gameTime = 20000;
float click_color, angle;
float heart_, heart_2;


//variables for game
float targetcircleX = random(60, 540);
float targetcircleY = random(155, 230);
float circleSize= random(20, 100);

int counterHeartbeat = 0;
int scoreHeartbeat = 0;


boolean Heart = false;

String pg1_text= "A flash of lightning surprised Mr. Robot. As a result, he passed out!";
String instruction = "You have 20 seconds to do CPR on Mr. Robot. click red circle as many times as you can in order to make over 35 Heartbeats. Click his heart to begin!";
int instructionX = 20;




void setup() {

  size(480, 640);
  smooth();
  bg_1 = loadShape("first_bg.svg");
  bg_2 = loadShape("2nd_bg.svg");
  bg_3 = loadShape("3rd_bg.svg");
  bg_4 = loadShape("4th_bg.svg");
  bg_5 = loadShape("5th_bg.svg");
  heart_p = loadShape("heart_pink.svg");
  heart_g = loadShape("heart_gray.svg");
  heartbeat = loadShape("heartbeat.svg");
  font = loadFont("EurostileRegular-17.vlw");
  font_s = loadFont ("AgencyFB-Bold-30.vlw");
  textFont(font);
  textAlign(CENTER);
  fill(255);
  startTime = millis();
}


void draw() {

  background(0);

  //page 1: A flash of lightning surprised Mr. Robot -> passed out
  if(page == 1) {
    shape(bg_1, 0, 0);
    textAlign(LEFT);
    textFont(font);
    text(pg1_text, 20, 560, 200, 600);
    if(millis() >startTime + page1topage2) {
      page = 2;
    }

  }


  //page 2: inside of Ambulance/ Game starts 
  else if(page == 2) {
    shape(bg_2, 0, 0);
    if((mouseX>410) && (mouseX<440) && (mouseY>370) && (mouseY<400))
    {
      shape(heart_p, 410, 370); 
    } 
    else {
      shape(heart_g, 410, 370);
    }
    textAlign(LEFT);
    textFont(font);
    fill(255);
    text(instruction, 17, 350, 200, 400);

    // text("Game starts (Click!)", width/2, height/2);
  }

  else if(page == 3) { 


    shape(bg_3, -26, 9);
   
    noStroke();
    angle += 0.1;
    click_color = map(cos(angle), -1, 1, 92, 255);
    heart_ = map(cos(angle), -1, 1, 20, 50);
    
    
    fill(click_color, heart_, heart_);
//    fill(#FC4242);
    

    if((counterHeartbeat > 0) && (counterHeartbeat < 5500)) {
      ellipse(targetcircleX, targetcircleY, circleSize, circleSize);
    }

    if (counterHeartbeat % 40 == 0) {
      targetcircleX = random(100, 395);
      targetcircleY = random(330, 600);
      circleSize= random(15, 100); 
    }

    if ((mouseX < (targetcircleX + circleSize/2)) &&
      (mouseX > (targetcircleX - circleSize/2)) &&
      (mouseY > (targetcircleY - circleSize/2)) &&
      (mouseY < (targetcircleY + circleSize/2))) {

      Heart = true; 
    }
    else { 
      Heart = false;
    }

    //score
    shape(heartbeat, 358, 547);
    textFont(font_s);
    textAlign(LEFT);
    fill(#6D6D6C);
    text(scoreHeartbeat, 410, 600);

    counterHeartbeat++; 
    


    if((millis() >startTime + gameTime)&&(scoreHeartbeat >= 35)) 
    {
      page = 4;
    } 
    else if ((millis() >startTime + gameTime)&&(scoreHeartbeat < 35))
    {
      page = 5;
    }


  }



  else if (page == 4) {
    shape(bg_4, 0, 0);
    angle += 0.08;
    click_color = map(cos(angle), -1, 1, 92, 255);
    fill(click_color);
    textFont(font);
    textAlign(LEFT);
    text("CLICK here to start again", 250, 190);
    startTime = millis();
    scoreHeartbeat = 0;
  }

  else if (page == 5) {
    shape(bg_5, 0, 0);
    angle += 0.08;
    click_color = map(cos(angle), -1, 1, 92, 255);
    fill(click_color);
    textFont(font);
    textAlign(LEFT);
    text("CLICK here to start again", 270, 190);
    startTime = millis();
    scoreHeartbeat = 0;
  }



}



void mousePressed() {

  if((page == 2)&& (mouseX>410) && (mouseX<440) && (mouseY>370) && (mouseY<400)) {
    page = 3;
    startTime = millis();
  }

  if(page == 3) {
    if (Heart == true) {
      scoreHeartbeat ++;

  
    }

  }

  if((page == 4)&& (mouseX> 250) && (mouseX<425) && (mouseY>175) && (mouseY<190)) {
    page = 1;
  }
  if((page == 5)&& (mouseX> 270) && (mouseX<445) && (mouseY>175) && (mouseY<190)) {
    page = 1;
  }
}







