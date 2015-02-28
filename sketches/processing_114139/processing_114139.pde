
int diameter = 500;
int radius = 250;

String [] segundo= {
  "Sometimes I think that if I say what I feel you'll run away", 
  "It always feels like someone is watching me", 
  "It always feels like someone is judging me", 
  "I think people can see through me", 
  "Sometimes it feels like I can't say anything at all", 
  "I feel like you are ignoring me", 
  "You are not listening to me", 
  "You don't hear me", 
  "You don't understand me", 
  "The world is moving too slow", 
  "I am just floating in space", 
  "I feel so lost", 
  "I feel like a stupid blob", 
  "13", 
  "14", 
  "15", 
  "16", 
  "17", 
  "18", 
  "19", 
  "20", 
  "21", 
  "22", 
  "23", 
  "24", 
  "25", 
  "26", 
  "27", 
  "28", 
  "29", 
  "30", 
  "31", 
  "32", 
  "33", 
  "34", 
  "35", 
  "36", 
  "37", 
  "38", 
  "39", 
  "40", 
  "41", 
  "42", 
  "43", 
  "44", 
  "45", 
  "46", 
  "47", 
  "48", 
  "49", 
  "50", 
  "51", 
  "52", 
  "53", 
  "54", 
  "55", 
  "56", 
  "57", 
  "58", 
  "59"
};

String [] minuto = {
  "no", "yes"
};

String [] hora= {
  "I was born may 9 at 12:54 PM", //12
  "My grandmother took care of me for the first year of my life.", //1
  "I am a stubborn, bull-headed Taurus.", //2
  "As a kid, I moved 3 times.", //3
  "My parents got separated when I was 13.", //4
  "My first best friend's name was Elizabeth", //5
  "I have 1 one brother who is 6 years older than me", //6
  "My first pet was Betsy the Beta Fish.", //7
  "When I was a child, my brother and I made my mom cry.", //8
  "My first crush lasted 5 years. His name was Jason.", //9
  "My real grandfather died when I was 10. I never met him.", //10
  "My first kiss was on a bus to Toronto.", //11
  "I was born may 9 at 12:54 PM", //13
  "My grandmother took care of me for the first year of my life.", //14
  "I am a stubborn, bull-headed Taurus.", //15
  "As a kid, I moved 3 times.", //16
  "My parents got separated when I was 13.", //17
  "My first best friend's name was Elizabeth", //18
  "I have 1 one brother who is 6 years older than me", //19
  "My first pet was Betsy the Beta Fish.", //20
  "When I was a child, my brother and I made my mom cry.", //21
  "My first crush lasted 5 years. His name was Jason.", //22
  "My real grandfather died when I was 10. I never met him.", //23
  "My first kiss was on a bus to Toronto.", //24
};

void setup() {
  size(1200, 600);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0, 0, 100);

  float s = map(second(), 0, 60, 0, radians(360)) - radians(90);
  float m = map(minute(), 0, 60, 0, radians(360)) - radians(90);
  float h = map(hour() % 12, 0, 12, 0, radians(360)) - radians(90);

  //noStroke();
  stroke(100, 0, 0);
  fill(300, 100, 100, 70);
  ellipse(width/2-radius, height/2, diameter, diameter);
  fill(178, 100, 100, 70);
  ellipse(width/2, height/2, diameter, diameter);
  fill(61, 100, 100, 70);
  ellipse(width/2+radius, height/2, diameter, diameter);

  //THESE ARE DA PRETTY LITTLE CIRCLE THINGS THAT GO ON DA CLOCK NUMBAHS
  stroke(1);
  noFill();
  ellipse(cos(m) * radius + width/2 + 250, sin(m) * radius + height/2, 10, 10);//minutes
  ellipse(cos(h) * radius + width/2, sin(h) * radius + height/2, 30, 30);//hour
  ellipse(cos(s) * radius + width/2 - 250, sin(s) * radius + height/2, 10, 10);//seconds


  fill(100, 0, 0);//THIS BEGINS THE CLOCK NUMBAHZZZZZ
  textAlign(CENTER);
  text("1", cos(-1) * 250 + width/2, sin(-1) * 250 + height/2);
  text("2", cos(PI/7) * 250 + width/2, -sin(PI/7) * 250 + height/2);
  text("3", width/2+radius, height/2);
  text("4", cos(PI/6) * 250 + width/2, sin(PI/6) * 250 + height/2);
  text("5", cos(PI/3) * 250 + width/2, sin(PI/3) * 250 + height/2);
  text("6", width/2, height/2+radius);
  text("7", -cos(PI/3) * 250 + width/2, sin(PI/3) * 250 + height/2);
  text("8", -cos(PI/6) * 250 + width/2, sin(PI/6) * 250 + height/2);
  text("9", width/2-radius, height/2);
  text("10", -cos(PI/7) * 250 + width/2, -sin(PI/7) * 250 + height/2);
  text("11", -cos(PI/3) * 250 + width/2, -sin(PI/3) * 250 + height/2);
  text("12", width/2, height/2-radius);



  if (minute() %2 == 0) {
    textAlign(CENTER);
    fill(255, 0, 0);
    text(minuto[0], width/2, height/2-50);
  }

  if (minute() %2 == 1) {
    textAlign(CENTER);
    fill(255, 0, 0);
    text(minuto[1], width/2, height/2-50);
  }

  text(segundo[second()], width/2, height/2+50);

  text(hora[hour()], width/2, height/2);

  //stroke(255);
  //strokeWeight(1);
  //line(width/2, height/2, cos(s) * 130 + width/2, sin(s) * 130 + height/2);
  //strokeWeight(2);
  //line(width/2, height/2, cos(m) * 135 + width/2, sin(m) * 135 + height/2);
  //strokeWeight(3);
  //line(width/2, height/2, cos(h) * 100 + width/2, sin(h) * 100 + height/2);
}
