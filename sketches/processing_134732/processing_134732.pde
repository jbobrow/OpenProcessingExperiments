
void setup(){
  size(1200, 600);  //establish the size of the program
  noLoop();  //Don't let the program run more than once
  
}

int hour = hour();       //establish several variables for easy debugging and tweaking
int minute = minute();
int year = year();
int month = month();
float lightsOn;
color light;

void draw(){
  
  float Sky = map(hour, 0, 23, 0, 255);             //the tint of the background is determined by the time of day, much like outside
  background(Sky, 68, 160);
  noStroke();
  for(int skyCount = 8; skyCount > 1; skyCount = skyCount - 1){        //the building of a series of blocks in the background, making a pseudo-gradient
    
  fill(Sky-(skyCount*10), 68-(skyCount*12), 160-(skyCount*15));
  rect(0, 100*skyCount, 1200, 100*skyCount);
  }
  
  for( int building = (year/40); building > 0; building = building - 1){     // a for loop is made to establish the number of buildings in the image
  float Width = random(minute, 500);                                          //the width is limited by the minute of current time
float Height = random(50, (year-1500));                                       //height by year, etc.
float leftright = random(0, 1200);
float updown = 625 - Height;
noStroke();
fill(30, 40, Sky/2);                                                          //color of the building
rect(leftright, updown, Width, Height, 3);
if(Width > 30 && Height > 70){                                                //requisite size of a building in order to have windows
for (float windowX = 10; windowX < (Width - 10); windowX += 12){              // for loops setting up an array of windows per building
  for (float windowY = 10; windowY < (Height - 30); windowY += 22){
    if (hour >= 18 || hour <= 2){                                              //lights are most likely to be on between 6pm and 2am
      lightsOn = random(0,10); 
    } else {
       lightsOn = random(0, 30);                                               
    }
       if (lightsOn <= 6) {
          light = #FFFF4D;
       }   else {
           light = #00003D;
         }
         
    fill(light);
    rect(windowX + leftright, windowY + updown, 7, 20);
    
      }
    }
  }
}
/*                                                                //extra space for a foggy filter on top of the buildings
for(int count = 0; count < 10000; count = count +1){
  int x = int(random(1200));
  int y = int(random(600));
  point(x, y);
  
  float r = red(get(x,y));
  float g = green(get(x,y));
  float b = blue(get(x,y));
  noStroke();
  
  fill(r*1.02,g*1.02,b*1.02,12);
  ellipse(x,y,70,70);
}
  
  */
  fill(255);                                                          //the clock on top of the building scene, giving direct information on the time
  stroke(0);
 rect((hour*50),(minute*10),(month*30), (year*.01));                //the x position is the hour, the y is the minute, and the width is the month and the height is the year
 for (float i = 1; i < (month*30);i = i + random(i)){
  for (float j = 1; j < (year/100);j = j + random(j)){
  point(i + (hour*50) ,j + (minute*10));                               //a small for loop to establish an interesting array of points within the clock block 
  } 
 }
 filter(GRAY);                                                        //a greyscale filter for the image. 
}



