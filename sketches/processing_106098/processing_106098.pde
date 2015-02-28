
PFont font;

float hourX;
float hourY;
float minuteX;
float minuteY;
float secondX;
float secondY;
float pos;
float pos2;
float pos3;
void setup() {
  size(400,400);
  noStroke();

}

void draw() {
  background(255,255,255);
  
  fill(240);
 
  text((hour() + ":" + minute() + ":" + second()), 10, 40); //write the hour, minutes, and seconds on the top-left of the screen
  // maping the hour(), total of 24: 0->23
  hourX = map(hour(),0,24,0,(width)); //map the current hour to an X position on the screen
  hourY= map(hour(),0,24,0,(height)); //map the current hour to an y position on the screen
  //
  minuteX = map(minute(),0,59,0,(width)); //map the current minute to an X position on the screen
  minuteY =  map(minute(),0,59,0,(height)); //map the current minute to an X position on the screen
  secondX = map(second(),0,59,0,(width)); //map the current second to an X position on the screen
  secondY = map(second(),0,59,0,(height)); //map the current second to an X position on the screen

//posicion del sol


  fill(247,240,7);
  //calcula la posicion respecto a la hora
   if (hour() < 12) {
   pos=width - hourY;
     
   } else {
     pos=hourY;
   }
//Calcula la posicion con respecto a los minutos   
   if (minute() < 30) {
   pos3=width - minuteY;
     
   } else {
     pos3=minuteY;
   }


    
  //calcula la posicion respecto a segundos
   if (second() < 30) {
   pos2=width - secondY;
     
   } else {
     pos2=secondY;
   }
  
  ellipse(hourX,pos,40,40); //sun moves around
  fill(0,0,0);
  ellipse(minuteX,pos3,10,10); //draws a rectangle in the middle of the screen with an X position based on the current minute
  fill(164,220,240);
  ellipse(secondX,pos2,20,20); //Segundos
  fill(7,242,75);

//mountains
  ellipse(width/2,height, 60,80);
  ellipse((width/2)-40,height, 20,70);
  ellipse((width/2)+40,height, 35,70);
  ellipse((width/2)+70,height, 40,24);
  ellipse((width/2)-80,height, 20,70);
//image(mountain,0,float(height),width, float(height-100)); 
}
