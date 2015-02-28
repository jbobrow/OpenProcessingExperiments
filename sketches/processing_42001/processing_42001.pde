

int centerX = 75;
int centerY = 90;
int increment = 5;
int linestartX = 85;
int linestartY = 115;

void setup() {
  size(550,800);
}

void draw() {
 fill(255);
 noStroke();
 ellipse(centerX,centerY,3,3); 
 
  centerY = centerY + increment;
  
//I wanted the following to start after the dot outline was done but didn't know how.  
 stroke(0);
 strokeWeight(2);
 line(linestartX,linestartY,linestartX,linestartY + 20);
  
  linestartX = linestartX + 2;
 
if(centerY >= 600)
  centerY = 600;

if(centerY == 600)
  centerX = centerX + increment;  

if(centerX >= 375)
  centerX = 375;  

if(centerX == 375)
  increment = -5;

if(centerY <= 90)
  centerY = 90;

if(centerY == 90)
  centerX = centerX + increment;

if(centerX < 75)
  centerX = 75;
  
  


if(linestartX >= 365)
linestartY = linestartY + 40;
  
if(linestartX >= 365)
linestartX = 85;

if(linestartY == 595)
linestartY = 115;


 
}


