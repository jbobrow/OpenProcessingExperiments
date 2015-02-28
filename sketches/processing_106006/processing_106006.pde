
//time millis(), second(), minute(), hours()
//can you create an interesting clock
//to evoke the sense of the sun rising over time

int rectH;
float bgCol = 50;
//THE MOVEMENT OF YELLOW
float distYellow;
//THE DARKNESS OR LIGHTNESS


void setup(){
size(500, 500);
rectH = height/6;
}

void draw()   {
background(bgCol);
int ms = millis();
int s = second(); //values from 0-59
int m = minute(); //values from 0-50
int h = hour(); //values from 0-23
float newS = map(s, 0, 30, 0, width);
bgCol = map(distYellow, 550, 0, 0, 255);

distYellow=dist(250, 0, newS, 0);
println(distYellow);
//
//  if (distYellow == 0) {
//  bgCol = 120;
//  }
//  
//  if (distYellow > 100) {
//    bgCol = 120 - distYellow;
    
   
//  }
//  
//  if(distYellow < 0) {
//    bgCol = 20 - distYellow;
//  }

//MY NOTES
//bgBright= 100/newS
//
//bgCol = (newS );
//distYellow = 0 then bgBright =100
//distYellow > = 
//bgBright = distYellow > 0 then bgBright < 100





//println(m);
//seconds
//rect(0, 0, newS, rectH);
//yellow
fill(255, 225, 75);
ellipse(newS, 0, 200, rectH);

//THIS IS WHAT CONNECTS THE YELLOW SUN TO THE LIGHTNESS OR DARKNESS
//if (newS > || = 600) {
//newS = 0}


if (s == 50) {
//  bgCol = (110);

//minutes
//rect(0, rectH, m, rectH);
//green
fill(54, 234, 64);
ellipse(0, rectH, m, rectH);
//minutes
//rect(0, rectH, m, rectH);
//sand
//fill(247, 219, 115);
//ellipse(0, rectH, m, rectH);
//hours
//rect(0, rectH*2, h, rectH);
}
int posX = 0;
int vel = 10;
posX = posX + vel;

//XXXXXXXX

//void draw() {
//red
fill(250, 45, 45);
ellipse(posX, rectH*2 +20, h, 20);
//red orange
fill(232, 38, 28);
ellipse(0, rectH*2 +20, h, 20);
//orange red
fill(234, 84, 14);
ellipse(0, rectH*2 +20, h, 20);
//orange
fill(250, 128, 5);
ellipse(0, rectH*2 +20, h, 20);






//bright blue
fill(75, 151, 255);
ellipse(56, s, 55, 55);
//purple
fill(157, 44, 240);
ellipse(100, s*10, 55, 55);
//darker1
fill(103, 15, 113);
ellipse(200, s*15, 55, 55);
//darker2
fill(85, 9, 75);
ellipse(300 + s, s*20, 55, 55);

//if (s == 5) {
//  bgCol = (30);
//}
//if (s == 10) {
//  bgCol = (40);
//}
//if (s == 20) {
//  bgCol = (50);
//}
//if (s == 25) {
//  bgCol = (60);
//}
//if (s == 30) {
//  bgCol = (70);
//}
//if (s == 40) {
//  bgCol = (90);
//}
//if (s == 40) {
//  bgCol = (100);
//}
//if (s == 50) {
//  bgCol = (110);
//}
//println("MS = " + ms +"S = " + s +"M = " +m + "H = " +h);
//}
}
// things I need to fix: 
//all of the if statements should be a variable + 5
//the location of the yellow shape and the shade of the background should have a more clear relationship
// it should always start at the same point - initialize 




