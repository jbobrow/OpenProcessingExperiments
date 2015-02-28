
int relaxedHrs = 8;
int happyHrs = 21;
int stressedHrs = 12;
int sadHrs = 11;
int moodScale = 20;
float internetHrs = 15.52;
float facebookHrs = 2.3;
float twitterHrs = 1.62;
float freeHrs = 28.56;
float techScale = 14.7;
int centerMoodX = 250;
int centerMoodY = 400;
int centerTechX = 750;
int centerTechY = 400;
PFont font;
PFont font2;

void setup() {
  size(1000, 800);
  background(0);
  drawMood();
  drawTime();
  font = loadFont("ArialNarrow-32.vlw");
  font2 = loadFont("ArialNarrow-22.vlw");
}


void draw() {

  textFont(font, 32);
  fill(255);
  text("Mood", centerMoodX-35, 150);
  //  stroke(10);
  //  stroke(204, 102, 0);
  //  line(centerMoodX, 0, centerMoodX, height); 

  text("Time Spent", centerTechX - 60, 150);
//  stroke(10);
//  stroke(204, 102, 0);
//  line(centerTechX, 0, centerTechX, height); 

  text("VS", width/2, 150);



  if (dist(mouseX, mouseY, centerMoodX, centerMoodY) < happyHrs*moodScale/2 
    && dist(mouseX, mouseY, centerMoodX, centerMoodY) > stressedHrs*moodScale/2) {
    smooth();
    fill(136, 86, 167);
    ellipse(centerMoodX, centerMoodY, happyHrs*moodScale, happyHrs*moodScale);
    fill(255);
    textFont(font2, 22);
    text("Mood: Happy, 21 hrs", centerMoodX-70, centerMoodY);
  } 
  else if (dist(mouseX, mouseY, centerMoodX, centerMoodY) < stressedHrs*moodScale/2 
    && dist(mouseX, mouseY, centerMoodX, centerMoodY) > sadHrs*moodScale/2) {
    fill(140, 150, 198); 
    ellipse(centerMoodX, centerMoodY, stressedHrs*moodScale, stressedHrs*moodScale);
    fill(255);
    textFont(font2, 22);
    text("Mood: Stressed, 12 hrs", centerMoodX-85, centerMoodY);
  } 
  else if (dist(mouseX, mouseY, centerMoodX, centerMoodY) < sadHrs*moodScale/2 
    && dist(mouseX, mouseY, centerMoodX, centerMoodY) > relaxedHrs*moodScale/2) { 
    fill(179, 205, 227);
    ellipse(centerMoodX, centerMoodY, sadHrs*moodScale, sadHrs*moodScale);
    fill(255);
    textFont(font2, 22);
    text("Mood: Sad, 11 hrs", centerMoodX-75, centerMoodY);
  } 
  else if (dist(mouseX, mouseY, centerMoodX, centerMoodY) < relaxedHrs*moodScale/2) {

    fill(175, 175, 175);     
    ellipse(centerMoodX, centerMoodY, relaxedHrs*moodScale, relaxedHrs*moodScale);
    fill(255);
    textFont(font2, 22);
    text("Mood: Relaxed, 8 hrs", centerMoodX-85, centerMoodY);
  } 
  else {
    drawMood();
  }


  if (dist(mouseX, mouseY, centerTechX, centerTechY) < freeHrs*moodScale/2 
    && dist(mouseX, mouseY, centerTechX, centerTechY) > internetHrs*moodScale/2) {
    fill(43, 140, 190);
    ellipse(centerTechX, centerTechY, freeHrs*techScale, freeHrs*techScale);
    fill(255);
    textFont(font2, 22);
    text("Time-Spent: Other,", centerTechX-70, centerTechY);
    text("28.56 hrs", centerTechX-30, centerTechY+30);
  } 
  else if (dist(mouseX, mouseY, centerTechX, centerTechY) < internetHrs*moodScale/2 
    && dist(mouseX, mouseY, centerTechX, centerTechY) > facebookHrs*moodScale/2) {
    fill(123, 204, 196);
    ellipse(centerTechX, centerTechY, internetHrs*techScale, internetHrs*techScale);
    fill(255);
    textFont(font2, 22);
    text("Time-Spent: Internet,", centerTechX-75, centerTechY);
    text("15.52 hrs", centerTechX-35, centerTechY+30);
  } 
  else if (dist(mouseX, mouseY, centerTechX, centerTechY) < facebookHrs*moodScale/2 
    && dist(mouseX, mouseY, centerTechX, centerTechY) > twitterHrs*moodScale/2) { 
    fill(123, 204, 196);
    ellipse(centerTechX, centerTechY, internetHrs*techScale, internetHrs*techScale);
    fill(35, 139, 69);
    ellipse(centerTechX, centerTechY, facebookHrs*techScale, facebookHrs*techScale);
    fill(255);
    textFont(font2, 22);
    text("Time-Spent: Facebook,", centerTechX-85, centerTechY);
    text(" 2.3 hrs", centerTechX-30, centerTechY+30);
  } 
  else if (dist(mouseX, mouseY, centerTechX, centerTechY) < twitterHrs*moodScale/2) {

    fill(123, 204, 196);
    ellipse(centerTechX, centerTechY, internetHrs*techScale, internetHrs*techScale);
    fill(35, 139, 69);
    ellipse(centerTechX, centerTechY, facebookHrs*techScale, facebookHrs*techScale);
    fill(186, 228, 188);
    ellipse(centerTechX, centerTechY, twitterHrs*techScale, twitterHrs*techScale);
    fill(255);
    textFont(font2, 22);
    text("Time-Spent: Twitter,", centerTechX-80, centerTechY);
    text(" 1.62 hrs", centerTechX-25, centerTechY+30);
  } 
  else {
    drawTime();
  }
}

void drawTime() {

  fill(43, 140, 190);
  ellipse(centerTechX, centerTechY, freeHrs*techScale, freeHrs*techScale);

  fill(123, 204, 196);
  ellipse(centerTechX, centerTechY, internetHrs*techScale, internetHrs*techScale);

  fill(35, 139, 69);
  ellipse(centerTechX, centerTechY, facebookHrs*techScale, facebookHrs*techScale);


  fill(186, 228, 188);
  ellipse(centerTechX, centerTechY, twitterHrs*techScale, twitterHrs*techScale);
}

void drawMood() {

  noStroke();

  fill(136, 86, 167);
  ellipse(centerMoodX, centerMoodY, happyHrs*moodScale, happyHrs*moodScale);

  fill(140, 150, 198); 
  ellipse(centerMoodX, centerMoodY, stressedHrs*moodScale, stressedHrs*moodScale);

  fill(179, 205, 227);
  ellipse(centerMoodX, centerMoodY, sadHrs*moodScale, sadHrs*moodScale);

  fill(175, 175, 175);   
  ellipse(centerMoodX, centerMoodY, relaxedHrs*moodScale, relaxedHrs*moodScale);
}



