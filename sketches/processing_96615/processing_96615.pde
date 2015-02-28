
PFont font;
int s = 10;
float w;
float c;
float y;
float l;
float m;
float d;
float h;

int cx, cy; 
float secondsRadius; 
float minutesRadius; 
float hoursRadius; 
float clockDiameter; 
 
String M = "January";
String D = "Sunday";


void setup(){
    size(300,500);
    smooth();
    font = createFont("HelveticaNeue-CondensedBlack", 72);
    textFont(font, 52);
  stroke(0);       
  int radius = min(width, height) / 2; 
  secondsRadius = radius * 0.72; 
  minutesRadius = radius * 0.60; 
  hoursRadius = radius * 0.50; 
  clockDiameter = radius * 1.8;      
  cx = width / 2;   
  cy = height / 2; 
    
}
 
void draw(){
    background(255);
     
    fill(255);
    noStroke();
    rectMode(CORNER);
    rect(0,height-100,width,height);
    rect(0,0,width,100);
     
     
     
     
    textFont(font, 52);
     
     
     
    fill(4,138,171);
    if(hour() <= 12 && hour() > 0 && minute() > 9){
        text(hour()+":"+minute(),s,height-55);
    }
    if(hour() <= 12 && hour() > 0 && minute() <= 9){
        text(hour()+":"+"0"+minute(),s,height-55);
    }
    if(hour() > 12 && minute() > 9){
        text(hour()-12+":"+minute(),s,height-55);
    }
    if(hour() > 12 && minute() <= 9){
        text(hour()-12+":"+"0"+minute(),s,height-55);
    }
     
    if(hour() == 0 && minute() > 9){
        text("12"+":"+minute(),s,height-55);
    }
    if(hour() == 0 && minute() <= 9){
        text("12"+":"+"0"+minute(),s,height-55);
    }
     
    if(day() > 9 && month() > 9){ 
        text(month()+"/"+day()+"/"+year(),10,height-15);
    }
     
    if(day() < 10 && month() > 9){ 
        text(month()+"/"+"0"+day()+"/"+year(),10,height-15);
    }
     
    if(day() > 9 && month() < 10){ 
        text("0"+month()+"/"+day()+"/"+year(),10,height-15);
    }
     
    textFont(font, 30);
     
    if(second() < 10){
        text("0"+second(),135,height-55);
    }
     
    if(second() > 9){
        text(second(),135,height-55);
    }
     
    if(hour() < 12){
        text("AM",175,height-55);
    }
    else{
        text("PM",175,height-55);
    }
     
    textFont(font, 50);
    text(M+" "+year(),5,90);
    text(D+",",5,46);
     
    if(month() == 1){ M = "January";}
    if(month() == 2){ M = "February";}
    if(month() == 3){ M = "March";}
    if(month() == 4){ M = "April";}
    if(month() == 5){ M = "May";}
    if(month() == 6){ M = "June";}
    if(month() == 7){ M = "July";}
    if(month() == 8){ M = "August";}
    if(month() == 9){ M = "September";}
    if(month() == 10){ M = "October";}
    if(month() == 11){ M = "November";}
    if(month() == 12){ M = "December";}
     
     
    c = 4;
    y = year() - 2000;
    l = floor(y/4);
    if(month() == 1){ m = 3;}
    if(month() == 2){ m = 6;}
    if(month() == 3){ m = 6;}
    if(month() == 4){ m = 2;}
    if(month() == 5){ m = 4;}
    if(month() == 6){ m = 0;}
    if(month() == 7){ m = 2;}
    if(month() == 8){ m = 5;}
    if(month() == 9){ m = 1;}
    if(month() == 10){ m = 3;}
    if(month() == 11){ m = 6;}
    if(month() == 12){ m = 5;}
     
    d = day();
    h = c+y+m+l+d;
     
    if(y==4||y==8||y==12||y==16||y==20||y==24||y==28||y==32||y==36||y==40){
        w=h%7-1;
    }
    else{
        w=h%7;
    }
     
    if(w == 1){ D="Sunday";}
    if(w == 2){ D="Monday";}
    if(w == 3){ D="Tuesday";}
    if(w == 4){ D="Wednesday";}
    if(w == 5){ D="Thursday";}
    if(w == 6){ D="Friday";}
    if(w == 7){ D="Saturday";}




rect(0,100, 300,300);
  fill(0);   
  noStroke();  
  ellipse(cx, cy, clockDiameter, clockDiameter);    

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI; 
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;  
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;     
if (mousePressed){
  m=m+mouseY/5;
  }
  ellipse(cx, cy, clockDiameter, clockDiameter);
 

  stroke(random(0,255),random(0,255),random(0,255));   
  strokeWeight(1);    
line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);    
strokeWeight(2); 
line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);  
strokeWeight(6);   
line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);   
// Draw the minute ticks    
strokeWeight(6);    
beginShape(POINTS); 
for (int a = 0; a < 360; a+=6) {
  float angle = radians(a);     
float x = cx + cos(angle) * secondsRadius;   
float y = cy + sin(angle) * secondsRadius; 
vertex(x, y); 

 
}    
endShape(); 
   
}
