
float hourDia;
float minuteDia;
float secondDia;

void setup (){
  size(400,400);
  noStroke();
}

void draw(){
  background (210,230,130,100);
  fill(110, 125, 255);
  text((hour() + ":" + minute() + ":" + second()), 20, 40);
  
  hourDia = map(hour(),0,23,0, (width));
  minuteDia = map(minute(),0,59,0, (width));
  secondDia = map(second(), 0,59,0,(width));
  
  fill (232, 88, 139, 150);
  ellipse(width/2, height/2, hourDia, hourDia);
  fill(110, 125, 255, 230);
  ellipse(width/2, height/2, minuteDia, minuteDia);
  fill(255,200,97, 200);
  ellipse(width/2, height/2, secondDia, secondDia);
 
}


