
int maxDays ,bright ,sat;
float startSecond, degree, degchar, stringlt ,ball;
PFont font;
String[] months = new String[12];

void setup(){
  font = loadFont ("EvanescentP-48.vlw");
  textFont(font,20);
  smooth();
  size(320,320);
  frameRate(25);
  colorMode(HSB,360);
  noFill();
  strokeWeight(10);
  strokeCap(ROUND);
  checkMonth();
  startSecond = float(second())*1000.0;
  sat = 280;
  bright = 300;
  months[0] = "New Year";
  months[1] = "Valentine";
  months[2] = "Earth Day";
  months[3] = "April's fool Day";
  months[4] = "Mother Day";
  months[5] = "World Environment Day";
  months[6] = "Budda Lent Day";
  months[7] = "International Beer Day";
  months[8] = "Spirit Festival Day";
  months[9] = "Halloween";
  months[10] = "ThanksGiving Day";
  months[11] = "Christmas";
}

void draw(){
  background(12,50,100);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(-90));
  
  degree = lerp(0,360, norm((startSecond+millis())%60000,0,60000));
  stroke(degree , sat, bright);
  arc(0,0,250,250, radians(5), radians(degree));
  writeOnArc(second()+ " seconds", -135, degree);
  
  degree = lerp(0,360, norm((minute()*60+second())%3600,0,3600));
  stroke(degree, sat, bright);
  arc(0,0, 200,200, radians(6),radians(degree));
  writeOnArc(minute()+" minutes",-110, degree);

  
  degree = lerp(0,360, norm((hour()*60+minute())%1440,0,1440));
  stroke(degree, sat, bright);
  arc(0, 0, 150, 150, radians(9), radians(degree));
  writeOnArc(hour()+ "hours", -84, degree);

  
  degree = lerp(0,360, norm(day(),0,maxDays));
  stroke(degree, sat, bright);
  arc(0, 0, 100, 100, radians(10), radians(degree));
  writeOnArc(day()+"days", -60, degree);
  
  degree = lerp(0,360, norm(month(),0,12));
  stroke(degree, sat, bright);
  arc(0, 0, 50, 50, radians(12), radians(degree));
  writeOnArc(months[month()-1],-33, degree);  
  
  noStroke();
  
  ball = (sin(radians(millis()*0.09)))*260+100;
  if(ball>30)
   fill(HSB,100, ball);
  else
   fill(mouseX,100,mouseY);
   
   ellipse(0, 0,40, 40);
   noFill();
   popMatrix();
}

void checkMonth(){
  if(month()==1 || month()==3 || month()==5 || month()==7 ||  month()==8 ||  month()==10 ||  month()==12)
    maxDays=31;
  if(month()==2)
    maxDays=28;
  else
    maxDays=30;
}

void writeOnArc(String a, float zber, float rot){
  pushMatrix();
  rotate(radians(90));
  stringlt = textWidth(a);
  degchar = (stringlt * 360)/ (zber * TWO_PI);
  rotate(radians(degchar));
  rotate(radians(rot));
  for(int i = 0; i<a. length(); i++)
  {
    fill(34,100,230);
    text(a.charAt(i), 0 ,zber);
    rotate(radians((textWidth(a.charAt(i))*-360)/(zber*TWO_PI)));
    noFill();
  }
  popMatrix();
}

  

