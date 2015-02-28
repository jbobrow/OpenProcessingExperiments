
int maxDays,bright,sat;
float startSecond,degree,degchar,stringlt,ball;
PFont font;
String[] months = new String[12]; 

void setup()
{
  font = loadFont ("Arial-BoldMT-12.vlw");
  textFont(font);
  smooth();
  size(330,330);
  frameRate(25);
  colorMode(HSB,360);
  noFill();
  strokeWeight(18.0);
  strokeCap(ROUND);
  checkMonth();
  startSecond = float(second())*1000.0;
  sat=280;
  bright=340;
  months[0]="January";
  months[1]="February";
  months[2]="March";
  months[3]="April";
  months[4]="May";
  months[5]="June";
  months[6]="July";
  months[7]="August";
  months[8]="September";
  months[9]="October";
  months[10]="November";
  months[11]="December";
}

void draw(){
  background(0,10,35);  
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(-90));
  
  degree = lerp(0,360,norm((startSecond+millis())%60000,0,60000));
  stroke(degree,sat,bright);
  arc(0, 0, 285, 285, radians(4), radians(degree));
  
  writeOnArc(second()+" seconds",-139, degree);
  
  degree = lerp(0,360,norm((minute()*60+second())%3600,0,3600));
  stroke(degree,sat,bright);
  arc(0, 0, 240, 240, radians(5), radians(degree) );
  
  writeOnArc(minute()+" minutes",-117, degree);
  
  degree = lerp(0,360,norm((hour()*60+minute())%1440,0,1440));
  stroke(degree,sat,bright);
  arc(0, 0, 195, 195, radians(6), radians(degree) );
  
  writeOnArc(hour()+" hours",-95, degree);
  
  degree = lerp(0,360,norm(day(),0,maxDays));
  stroke(degree,sat,bright);
  arc(0, 0, 130, 130, radians(9), radians(degree));
  
  writeOnArc(day()+" day",-62, degree);
  
  degree = lerp(0,360,norm(month(),0,12));
  stroke(degree,sat,bright);
  arc(0, 0, 85, 85, radians(13), radians(degree));
  
  writeOnArc(months[month()-1],-39, degree);
  
  noStroke();
 
  ball = (sin(radians(millis()*0.06)))*260+100;
  if(ball>35)
    fill(0,10,ball);
  else
    fill(0,10,35);

  ellipse(0,0,30,30);
  noFill();
  popMatrix();
}

void checkMonth(){
  if(month()==1 || day()==3 || day()==5 || day()==7 || day()==8 || day()==10 || day()==12)
    maxDays=31;
  if(month()==2)
    maxDays=28;
  else
    maxDays=30;
}

void writeOnArc(String a, float ypos, float rot){ 
  pushMatrix();
  rotate(radians(93));
  stringlt = textWidth(a); 
  degchar = (stringlt * 360) / (ypos * TWO_PI);
  rotate(radians(degchar));
  rotate(radians(rot));
  for(int i=0;i<a.length();i++)
  {
    fill(0,10,35);
    text(a.charAt(i),0,ypos);
    rotate(radians((textWidth(a.charAt(i))*-360)/(ypos*TWO_PI)));
    noFill();
  }
  popMatrix();
}

