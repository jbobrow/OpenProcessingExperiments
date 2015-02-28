
PFont font;

int hh = hour();

int diameter = 500;
int radius = 250;

String [] segundo= { //FEELINGS
  "I feel like you are not listening", 
  "I feel like you hate me", 
  "I feel like a stupid blob", 
  "I feel like you are ignoring me", 
  "I feel like I don't matter", 
  "I feel so lost", 
  "I feel so dead", 
  "I feel so invisible", 
  "I feel guilty", 
  "I feel like a burden", 
  "I feel like I ruin everything", 
  "I feel like I will never be un-scared", 
  "I feel like I should be guilty", 
  "I feel like I will be lost forever", 
  "I feel like I will float forever", 
  "I think you can read my mind", 
  "I think you are mad at me", 
  "I think you don't like me", 
  "I think you can see through me", 
  "I think you want me to go away", 
  "I think you will wish you never met me", 
  "You don't hear me", 
  "You don't understand me", 
  "You don't want me", 
  "You don't like me", 
  "You think I'm stupid", 
  "You must hate me", 
  "You must think I'm annoying", 
  "You must think I'm crazy", 
  "You must think I'm useless", 
  "You must think I'm a freak", 
  "You think I'm stupid", 
  "You think I'm weird", 
  "You think I'm ugly", 
  "If I tell you the truth, you'll hate me", 
  "If I lie to you, you'll hate me", 
  "If I say anything you'll leave", 
  "It feels like you're going to leave", 
  "It feels like everything will change", 
  "It feels like you will eventually hate me", 
  "It feels like you will regret me", 
  "It feels like you don't want me around", 
  "It feels like I'm a burden", 
  "Maybe you are just using me", 
  "Maybe you think I'm lying", 
  "Maybe you can never understand", 
  "Maybe you hate me", 
  "Maybe you wish that I would leave", 
  "Maybe you think I'm useless", 
  "Maybe you think I'm the worst friend ever", 
  "Maybe you don't like me", 
  "Sometimes it feels like I can't say anything at all", 
  "Sometimes it feels like you don't want to listen to me", 
  "Sometimes it feels like you don't care at all", 
  "Sometimes I think that you don't want me around", 
  "Sometimes I think that you think I'm crazy", 
  "Sometimes I think that if I say what I feel you'll run away", 
  "Sometimes it feels like everyone is judging me", 
  "Sometimes it feels like everyone is watching me", 
  "Sometimes it feels like it will never stop"
};

String [] minuto = {
  "no", "yes"
};

String [] hora= { //FACTS
  "I was born may 9 at 12:54 PM.", //12
  "My grandmother took care of me for the first year of my life.", //1
  "I am a stubborn, bull-headed Taurus.", //2
  "As a child, I moved 3 times.", //3
  "My first best friend's name was Elizabeth.", //4
  "My first crush lasted 5 years. His name was Jason.", //5
  "I have 1 brother who is 6 years older than me.", //6
  "My first pet was Betsy the Beta Fish.", //7
  "One time, my brother and I made my mom cry.", //8
  "My parents got separated in 2009.", //9
  "My real grandfather died when I was 10. I never met him.", //10
  "My first kiss was on a bus to Toronto.", //11
    "I was born may 9 at 12:54 PM.", //12
  "My grandmother took care of me for the first year of my life.", //1
  "I am a stubborn, bull-headed Taurus.", //2
  "As a child, I moved 3 times.", //3
  "My first best friend's name was Elizabeth.", //4
  "My first crush lasted 5 years. His name was Jason.", //5
  "I have 1 brother who is 6 years older than me.", //6
  "My first pet was Betsy the Beta Fish.", //7
  "One time, my brother and I made my mom cry.", //8
  "My parents got separated in 2009.", //9
  "My real grandfather died when I was 10. I never met him.", //10
  "My first kiss was on a bus to Toronto.", //11
};

void setup() {
  size(1200, 600);
  colorMode(HSB, 360, 100, 100);
  font = loadFont("OCRAStd-10.vlw");
  textFont(font);
}

void draw() {
  background(84, 0, 98);

  //STUPID MAPS
  float s = map(second(), 0, 60, 0, radians(360)) - radians(90);//MAP FOR CLOCK MOVEMENT
  float m = map(minute(), 0, 60, 0, radians(360)) - radians(90);//MAP FOR CLOCK MOVEMENT
  float h = map(hour() % 12, 0, 12, 0, radians(360)) - radians(90);
  float xcircle = map(mouseX, 0, width, 450, 700);//MAP FOR INSIDE CIRCLE
  float Negxcircle = map(width-mouseX, 0, width, 400, 750);//OPPOSITE MOUSE MOVEMENT
  float ycircle = map(mouseY, 0, height, 150, 450);////MAP FOR INSIDE CIRCLE
  float Negycircle = map(height-mouseY, 0, height, 100, 500);//OPPOSITE MOUSE MOVEMENT

  //CLOCK CIRCLES
  for (int bullseye = 500; bullseye > 0; bullseye = bullseye - 25) {
    fill(1, 9-bullseye/63, 98);
    noStroke();
    ellipse(width/2, height/2, bullseye, bullseye);
  }

  //THESE ARE DA PRETTY LITTLE CIRCLE THINGS THAT GO ON DA CLOCK NUMBAHS
  //noFill();
  //noStroke();
  fill(100, 0, 100);
  ellipse(cos(m) * radius + width/2, sin(m) * radius + height/2, 7, 7);//minutes
  ellipse(cos(h) * radius + width/2, sin(h) * radius + height/2, 7, 7);//hour
  ellipse(cos(s) * radius + width/2, sin(s) * radius + height/2, 7, 7);//seconds

  if (minute() %2 == 0) { //FOR "NO" THIS IS A BIG IF STATEMENT///////
    textAlign(CENTER);
    fill(113, 2, 77);
    text(minuto[0], Negxcircle, Negycircle);//MINUTES
    text(hora[hour()], width/2, height/2); //FACTS//HOUR

    if (mouseX < 350) {//FEELINGS//SECONDS
      textAlign(RIGHT);
      text(segundo[second()], mouseX, mouseY);
    }
    if (mouseX > 850) {
      textAlign(LEFT);
      text(segundo[second()], mouseX, mouseY);
    }
    if (mouseY < 50) {
      text(segundo[second()], mouseX, mouseY);
    }
    if (mouseY > 500) {
      text(segundo[second()], mouseX, mouseY);
    }
    else {
      fill(360, 100, 100, 0);
      textAlign(LEFT);
      text(segundo[second()], mouseX, mouseY);
    }
  }


  if (minute() %2 == 1) { //FOR "YES" THIS IS THE BIG IF STATEMENT////
    textAlign(CENTER);
    fill(113, 2, 77);
    text(minuto[1], Negxcircle, ycircle);//MINUTES
    text(hora[hour()], width/2, height/2); //FACTS//HOURS
    text(segundo[second()], xcircle, Negycircle);//FEELINGS//MINUTES
  }

  else { // EVERYTHING ELSE THIS IS A BIG ELSE STATEMENT//////
    fill(360, 100, 100, 0);
    textAlign(LEFT);
    text(segundo[second()], mouseX, mouseY);
  }
}



