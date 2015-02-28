
float circle = PI+PI/2;
float incr_60 = -TWO_PI/60;
float incr_24 = -TWO_PI/24;
float incr_12 = -TWO_PI/12;
float x_sec;
float y_sec;
float x_min;
float y_min;
float x_hour;
float y_hour;
float x_mon;
float y_mon;
color day;
color month;
color hour;
color minute;
color second;



void setup(){
  size(600,600);
  
}

void draw(){
  background(50);
  noStroke();
  day = color(#D99543);
  month = color(1,69,50);
  hour = color(4,224,123);
  minute = color(4,150,68);
  second = color(149,155,191);
  textSize(40);
  textAlign(CENTER,CENTER);

  fill(day);
  arc(width/2, height/2, 335,335, circle, circle + radians(day())/30*360);
  fill(50);
  ellipse(width/2,height/2,330,330);
  
  fill(month);
  arc(width/2,height/2,320,320, circle,circle + radians(month())/12*360);
  fill(50);
  ellipse(width/2,height/2,300,300);
  
  fill(hour);
  arc(width/2, height/2, 290,290, circle, circle + radians(hour())/24*360);
  fill(50);
  ellipse(width/2,height/2, 160,160);
  
  fill(minute);
  arc(width/2,height/2,150,150,circle,circle + radians(minute())/60*360);
  fill(50);
  ellipse(width/2,height/2,100,100);
  
  pushMatrix();
    translate(width/2,height/2);

    for (int i=0; i<60; i++){
      if (i == second()){
        fill(second);
      }else{
        noFill();
      }
      
      
      x_sec = sin(PI+i*incr_60)*40;
      y_sec = cos(PI+i*incr_60)*40;
      ellipse(x_sec,y_sec,10,10);
     
    }
  popMatrix();
  
  pushMatrix();
    translate(width/2,height/2);

    for (int i=0; i<60; i++){
      if (i == minute()){
        fill(minute);
      }else{
        noFill();
      }
      
      x_min = sin(PI+i*incr_60)*62.5;
      y_min = cos(PI+i*incr_60)*62.5;
      ellipse(x_min,y_min,25,25);
     
    }
  popMatrix();
    
  pushMatrix();
    translate(width/2,height/2);

    for (int i=0; i<60; i++){
      if (i == hour()){
        fill(hour);
      }else{
        noFill();
      }
      
      x_hour = sin(PI+i*incr_24)*112.55;
      y_hour = cos(PI+i*incr_24)*112.55;
      ellipse(x_hour,y_hour,64.5,64.5);
     
    }
  popMatrix();
  
  pushMatrix();
    translate(width/2,height/2);

    for (int i=0; i<60; i++){
      if (i == month()){
        fill(month);
      }else{
        noFill();
      }
      
      x_mon = sin(PI+i*incr_12)*155;
      y_mon = cos(PI+i*incr_12)*155;
      ellipse(x_mon,y_mon,10,10);
     
    }
  popMatrix();
  
}
