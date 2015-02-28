
//Creative Computing
//Fervido Frias
//Final
//The Quote Device: If you want to calculate time per hourly-rate and know how much to charge your client.


boolean timeRunning = false;
boolean stopTime = false;
int hours, minutes, seconds = 00;
int startTime = 0;
PFont dig;
float money = 0;
int pauseMillis = 0; 
int i = 14;
int hourlyRate = 25;




void setup () {
  size (500, 357);
  noStroke();
  dig = loadFont("DS-Digital-BoldItalic-72.vlw");
  textFont(dig, 72);
}

void draw () {
  //println(pauseMillis + "  " + startTime);   
  money = hours * hourlyRate + float(minutes)/60.f * hourlyRate + float(seconds)/3600.0 * hourlyRate;
  //money = hours * 125;
  background(210, 201, 201);



  if (timeRunning) {

    seconds = (millis() - startTime)/1000;


    println(seconds + " " + minutes + " " + hours);


    if (seconds>=60) {
      minutes += 1;
      startTime = millis();
    }
    if (minutes >=60) {
      hours += 1;
      minutes = 0;
    }
  }
  textSize(72);
  fill(255, 0, 0);
  text( nf(hours, 2) + ":" + nf(minutes, 2) + ":" + nf(seconds, 2), 11, 128);

  noStroke();
  fill(42, 197, 199);

  rect(282, 65, 202, 83);


  fill(45, 55, 56);
  text("$" + nf(money, 0, 2), 300, 128);


  textSize(40);
  text("$" +  nf(hourlyRate, 0, 2)+"/hr", 11, 215);

fill(255,0,0);
textSize(10);
text("up key to increase",11,235);
text("down key to decrease",11,247);

  textSize(72);
  fill(0, 0, 0);
  text("QUOTE>", 11, 70);


  //buttoms
  
  
  
  
  textSize(14);
  stroke(5);
  fill (0, 255, 18);
  rect (12, 142, 67, 27);
  fill(1);
  text("start", 29, 161);



  fill (255, 0, 0);
  rect (87, 142, 67, 27);
  fill(1);
  text("stop", 108, 161);


  fill(255, 144, 0);
  rect (162, 142, 67, 27);
  fill(1);
  text("reset", 178, 161); 

  //millis() visuals

  for (float i = 70; i < width/3.2; i += 5) {
    for (float e = 68; e <= height/3.3; e += 5) { 
      fill(423, random(588), 0);
      ellipse(i*3, e*3, 6, random(6));
    }
  }

if ( mouseX > 12 && mouseX < 78 && mouseY > 142 && mouseY < 168){
  fill(255,0,0);
  rect (12, 142, 67, 27);
fill(42, 197, 199);
  text("start", 29, 161);  
}

if ( mouseX > 87 && mouseX < 154 && mouseY > 142 && mouseY < 169) {
 fill (255, 230, 0);
  rect (87, 142, 67, 27);
  fill(0,23,255);
  text("stop", 108, 161);
}

if (mouseX > 163 && mouseX < 230 && mouseY > 144 && mouseY < 171) {
  fill(42, 197, 199);
  rect (162, 142, 67, 27);
  fill(45, 55, 56);
  text("reset", 178, 161);
}

}

void mousePressed() {
  //start buttom
  if ( mouseX > 12 && mouseX < 78 && mouseY > 142 && mouseY < 168 && !timeRunning) {


    startTime = millis() - pauseMillis;
    timeRunning = true;
  }
  //stop buttom
  if ( mouseX > 87 && mouseX < 154 && mouseY > 142 && mouseY < 169 && timeRunning) {

    pauseMillis = millis();

    timeRunning = false;
  }
  //reset buttom

  if (mouseX > 163 && mouseX < 230 && mouseY > 144 && mouseY < 171) { 
    seconds = 00;
    minutes = 00;
    hours = 00;
    startTime = millis(); 
    pauseMillis = 0;
  }
}


void keyPressed() {
  if (keyCode == UP) {
    hourlyRate += 1;
  }
  if (keyCode == DOWN) {
    hourlyRate -= 1;
  }
}



