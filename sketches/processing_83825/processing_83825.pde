
PFont font;
int prevminute = -1; //first time through sketch, it will be reset to minute()

void setup() {
  size(600, 600);
  font = loadFont("GothamBlack-48.vlw");
  textFont(font, 48);
  textSize(48);
}

void draw() {
  background(0, 0, 255, 150);
noStroke();
  fill(255);
  text(second(), second()*10, second()*10);
  text(minute(), minute()*10, minute()*10);
  text(hour(), 550, hour()*25);
  println(mouseX + " " + mouseY);
  //  fill(13, 180, 255);
  //  arc(300, 100, 100, 100, radians(180), radians( minute() * 360/60 +180 ));
  //
  //  fill(random (1, 255), 0, 130);
  //
  //  arc(100, 100, 100, 100, radians(180), radians( second() * 360/60 +180 ));
  //  fill(25, 219, 13);
  //  arc(500, 100, 100, 100, radians(180), radians( hour() *360/24 +180 ));









  fill(255, 0, 130, 150);
  rect(0, 0, width, second()*height/60);
  rect(0, 0, second()*width/60, height);
  fill(255, 255, 0, 150);
  rect(0, 00, minute()*10, minute()*10);
  fill(40, 50, 60, 165);
  rect(530, 0, 70, hour()*25);
  //Minutes and Seconds

  fill(250, 0, 255, 150);
  ellipse(second()*10, 150, 20, 20);
  ellipse(second()*10, 450, 20, 20);
  fill(100, 0, 200, 150);
  ellipse(second()*10, 300, 40, 40);



stroke(255,255,255,255);

  //Seconds and Minutes
  for (int i = 0; i < 600; i = i+10) {
    line(0, i, 35, i);
  }
  //Every 10  
  for (int i = 0; i < 600; i = i+100) {
    line(0, i, 60, i);
  }
  //Hour  
  for (int i = 0; i < 600; i = i+25) {
    line(555, i, 600, i);
  }
  //Every 6  
  for (int i = 0; i < 600; i = i+150) {
    line(520, i, 600, i);
  }
noStroke();

  text("NEW YORK", 160, 320);

  textSize(200);
if (second() == 30){
  text("30",300,300);

}

  textSize(50);

  if (mousePressed == true) { 
    background(0, 0, 0, 50);
    textSize(50); 


    PImage map;
    map = loadImage("map.jpg");
    image(map, 0, 0);

    //
    //    
    //
    //    if (minutecolor > 255) {
    //      minutecolor = minutecolor/random(2,10);
    //    }
    //
    //    fill(minutecolor, 200, 30);

    //float minutecolor = minute()*random(6,14);
    if (minute()!= prevminute) {
      fill(random(2, 200), 89, 124, 255);
      prevminute = minute();
    }




    text("PARIS", 50, 120);
    int parishours = hour() + 6;
    if (parishours > 24) {
      parishours = parishours-24;
    };
    text(parishours+":"+minute()+":"+second(), 35, 162);
    //    fill(200, minutecolor, 30);

    text("TOKYO", 400, 150);
    int tokyohours = hour() + 16;
    if (tokyohours > 24) {
      tokyohours = tokyohours-24;
    };
    text(tokyohours+":"+minute()+":"+second(), 400, 187);




    // fill(random(4,200),random(4,200),random(4,200));
    //  text(hour()+16,50,550);
    //  
    //    fill(random(4,200),random(4,200),random(4,200));
    //   text(minute(),240,550);
    //     
    //    fill(random(4,200),random(4,200),random(4,200));
    //   text(second(),400,550);
  }

  if (mousePressed == false) { 
    textSize(48);
  }





  println(second());
  println(hour());
}


