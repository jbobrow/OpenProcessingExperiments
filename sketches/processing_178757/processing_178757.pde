
clock c;
color c1, c2;
PFont font;

void setup()
{
  size(500, 500);
  smooth();
  font = createFont("Arial Black", 20, true);
  textFont(font);
  
  colorMode(HSB, 360, 100, 100);
  c1 = color(180, 15, 90);
  c2 = color(360, 75, 40);
  
  c = new clock(c1, c2); //create a new clock
}

void draw()
{
  background(360);
  

  translate(width/2, height/2);
  
  //display the clock 
  c.display_bg();
  c.display_minutes();
  c.display_numbers();
  c.display_hours();
  
  //display the pointer
  c.hours();
  c.minutes();
  c.seconds();  
}


void mouseClicked()
{
  float r =random(180);
  c.c1 = color(r, 15, 90);
  c.c2 = color(r + 180, 75, 40);
  
}

class clock
{
  int diam;
  color c1, c2;
    
  clock( color c1_, color c2_)
  {
    diam = 300; //diameter of the clock;
    c1 = c1_; //color of the clock background;
    c2 = c2_; //color of the clock canvas
  }
  
  
  void display_bg() //display the background
  {
    strokeWeight(1);
    
    //clock  canvas
    noStroke();
    fill(c2);
    ellipse(0, 0, 1.25 * diam, 1.25 * diam);
    
    //clock background
    fill(c1);
    ellipse(0, 0, diam + 10, diam+ 10);
    
    //circle
    stroke(c2);
    noFill();
    ellipse(0, 0, diam, diam);
    
    //circle in the center
    noStroke();
    fill(0);
    ellipse(0, 0, 20, 20);
    
    //display time
    fill(0);
    textSize(10);
    textAlign(CENTER, CENTER);
    text(hour() + ":" + minute() + ":" + second(), 0, -80);
  }
  
  
  void display_minutes() //display the lines for the minutes
  {
    float x = diam/2 - 10;
    float teta = 0;
   
    pushMatrix();
    for(int i = 0; i < 60; i++)
    {    
      rotate(radians(teta));
      
      strokeCap(SQUARE);
      strokeWeight(2);
      stroke(0);
      line(x, 0, x - 10, 0);      
           
      teta = 6;

    }
    popMatrix();
  }
  
  
  void display_hours() //display the lines for the hours
  {
    int x = diam/2 - 10;
    int teta = 0;
    
    pushMatrix();
    for(int i = 0; i < 12; i++)
    {
      rotate(radians(teta));
      
      strokeCap(SQUARE);
      strokeWeight(5);
      stroke(0);
      line(x, 0, x - 15, 0);
           
      teta = 30;
    }
    popMatrix();   
  }
  
 void display_numbers() //display the numbers of the hours
  {
    int d;
    float x, y;
    float teta = - radians(60); //begins on 1
    
    for(int i = 1; i < 13; i++)
    { 
      fill(0);
      textAlign(CENTER, CENTER);
      d = diam/2 - 40;
      
      if(i % 3 != 0) //12 3 6 9
      {      
        textSize(diam/20);      
      }
      else //other numbers
      {
        textSize(diam/10);
      }      
      x = d * cos(teta);
      y = d * sin(teta);
      text(i, x, y);
      
      teta += radians(30);
    }   
  } 
  
  
  
  void hours()
  {    
    int size_hours = (int)(diam/2 - 90);
    float h = hour() + float(minute())/60 + float(second())/3600;
    if (h > 12) {h -= 12;}  //convert 24hs to 12hs a.m / p.m
    
    pushMatrix();
    rotate(- HALF_PI); //begins on the top
  
    h = map(h, 0, 12, 0, TWO_PI); //find the correspondent angle
    
    strokeCap(ROUND);
    strokeWeight(9);
    stroke(0);
    line(15*cos(h+PI), 15*sin(h+PI), size_hours*cos(h), size_hours*sin(h));
    
    popMatrix();
  }
  
  
  void minutes()
  {    
    int size_minutes = (int)(diam/2 - 50);
    float m = minute() + float(second())/60;
    
    pushMatrix(); 
    rotate(- HALF_PI); //begins on the top
   
    m = map(m, 0, 60, 0, TWO_PI);  //find the correspondent angle
    
    strokeCap(ROUND);
    strokeWeight(5);
    stroke(0);
    line(15*cos(m+PI), 15*sin(m+PI), size_minutes*cos(m), size_minutes*sin(m));
    
    popMatrix();
  }
  
  
  void seconds()
  {
    int size_seconds = (int)(diam/2 - 30);
    float s = second();
    
    pushMatrix();
    rotate(- HALF_PI); //begins on the top
   
    s = map(s, 0, 60, 0, TWO_PI); //find the correspondent angle
    
    strokeCap(ROUND);
    strokeWeight(2);
    stroke(c2);
    line(20*cos(s+PI), 20*sin(s+PI), size_seconds*cos(s), size_seconds*sin(s));
    fill(0);
    ellipse(0, 0, 10, 10);
    
    popMatrix();
  }
}




