


void setup () {

  size(800, 600); 
  smooth(); 
  frameRate(30);
}


int wert = 1 ; 
int wert2 = -1;
int wert3 = -1;
int wert4 = 0;
float wert5 = 0.1 ; 
boolean highgrenze = false ; 
boolean lowgrenze = false ; 

void draw () {
  background(255);
  

  
  
scale(wert5,wert5);
if (wert5 >= 1.1 ) { 
    highgrenze = true;
    lowgrenze = false ; 
  } 

if (wert5 <= 0.9 ) { lowgrenze = true ;
    highgrenze = false ; 
} 

if (lowgrenze == true ) { wert5 = wert5 + 0.01 ; }

if (highgrenze == true) { wert5 = wert5 - 0.01 ; }

  pushMatrix();
  stroke(0); 
  translate(mouseX, mouseY); 
  rotate(radians(1 + wert4));
  ellipse(50,50,20,20);
  fill(255);
 ellipse(50,50,20,10); 
 fill(0);
 ellipse(50,50,4,4);
  wert4 = wert4 + 6; 
  popMatrix();

  pushMatrix();
  translate(mouseX, mouseY);
  rotate(radians(1+wert));
  wert = wert + 1 ; 
  for (int i = 0;i <= 360;i=i+2) {
    strokeWeight(1);
    stroke(0); 
    rotate(radians(6));
    ellipse(75,75,3,3);
    strokeWeight(1);
    noFill();
    bezier(75,75,random(75,85),random(75,85),random(80,95),random(80,95),random(95,105),random(95,105));
    if(i%4==0){
    ellipse(75,75,6,6);
    strokeWeight(0.5);
    bezier(75,75,random(85,90),random(85,90),random(95,105),random(95,105),random(105,120),random(105,120));
    }
     if(i%6==0){
    ellipse(75,75,10,10);
    strokeWeight(1);
    bezier(75,75,random(75,90),random(75,90),random(90,130),random(90,130),random(120,150),random(120,150));
    }
  } 
  popMatrix(); 
  
  
  
//  pushMatrix();
//  translate(mouseX, mouseY);
//  rotate(radians(1+wert));
//  wert = wert + 1 ; 
//  for (int i = 0;i <= 360;i=i+2) {
//    rotate(radians(6));
//    stroke(0); 
//    fill(0);  
//     if(i%6==0){
//    ellipse(random(75,130),random(75,130),random(0,30),random(0,30));
//    }
//  } 
//  popMatrix(); 
//  
  
  
  

  pushMatrix();
  translate(mouseX, mouseY);
  rotate(radians(1+wert));
  wert = wert + 1 ; 
  fill(0, 0, 0);
  strokeWeight(3);
  noStroke();
  ellipse(25,25,75,75);
  fill(255);
  ellipse(25,25,75,45);
  fill(0);
  ellipse(25,25,35,35);
  popMatrix();

  pushMatrix();
  translate(mouseX, mouseY);
  rotate(radians(-1+wert2));
  wert2 = wert2 - 1 ; 
  fill(0, 0, 0);
  strokeWeight(3);
  noStroke();
  ellipse(25,25,50,50);
  fill(255);
  ellipse(25,25,50,30);
  fill(0);
  ellipse(25,25,25,25);
  popMatrix();

  pushMatrix();
  translate(mouseX, mouseY);
  rotate(radians(-1+wert3));
  wert3 = wert3 - 4 ; 

  fill(0);
  strokeWeight(3);
  noStroke();
  ellipse(50,50,35,35);
  fill(255);
  ellipse(50,50,35,20);
  fill(0);
  ellipse(50,50,20,20);
  popMatrix();
}


