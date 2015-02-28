

PFont xFont;

void setup(){
  
  //These functions set the size and the colour of the page,
  //make the shapes drawn smooth, set it so the coordinates
  // of the ellipse are decided by the center point and loads
  //the font I wish to use.
  
  background(255);
  size(850,300);
  smooth();
  ellipseMode(CENTER);  
  xFont=loadFont("ArialMT-12.vlw");
}





//This function creates the orb representing seconds.
void drawSecondOrb(){
  
  //creats an integer called s and gives it the value of the 
  //current seconds, sets the fill and stroke to black.
  int s=second();
  stroke(0);
  fill(0);
  // if the second value is less than half a minute then
  //it generates an orb with a number representing the current
  //number of seconds appears and moves from left to right
  if (s<31){
    fill(150,0,255);
    ellipse((s*24),280,30,30);
    fill(255);
    text(s,((s*24)-4),285);
    
  // if the second value is more than half a minute then
  //it generates an orb with a number representing the current
  //number of seconds appears and moves from right to left
  }else{
    fill(150,0,255);
    ellipse((((30-(s-30))*24)+4),280,30,30); 
    fill(255);
    text(s,((30-(s-30))*24),285);
  }
  
  
}
//This function creates the orb representing minutes.
void drawMinuteOrb(){
  
  //creats an integer called m and gives it the value of the 
  //current minutes, sets the fill and stroke to black.
  
  int m=minute();

  
  stroke(0);
  fill(0);
   // if the minute value is less than half an hour then
  //it generates an orb with a number representing the current
  //number of minutes appears and moves from left to right
  if (m<31){
    fill(0,0,255);
    ellipse((m*24),230,30,30);
    fill(255);
    text(m,((m*24)-4),235);
    
   // if the minute value is more than half a hour then
  //it generates an orb with a number representing the current
  //number of minute appears and moves from right to left
  }else{
    fill(0,0,255);
    ellipse((((30-(m-30))*24)+4),225,30,30); 
    fill(255);
    text(m,((30-(m-30))*24),230);
  }
  
  
}
//This function creates the orb representing hour.
void drawHourOrb(){
  
  //creats an integer called h and gives it the value of the 
  //current hours, sets the fill and stroke to black.
  
  int h=hour();  
  stroke(0);
  fill(0);
   // if the hour value is less than half an day then
  //it generates an orb with a number representing the current
  //number of hours appears and moves from left to right
  if (h<13){
    fill(0,100,0);
    ellipse((h*60),170,30,30);
    fill(255);
    text(h,((h*60)-4),175);
    
   // if the hour value is more than half an day then
  //it generates an orb with a number representing the current
  //number of hours appears and moves from right to left.
  }else{
    fill(0,100,0);
    ellipse((((12-(h-12))*60)+4),175,30,30); 
    fill(255);
    text(h,((12-(h-12))*60),180);
  }
  
  
}//This function creates the orb representing months.
void drawMonthOrb(){
  
  
  //creats an integer called mo and gives it the value of the 
  //current months, sets the fill and stroke to black.
  int mo=month();
  stroke(0);
  fill(0);
  //if the current value of month is less then half a year
  //then the orb moves from left to right.
  //I then had to make a long winded set of if loops to get the
  // name of the month to appear in the orb, I had to do it this 
  //way because an if loop has to use indices.
  if (mo<7){
    fill(241,124,10);
    ellipse((mo*120),80,30,30);
    fill(255);
      if(mo>0&&mo<2){
        text("Jan",((mo*120)-10),85);
      }
      if(mo>1&&mo<3){
        text("Feb",((mo*120)-10),85);
      }
      if(mo>2&&mo<4){
        text("Mar",((mo*120)-10),85);
      }
      if(mo>3&&mo<5){
        text("apr",((mo*120)-10),85);
      }
      if(mo>4&&mo<6){
        text("May",((mo*120)-10),85);
      }
      if(mo>5&&mo<7){
        text("Jun",((mo*120)-10),85);
      }
      
      //same as above, but for the second half of the year causing
      //the orb to mvoe from right to left.
  }else{
    fill(241,124,10);
    ellipse((((6-(mo-6))*120)+4),75,30,30); 
    fill(255);
       if(mo>6&&mo<8){
        text("Jul",((mo*120)+10),85);
      }
      if(mo>7&&mo<9){
        text("Aug",((mo*120)+10),85);
      }
      if(mo>8&&mo<10){
        text("Sep",((mo*120)+10),85);
      }
      if(mo>9&&mo<11){
        text("Oct",((mo*120)+10),85);
      }
      if(mo>10&&mo<12){
        text("Nov",((mo*120)+10),85);
      }
      if(mo>11&&mo<13){
        text("Dec",((mo*120)+10),85);
      }
  
}

  
}

//This function creates the orb representing years.
void drawYearOrb(){
  
  //creats an integer called y and gives it the value of the 
  //current years, sets the fill and stroke to black.
  
  
  int y=year(); 
  stroke(0);
  fill(0);
  
  
   // if the year value is less than half a century then
  //it generates an orb with a number representing the current
  //number of years appears and moves from left to right
  if ((y-2000)<51){
    fill(255,0,0);
    ellipse(((y-2000)*7.2),30,30,30);
    fill(255);
    text(y,(((y-2000)*7.2)-14),35);
    
    
   // if the year value is more than half a century then
  //it generates an orb with a number representing the current
  //number of years appears and moves from right to left
  }else{
    fill(255,0,0);
    ellipse((((50-((y-2000)-50))*7.2)+4),25,30,30); 
    fill(255);
    text(y,((50-((y-2000)-50))*7.2),30);
  }
  
  
}
//This function creates the orb representing day.
void drawDayOrb(){
  
  //creates integers to hold the day and month values, and sets the stroke and fill tie black.
  
  int d=day();
  int mo= month();
  stroke(0);
  fill(0);
  
  //again if statements don't allow you to use equals they must use indices so instead of creating if statements
  //ranging from mo=1 for jan to mo=12 for dec they must all be in the format of two indices with the correct value being 
  //between the two, every month requires a seperate if statement as obviously different months have a different number of
  //days.
  if(mo>0&&mo<2){
  //works exactly the same as the statement for the previous values, if the day is in the first half of the month
  //then it will create an orb with the day moving left to right, likewise if its in the second half
  // creates an orb and text moving right to left.
  //I WON'T BOTHER COMMENTING EACH MONTH, AS EVERY MONTH WORKS THE SAME, JUST WITH DIFFERENT VALUES FOR THE NUMBER OF DAYS
  //(AND THUS THE AMMOUNT OF SPACE ALLOCATED TO EACH DAY).  
    if (d<17){
      fill(255,255,40);
      ellipse((15*43.6),130,30,30);
      fill(100);
      text(d,((d*43.6)-14),135);
    }else if(d>15&&d<17){
      fill(255,255,40);
      ellipse((15*43.6),130,30,30);
      fill(100);
      text(d,((15*43.6)-14),135);
    }else{
      fill(255,255,40);
      ellipse((((16-(d-16))*43.6)+4),125,30,30); 
      fill(100);
      text(d,((16-(d-16))*43.6),130);
    }
  }
  
  if(mo>1&&mo<3){
    if (d<15){
      fill(255,255,40);
      ellipse((d*51.4),130,30,30);
      fill(100);
      text(d,((d*51.4)-14),135);
    }else{
      fill(255,255,40);
      ellipse((((14-(d-14))*51.4)+4),125,30,30); 
      fill(100);
      text(d,((14-(d-14))*51.4),130);
    }
  } 
  
  if(mo>2&&mo<4){
        
    if (d<17){
      fill(255,255,40);
      ellipse((15*43.6),130,30,30);
      fill(100);
      text(d,((d*43.6)-14),135);
    }else if(d>15&&d<17){
      fill(255,255,40);
      ellipse((15*43.6),130,30,30);
      fill(100);
      text(d,((15*43.6)-14),135);
    }else{
      fill(255,255,40);
      ellipse((((16-(d-16))*43.6)+4),125,30,30); 
      fill(100);
      text(d,((16-(d-16))*43.6),130);
    }
  }  
  
  if(mo>3&&mo<5){
      if (d<16){
        fill(255,255,40);
        ellipse((d*48),130,30,30);
        fill(100);
        text(d,((d*48)-14),135);
      }else{
        fill(255,255,40);
        ellipse((((15-(d-15))*48)+4),125,30,30); 
        fill(100);
        text(d,((15-(d-15))*48),130);
      }
  } 
  
  if(mo>4&&mo<6){
        
      if (d<17){
        fill(255,255,40);
        ellipse((d*43.6),130,30,30);
        fill(100);
        text(d,((d*43.6)-4),135);
       }else if(d>15&&d<17){
        fill(0);
        ellipse((15*43.6),130,30,30);
        fill(255);
        text(d,((15*43.6)-4),135);
      }else{
        fill(255,255,40);
        ellipse((((16-(d-16))*43.6)+4),125,30,30); 
        fill(100);
        text(d,((16-(d-16))*43.6),130);
      }
    } 
  
  if(mo>5&&mo<7){
      if (d<16){
        fill(255,255,40);
        ellipse((d*48),130,30,30);
        fill(100);
        text(d,((d*48)-14),135);
      }else{
        fill(255,255,40);
        ellipse((((15-(d-15))*48)+4),125,30,30); 
        fill(100);
        text(d,((15-(d-15))*48),130);
      }
  }      
  
  
  if(mo>6&&mo<8){
        
    if (d<17){
      fill(255,255,40);
      ellipse((15*43.6),130,30,30);
      fill(100);
      text(d,((d*43.6)-14),135);
    }else if(d>15&&d<17){
      fill(255,255,40);
      ellipse((15*43.6),130,30,30);
      fill(100);
      text(d,((15*43.6)-14),135);
    }else{
      fill(255,255,40);
      ellipse((((16-(d-16))*43.6)+4),125,30,30); 
      fill(100);
      text(d,((16-(d-16))*43.6),130);
    }
  } 
  
  if(mo>7&&mo<9){
        
    if (d<17){
      fill(255,255,40);
      ellipse((15*43.6),130,30,30);
      fill(100);
      text(d,((d*43.6)-14),135);
    }else if(d>15&&d<17){
      fill(255,255,40);
      ellipse((15*43.6),130,30,30);
      fill(100);
      text(d,((15*43.6)-14),135);
    }else{
      fill(255,255,40);
      ellipse((((16-(d-16))*43.6)+4),125,30,30); 
      fill(100);
      text(d,((16-(d-16))*43.6),130);
    }
  } 
  
  if(mo>8&&mo<10){
     if (d<16){
       fill(255,255,40);
       ellipse((d*48),130,30,30);
       fill(100);
       text(d,((d*48)-14),135);
    }else{
      fill(255,255,40);
      ellipse((((15-(d-15))*48)+4),125,30,30); 
      fill(100);
      text(d,((15-(d-15))*48),130);
    }
  } 
  
  if(mo>9&&mo<11){
        
    if (d<17){
      fill(255,255,40);
      ellipse((15*43.6),130,30,30);
      fill(100);
      text(d,((d*43.6)-14),135);
    }else if(d>15&&d<17){
        fill(255,255,40);
        ellipse((15*43.6),130,30,30);
        fill(100);
        text(d,((15*43.6)-14),135);
    }else{
        fill(255,255,40);
        ellipse((((16-(d-16))*43.6)+4),125,30,30); 
        fill(100);
        text(d,((16-(d-16))*43.6),130);
    }
  } 
  if(mo>10&&mo<12){
     if (d<16){
        fill(255,255,40);
        ellipse((d*48),130,30,30);
        fill(100);
        text(d,((d*48)-14),135);
    }else{
        fill(255,255,40);
        ellipse((((15-(d-15))*48)+4),125,30,30); 
        fill(100);
        text(d,((15-(d-15))*48),130);
    }
  } 
  
  
  if(mo>11&&mo<13){
        
    if (d<17){
      fill(0);
      ellipse((15*43.6),130,30,30);
      fill(255);
      text(d,((d*43.6)-14),135);
    }else if(d>15&&d<17){
        fill(0);
        ellipse((15*43.6),130,30,30);
        fill(255);
        text(d,((15*43.6)-14),135);
    }else{
      fill(0);
      ellipse((((16-(d-16))*43.6)+4),125,30,30); 
      fill(255);
      text(d,((16-(d-16))*43.6),130);
    }
  }     
    
}


//Each time the draw function is run it regenerates the background
//and then runs the functions to create each orb. 
void draw(){


  int test =5;
  background(255);
  
  fill(200);
  stroke(200);
  line(740,0,740,height); 
  line(0,50,width,50);
  line(0,100,width,100);
  line(0,150,width,150);
  line(0,200,width,200);
  line(0,250,width,250);
  line(0,300,width,300);
  
  
  
  fill(255,0,0,100);
  rect(740,0,200,50);
  fill(255);
  text("Year",750,30);

  
 fill(240,125,10,100);
 rect(740,50,200,50);
 fill(255);
 text("Month",750,80);
 
 fill(255,255,40,100);
 rect(740,100,200,50);   
 fill(100);
 text("Day",750,130);
      
 fill(0,100,0,100);
 rect(740,150,200,50);     
 fill(255);
 text("Hour",750,180);
 
 fill(0,0,255,100);
 rect(740,200,200,50);      
 fill(255);
 text("Minute",750,230);
 
 fill(150,0,255,100);
 rect(740,250,200,50);         
 fill(255);
 text("Second",750,280);
  
    
  drawSecondOrb();
  drawMinuteOrb();
  drawHourOrb();
  drawDayOrb();
  drawMonthOrb();
  drawYearOrb();

}





