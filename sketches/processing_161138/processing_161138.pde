
int i =0;
int counter = 0;
float money = 1000;

void setup () {
  background(0);
  size(600, 600);
  strokeWeight(1);
  stroke(127);
    noStroke();
  fill(255);
  ellipse(300,150,600,300);
  

} 

void draw() {
 
  
  noFill();
stroke(255);
  ellipse(300,150,600,300);

float m =millis(); //cant get this to count secs or add to money
noStroke();
 if (m==1000){
money=money+250;
}

  
 
}
void mousePressed() {
i= i+ 1;
fill(random(0,255),random(0,255),random(0,255));
noStroke();
rect(random(0,550),random(50,200),50,50);

counter = counter + 1;

money= money - random(1,20);
textSize(12);
fill(0);
rect(250,400,textWidth("Money " + money),300);
fill(255);
text("Files " + counter,250,500);
text("Money " + money,250,488);
if (i==100){
  background(0);
 
}
}


