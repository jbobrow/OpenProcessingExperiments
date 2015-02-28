
void setup() {
size(1280,912);
smooth();
  colorMode(HSB, 360, height, height);  
  hue = new int[width/barWidth];
  noStroke();
}


 
int barWidth = 5;
int[] hue;



void draw (){

float durchmesser = dist(pmouseX, pmouseY, mouseX, mouseY);  

if(durchmesser > 30) {
fill (255,0,0);
} 

else {
  
fill(255);
}

stroke(255);
strokeWeight(0.3);

line (mouseX, mouseY, width/2, height/2);

ellipse(mouseX,mouseY,durchmesser,durchmesser);
}







