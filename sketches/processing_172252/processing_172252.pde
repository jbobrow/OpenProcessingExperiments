
PFont bold;
PFont reg;

String[] the_hour = {"twelve", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve"}; 
String[] the_min1 = {"o'", "ten", "twenty", "thirty", "forty", "fifty", ""}; 
String[] the_min2 = {"", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen", "twenty"}; 

void setup() {
size(400, 800);
smooth();
noStroke();
}

void draw() {
background(30);
fill(35);
textSize(10);
text("watch out", 20, 20);
text("hae bung min", 20, 780);
textSize(15);
text("", 20, 60);
text("", 20, 80);
text("", 20, 100);
text("when", 20, 120);
text("will it", 20, 140);
text("", 20, 160);
text("it's", 20, 180);
text("", 20, 260);
text("", 20, 280);
text("", 20, 300);
text("", 20, 320);
text("when", 20, 340);
text("", 20, 360);
text("it's still", 20, 380);
text("", 20, 480);
text("", 20, 500);
text("now", 20, 520);
text("will it", 20, 540);
text("", 20, 560);
text("it's still", 20, 580);

//text("shame the sharpest of knives", 20, 100);
//text("and yet it does nothing", 20, 120);
//text("against this stagnant watch", 20, 140);
int h = hour();
if(h > 12){
  h = h -12;
}
int m = minute(); 
int s = second();
// int m = 10;
int tm2 = m%10;
int tm1 = (m-tm2)/10; 
//println (tm1);
//println (tm2);
if(tm2 >= 10 && tm2 <=20) {
 tm2 = tm1*10+tm2;
 tm1 = 6;
}
// println (tm1);
// println (tm2);
textSize(15);
text(the_hour[h], 20, 200);
text(the_hour[h], 20, 400);
text(the_hour[h], 20, 600);
// from 1 to 9
  if(tm1 == 1 && tm2 >= 1 && tm2 <= 9) {
//text(the_min1[tm1], 20, 200);
text(the_min2[tm2+10], 20, 220);
text(the_min2[tm2+10], 20, 420);
text(the_min2[tm2+10], 20, 620);
  }
// from 10 to 20
if(tm1 == 0 && tm2 >= 0 && tm2 <=10) {
text(the_min1[tm1], 20, 220);
text(the_min2[tm2], 20, 240);
text(the_min1[tm1], 20, 420);
text(the_min2[tm2], 20, 440);
text(the_min1[tm1], 20, 620);
text(the_min2[tm2], 20, 640);
  }
  
// for 10
if(tm1 == 1 && tm2 == 0) {
text(the_min1[tm1], 20, 220);
//text(the_min2[tm2], 20, 240);
text(the_min1[tm1], 20, 420);
//text(the_min2[tm2], 20, 440);
text(the_min1[tm1], 20, 620);
//print("/");
 }
  
// from 21 to 59
if(minute() >= 21 && tm1 > 1) {
text(the_min1[tm1], 20, 220);
text(the_min2[tm2], 20, 240);
text(the_min1[tm1], 20, 420);
text(the_min2[tm2], 20, 440);
text(the_min1[tm1], 20, 620);
text(the_min2[tm2], 20, 640);
//  println (tm1);
// println (tm2);
//print("b");
}
    // for 'clock' every hour
   if(m == 0) {
    text("clock", 20, 240);
    text("clock", 20, 440);
    text("clock", 20, 640);
   }
}


