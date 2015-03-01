
int width = 600;
int height = 600;

void setup(){;
  size(600, 600);
}

int seconds = 0;
int minutes = 0;
int hours = 0;
 
void draw(){
  
  
  //draw sky (change background throughout the day) 
  if (hour() <= 8 && minute() <=59 && second() <= 59)//morning
  {
   background(253,153,204); // light pink
  }
  else if (hour() <= 12 && minute() <= 59 && second() <= 59)//early afternoon
  {
   background(153,204,255); //aqua
  }
  else if (hour() <= 17 && minute() <= 59 && second() <= 59)//late afternoon
  {
   background(255,128,0); //purple
  }
  else //nighttime 
  {
   background(0,0,102); //dark blue
  }    
  
  
  
  //define time
  seconds = second();
  minutes = minute();
  hours = hour();
   
  //move clouds per second, minute and hour
  fill(255, 255, 255);
  rect(width/60*seconds, 3*height/4, width/60, height/4);
  fill(255, 255, 255);
  rect(width/60*minutes, height/3, width/60, 5*height/12);
  fill(255, 255, 255);
  rect(width/24*hours, 0, width/24, height/3);
    
   //draw grid
  for(int i=0; i<width; i+=width/24){ //24 blocks for 24 hours
    line(i, 0, i, height/3);
    fill(255, 255, 255);
  }
  line(0, height/3, width, height/3); //60 blocks for 60 minutes 
  for(int i=0; i<width; i+= width/60){
    line(i, height/3, i, 3*height/4); //vertical line
    fill(255, 255, 255);
  }
  line(0, 3*height/4, width, 3*height/4);
  for(int i=0; i<width; i += width/60){ //60 blocks for 60 seconds 
    line(i, 3*height/4, i, height); //vertical line 
    fill(255,255,255);
    stroke(255,255,255); 
  }
  
  
  //draw sun
  if (hour() <= 17 && minute() <=59 && second() <= 59)//morning
  {
  fill (249,250,15) ;
  ellipse (450,75, 110, 110); // yellow sun
   stroke(255,255,255); 
  }
  else //nighttime 
  {
   fill (255,255,255) ;
  ellipse (450,75, 110, 110); //white moon
   stroke(255,255,255); 
  }    
  
  }





