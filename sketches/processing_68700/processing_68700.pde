

void setup()
{
  size(500, 300);
  
  PFont font;
  font = loadFont("Century-14.vlw");
  textFont(font);
}

void draw()
{

  float seconds, minutes, hours, days;

  background(0);

  seconds = second();
  minutes = minute();
  hours = hour();
  days = hours / 24;

  rectMode(CORNERS);

  textAlign(CENTER, CENTER);
  fill(250, 255, 0);
  
  rect(30, 30, map(seconds, 0, 60, 30, 400), 50);
  rect(30, 70, map(minutes, 0, 60, 30, 400), 90);
  rect(30, 110, map(hours, 0, 24, 30, 400), 130);
  
    for(int i = 1; i < 61; i++){
    if(i==1){
      text(0, 30, 60);
      text(0, 30, 100);
      text(0, 30, 140);
    }
    if ( i%10==0 ){
      fill(247, 137, 255);
      line(30+(((400-30)/60)*i), 0, 30+(((400-30)/60)*i), 400);
      fill(250, 255, 0);
      text(i, 30+(((400-30)/60)*i), 60);
      text(i, 30+(((400-30)/60)*i), 100);
    }
  }  
  
  for(int i = 1; i < 25; i++){
    if(i%4==0){
      text(i, 30+(((400-30)/24)*i), 140);
    }
  }
  
  text("seconds", 430, 40);
  text("minutes", 430, 80);
  text("hours", 430, 120);
  
}


