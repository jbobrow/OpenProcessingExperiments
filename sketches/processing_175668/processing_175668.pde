
int HeartY1 = -5;
int HeartY2 = 5;
int HeartY3 = 40;
int HeartY4 = 15;
int FirstRectX1 = 200;
int FirstRectX2 = 50;
int firstlineX1 = 235;
int firstlineX2 = 265;
int secondlineX1 = 175;
int secondlineX2 = 135;     
int firstellipseX1= 200;
int secondellipseX1= 230;
int ThirdEllipseX1 = 170;
int rate = 1;
int secondrate = -1;

void setup () {
size (600,600); // this is the size of my canvas 
background (#FF93FD); // sets
fill(230,230,230);
}

void draw() {
background (#FF93FD);
rectMode(CENTER);
rect(FirstRectX1,170,FirstRectX2,100);
line(firstlineX1,220,firstlineX2,250);
line(secondlineX1,220,secondlineX2,250);
fill(225,225,225);  
  
ellipseMode(CENTER);
ellipse(firstellipseX1,75,110,80);
fill(0,0,0);
ellipseMode(CENTER);
ellipse(secondellipseX1,75,25,45);
ellipseMode(CENTER);
ellipse(ThirdEllipseX1,75,25,45);


smooth();
noStroke();
fill(300,0,0);
beginShape();
vertex(50, HeartY4); 
bezierVertex(50, HeartY1, 90, HeartY2, 50, HeartY3); 
vertex(50, HeartY4); 
bezierVertex(50, HeartY1, 10, HeartY2, 50, HeartY3); 
endShape();


HeartY1 = HeartY1 + rate;
HeartY2 = HeartY2 + rate;
HeartY3 = HeartY3 + rate;
HeartY4 = HeartY4 + rate;
FirstRectX1 = FirstRectX1 + secondrate;
firstlineX1 = firstlineX1 + secondrate;
firstlineX2 = firstlineX2 + secondrate;
secondlineX1 = secondlineX1 + secondrate;
secondlineX2 = secondlineX2 + secondrate;
firstellipseX1 = firstellipseX1 + secondrate;
secondellipseX1 = secondellipseX1 + secondrate;
ThirdEllipseX1 = ThirdEllipseX1 + secondrate;

if (FirstRectX1 <= 100) {
  rate = rate * -1;
  secondrate = secondrate * -1;
  if (rate < 0) {
    rate = rate - 3;
    secondrate = secondrate -3;
  } else {
    rate = rate + 3;
    
    secondrate = secondrate + 3;
  }
}
if (FirstRectX1 >= 650) {
  rate = rate * -1;
  secondrate = secondrate * -1;
    if (rate < 0) {
    rate = rate - 3;
    secondrate = secondrate -3;
  } else {
    rate = rate + 3;
    secondrate = secondrate + 3;
  }
}
}



