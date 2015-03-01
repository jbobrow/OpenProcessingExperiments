
String months [] = {
"Jan.", "Feb.", "Mar.", "Apr.", "May.", "Jun.", "Jul.", "Aug.", "Sep.", "Oct."
};
String homicides [] = {
"44", "14", "17", "24", "46", "44", "52", "53", "41", "31"
};
float order [] = {
7.0, 9.0, 10.3, 11.8, 14.0, 16.7, 19.6, 22.9, 25.9, 28.2
};
int deaths [] = {
44, 14, 17, 24, 46, 44, 52, 53, 41, 31
};
 
PFont font1;
PFont font2;
PFont font3;
 
float circleX1;
float circleY1;
 
float circleX2;
float circleY2;
 
float circleX3;
float circleY3;
 
float circleX4;
float circleY4;
 
float circleX5;
float circleY5;
 
float circleX6;
float circleY6;
 
float circleX7;
float circleY7;
 
float circleX8;
float circleY8;
 
float circleX9;
float circleY9;
 
float circleX10;
float circleY10;
 
void setup() {
size(938, 300);
smooth();
stroke(50, 100, 150);
strokeWeight(2);
 
circleX1 = 50;
circleY1 = 150;
 
circleX2 = 130;
circleY2 = 150;
 
circleX3 = 182;
circleY3 = 150;
 
circleX4 = 242;
circleY4 = 150;
 
circleX5 = 330;
circleY5 = 150;
 
circleX6 = 438;
circleY6 = 150;
 
circleX7 = 554;
circleY7 = 150;
 
circleX8 = 686;
circleY8 = 150;
 
circleX9 = 806;
circleY9 = 150;
 
circleX10 = 898;
circleY10 = 150;
 
font1 = loadFont("CenturyGothic-16.vlw");
font2 = loadFont("CenturyGothic-28.vlw");
font3 = loadFont("CenturyGothic-14.vlw");
}
 
void draw() {
background(#ffffff);
 
fill(#5CB8FC);
textFont(font1, 16);
text("Interaction: Scroll over circles for locations, Click for Legend.", 8, 20);
 
for (int i=0; i< deaths.length;i++) {
fill(92, 184, 252, 85);
noStroke();
ellipse(order[i]*40 - 230, height/2, deaths[i]*2, deaths[i]*2);
 
pushMatrix();
translate(order[i]*40 - 230, height/2 - deaths[i]/2);
fill(#5CB8FC);
textFont(font1, 16);
text(months[i], -15.1, -35);
popMatrix();
 
pushMatrix();
translate(order[i]*40 - 230, height/2);
fill(0);
textFont(font1, 16);
text(homicides[i], -8, 5);
popMatrix();
}
 
println(dist(circleX1, circleY1, mouseX, mouseY) + "radius:" +100);
//rollover state
if (dist(circleX1, circleY1, mouseX, mouseY)<40) {
if (mousePressed==true) {
stroke(167, 0, 0);
fill(#5CB8FC);
textFont(font3, 14);
text("Legend: Each month is represented by a circle. The numbers on each circle are the amount of confirmed homicides for that month.", 9, 46);
text("Scroll over each circle to see all the Chicago death locations per month (x2 - x5 represents multiple deaths per location).", 9, 66);
//Click Fill
fill(111, 14, 22, 40);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 50, width, 50);
line(0, 70, width, 70);
}
else {
stroke(167, 0, 0);
//Rollover Fill Below
fill(204, 0, 0, 99);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 232, width, 232);
textFont(font3, 14);
text("Albany Park x1, Auburn Gresham x1, Austin x2, Bridgeport x2, Brighton Park x1, Chatham x1, East Side x1, Englewood x2, Gage Park x2,", 8, 230);
stroke(167, 0, 0, 99);
line(0, 252, width, 252);
textFont(font3, 14);
text("Grand Blvd. x1, Greater Grand Crossing x1, Humboldt Park x1, Kenwood x1, Lower West Side x1, Near North Side x1, New City x1,", 8, 250);
stroke(167, 0, 0, 99);
line(0, 272, width, 272);
textFont(font3, 14);
text("North Lawndale x4, North Park x1, Portage Park x1, Roseland x1, South Chicago x1, South Lawndale x1, South Shore x2,", 8, 270);
stroke(167, 0, 0, 99);
line(0, 292, width, 292);
textFont(font3, 14);
text("West Englewood x3, West Garfield Park x6, West Pullman x1, West Town x3.", 8, 290);
stroke(167, 0, 0);
}
}
else {
//Circle Fill Below
fill(92, 184, 252, 95);
}
ellipse(circleX1, circleY1, 86, 86);
 
println(dist(circleX2, circleY2, mouseX, mouseY) + "radius:" +100);
//rollover state
if (dist(circleX2, circleY2, mouseX, mouseY)<20) {
if (mousePressed==true) {
stroke(167, 0, 0);
fill(#5CB8FC);
textFont(font3, 14);
text("Legend: Each month is represented by a circle. The numbers on each circle are the amount of confirmed homicides for that month.", 9, 46);
text("Scroll over each circle to see all the Chicago death locations per month (x2 - x5 represents multiple deaths per location).", 9, 66);
//Click Fill
fill(111, 14, 22, 40);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 50, width, 50);
line(0, 70, width, 70);
}
else {
stroke(167, 0, 0);
//Rollover Fill Below
fill(204, 0, 0, 99);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 232, width, 232);
textFont(font3, 14);
text("Austin x3, Chatham x2, Englewood x1, Gage Park x1, Humboldt Park x1, Lower West Side x1, Near South Side x1, Portage Park x1,", 8, 230);
line(0, 252, width, 252);
textFont(font3, 14);
text("South Lawndale x1, Washington Heights x1, West Englewood x1.", 8, 250);
stroke(167, 0, 0);
}
}
else {
//Circle Fill Below
fill(92, 184, 252, 95);
}
ellipse(circleX2, circleY2, 28, 28);
 
println(dist(circleX3, circleY3, mouseX, mouseY) + "radius:" +100);
//rollover state
if (dist(circleX3, circleY3, mouseX, mouseY)<30) {
if (mousePressed==true) {
stroke(167, 0, 0);
fill(#5CB8FC);
textFont(font3, 14);
text("Legend: Each month is represented by a circle. The numbers on each circle are the amount of confirmed homicides for that month.", 9, 46);
text("Scroll over each circle to see all the Chicago death locations per month (x2 - x5 represents multiple deaths per location).", 9, 66);
//Click Fill
fill(111, 14, 22, 40);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 50, width, 50);
line(0, 70, width, 70);
}
else {
stroke(167, 0, 0);
//Rollover Fill Below
fill(204, 0, 0, 99);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 232, width, 232);
textFont(font3, 14);
text("Albany Park x1, Ashburn x1, Auburn Gresham x1, Chatham x1, East Garfield Park x1, Gage Park x1, Grand Blvd x1, Hegewisch x1,", 8, 230);
line(0, 252, width, 252);
textFont(font3, 14);
text("Humboldt Park x1, Logan Square x1, Morgan Park x1, Near West Side x1, Roseland x2, South Lawndale x1, South Shore x1, Woodlawn x1.", 8, 250);
stroke(167, 0, 0);
}
}
else {
//Circle Fill Below
fill(92, 184, 252, 95);
}
ellipse(circleX3, circleY3, 35, 35);
 
println(dist(circleX4, circleY4, mouseX, mouseY) + "radius:" +100);
//rollover state
if (dist(circleX4, circleY4, mouseX, mouseY)<35) {
if (mousePressed==true) {
stroke(167, 0, 0);
fill(#5CB8FC);
textFont(font3, 14);
text("Legend: Each month is represented by a circle. The numbers on each circle are the amount of confirmed homicides for that month.", 9, 46);
text("Scroll over each circle to see all the Chicago death locations per month (x2 - x5 represents multiple deaths per location).", 9, 66);
//Click Fill
fill(111, 14, 22, 40);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 50, width, 50);
line(0, 70, width, 70);
}
else {
stroke(167, 0, 0);
//Rollover Fill Below
fill(204, 0, 0, 99);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 232, width, 232);
textFont(font3, 14);
text("Auburn Gresham x1, Austin x1, Chicago Lawn x1, Grand Blvd. x2, Greater Grand Crossing x1, Humboldt Park x1, Hyde park x1,", 8, 230);
line(0, 252, width, 252);
textFont(font3, 14);
text("Irving Park x2, Lower West Side x1, Near West Side x1, New City x1, Roseland x1, South Chicago x2, South Shore x1, Washington Heights x1,", 8, 250);
line(0, 272, width, 272);
textFont(font3, 14);
text("Washington Park x1, West Pullman x1, West Pullman x2, West Ridge x1, West Town x1.", 8, 270);
stroke(167, 0, 0);
}
}
else {
//Circle Fill Below
fill(92, 184, 252, 95);
}
ellipse(circleX4, circleY4, 48, 48);
 
println(dist(circleX5, circleY5, mouseX, mouseY) + "radius:" +100);
//rollover state
if (dist(circleX5, circleY5, mouseX, mouseY)<35) {
if (mousePressed==true) {
stroke(167, 0, 0);
fill(#5CB8FC);
textFont(font3, 14);
text("Legend: Each month is represented by a circle. The numbers on each circle are the amount of confirmed homicides for that month.", 9, 46);
text("Scroll over each circle to see all the Chicago death locations per month (x2 - x5 represents multiple deaths per location).", 9, 66);
//Click Fill
fill(111, 14, 22, 40);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 50, width, 50);
line(0, 70, width, 70);
}
else {
stroke(167, 0, 0);
//Rollover Fill Below
fill(204, 0, 0, 99);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 232, width, 232);
textFont(font3, 14);
text("Albany Park, Ashburn, Auburn Gresham x4, Austin x4, Avalon Park, Avondale, Belmont Cragin, Beverly, Chicago Lawn x2, Douglas,", 8, 230);
line(0, 252, width, 252);
textFont(font3, 14);
text("Englewood x5, Grand Boulevard, Greater Grand Crossing x2, Humboldt Park, Hyde Park, Lincoln Square, Morgan Park, Near North Side,", 8, 250);
line(0, 272, width, 272);
textFont(font3, 14);
text("New City, North Lawndale x3, Roseland x2, South Shore x5, Washington Heights, West Englewood, West Pullman x3.", 8, 270);
stroke(167, 0, 0);
}
}
else {
//Circle Fill Below
fill(92, 184, 252, 95);
}
ellipse(circleX5, circleY5, 90, 90);
 
println(dist(circleX6, circleY6, mouseX, mouseY) + "radius:" +100);
//rollover state
if (dist(circleX6, circleY6, mouseX, mouseY)<35) {
if (mousePressed==true) {
stroke(167, 0, 0);
fill(#5CB8FC);
textFont(font3, 14);
text("Legend: Each month is represented by a circle. The numbers on each circle are the amount of confirmed homicides for that month.", 9, 46);
text("Scroll over each circle to see all the Chicago death locations per month (x2 - x5 represents multiple deaths per location).", 9, 66);
//Click Fill
fill(111, 14, 22, 40);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 50, width, 50);
line(0, 70, width, 70);
}
else {
stroke(167, 0, 0);
//Rollover Fill Below
fill(204, 0, 0, 99);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 232, width, 232);
textFont(font3, 14);
text("Austin x4, Avalon Park, Avondale, Belmont Cragin, Brighton Park, Burnside, Chicago Lawn x2, Dunning, East Garfield Park,", 8, 230);
line(0, 252, width, 252);
textFont(font3, 14);
text("Englewood x4, Gage Park, Greater Grand Crossing x4, Humboldt Park, Mckinley Park, Near North Side,New City x4, Roseland,", 8, 250);
line(0, 272, width, 272);
textFont(font3, 14);
text("South Chicago, South Lawndale x2, South Shore x5, West Englewood, West Garfield Park x2, West Lawn, West Pullman, West Town.", 8, 270);
stroke(167, 0, 0);
}
}
else {
//Circle Fill Below
fill(92, 184, 252, 95);
}
ellipse(circleX6, circleY6, 86, 86);
 
println(dist(circleX7, circleY7, mouseX, mouseY) + "radius:" +100);
//rollover state
if (dist(circleX7, circleY7, mouseX, mouseY)<35) {
if (mousePressed==true) {
stroke(167, 0, 0);
fill(#5CB8FC);
textFont(font3, 14);
text("Legend: Each month is represented by a circle. The numbers on each circle are the amount of confirmed homicides for that month.", 9, 46);
text("Scroll over each circle to see all the Chicago death locations per month (x2 - x5 represents multiple deaths per location).", 9, 66);
//Click Fill
fill(111, 14, 22, 40);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 50, width, 50);
line(0, 70, width, 70);
}
else {
stroke(167, 30, 0);
//Rollover Fill Below
fill(204, 0, 0, 99);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 232, width, 232);
textFont(font3, 14);
text("Auburn Gresham x2, Austin x5, Chatham, Chicago Lawn, East Garfield Park x2, Englewood, Gage Park x2, Greater Grand Crossing x2,", 8, 230);
line(0, 252, width, 252);
textFont(font3, 14);
text("Humboldt Park x3, Logan Square, Near North Side, Near South Side, Near West Side, New City x5, North Lawndale x4, Riverdale,", 8, 250);
line(0, 272, width, 272);
textFont(font3, 14);
text("Rogers Park x2, Roseland x2, South Chicago x2, South Deering, South Shore x3, Washington Heights x2, West Englewood x3,", 8, 270);
stroke(167, 0, 0, 99);
line(0, 292, width, 292);
textFont(font3, 14);
text("West Garfield Park, West Pullman x2, Woodlawn.", 8, 290);
stroke(167, 0, 0);
}
}
else {
//Circle Fill Below
fill(92, 184, 252, 95);
}
ellipse(circleX7, circleY7, 106, 106);
 
println(dist(circleX8, circleY8, mouseX, mouseY) + "radius:" +100);
//rollover state
if (dist(circleX8, circleY8, mouseX, mouseY)<35) {
if (mousePressed==true) {
stroke(167, 0, 0);
fill(#5CB8FC);
textFont(font3, 14);
text("Legend: Each month is represented by a circle. The numbers on each circle are the amount of confirmed homicides for that month.", 9, 46);
text("Scroll over each circle to see all the Chicago death locations per month (x2 - x5 represents multiple deaths per location).", 9, 66);
//Click Fill
fill(111, 14, 22, 40);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 50, width, 50);
line(0, 70, width, 70);
}
else {
stroke(167, 0, 0);
//Rollover Fill Below
fill(204, 0, 0, 99);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 232, width, 232);
textFont(font3, 14);
text("Auburn Gresham, Austin x2, Avalon Park x2, Belmont Cragin, Bridgeport, Chatham, Chicago Lawn, Douglas x2, East Garfield Park x2,", 8, 230);
line(0, 252, width, 252);
textFont(font3, 14);
text("Englewood x3, Grand Boulevard, Greater Grand Crossing x2, Hermosa, Humboldt Park x2, Mckinley Park, Morgan Park x2, Near North Side,", 8, 250);
line(0, 272, width, 272);
textFont(font3, 14);
text("New City, North Lawndale x2, Portage Park, Rogers Park, Roseland, South Chicago x2, South Lawndale x2, South Shore x3, Uptown,", 8, 270);
stroke(167, 0, 0, 99);
line(0, 292, width, 292);
textFont(font3, 14);
text("Washington Heights x2, West Elsdon, West Englewood x3, West Garfield Park x2, West Pullman x4, Woodlawn.", 8, 290);
stroke(167, 0, 0);
}
}
else {
//Circle Fill Below
fill(92, 184, 252, 95);
}
ellipse(circleX8, circleY8, 107, 107);
 
println(dist(circleX9, circleY9, mouseX, mouseY) + "radius:" +100);
//rollover state
if (dist(circleX9, circleY9, mouseX, mouseY)<35) {
if (mousePressed==true) {
stroke(167, 0, 0);
fill(#5CB8FC);
textFont(font3, 14);
text("Legend: Each month is represented by a circle. The numbers on each circle are the amount of confirmed homicides for that month.", 9, 46);
text("Scroll over each circle to see all the Chicago death locations per month (x2 - x5 represents multiple deaths per location).", 9, 66);
//Click Fill
fill(111, 14, 22, 40);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 50, width, 50);
line(0, 70, width, 70);
}
else {
stroke(167, 0, 0);
//Rollover Fill Below
fill(204, 0, 0, 99);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 232, width, 232);
textFont(font3, 14);
text("Auburn Gresham x2, Austin, Avalon Park, Clearing, Douglas, Englewood x5, Gage Park, Garfield Ridge x2, Greater Grand Crossing x2,", 8, 230);
line(0, 252, width, 252);
textFont(font3, 14);
text("Humboldt Park x2, Lower West Side, Near West Side, North Lawndale, Riverdale, Roseland x2, South Chicago, South Deering,", 8, 250);
line(0, 272, width, 272);
textFont(font3, 14);
text("South Shore x3, Washington Park x3, West Englewood x2, West Garfield Park, West Lawn, West Pullman, West Town x2, Woodlawn x2.", 8, 270);
stroke(167, 0, 0);
}
}
else {
//Circle Fill Below
fill(92, 184, 252, 95);
}
ellipse(circleX9, circleY9, 84, 84);
 
println(dist(circleX10, circleY10, mouseX, mouseY) + "radius:" +100);
//rollover state
if (dist(circleX10, circleY10, mouseX, mouseY)<35) {
if (mousePressed==true) {
stroke(167, 0, 0);
fill(#5CB8FC);
textFont(font3, 14);
text("Legend: Each month is represented by a circle. The numbers on each circle are the amount of confirmed homicides for that month.", 9, 46);
text("Scroll over each circle to see all the Chicago death locations per month (x2 - x5 represents multiple deaths per location).", 9, 66);
//Click Fill
fill(111, 14, 22, 40);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 50, width, 50);
line(0, 70, width, 70);
}
else {
stroke(167, 0, 0);
//Rollover Fill Below
fill(204, 0, 0, 99);
textSize(14);
stroke(167, 0, 0, 99);
line(0, 232, width, 232);
textFont(font3, 14);
text("Albany Park, Auburn Gresham x3, Austin x3, Chatham x3, Edgewater, Humboldt Park, Kenwood, Logan Square, Near West Side x2,", 8, 230);
line(0, 252, width, 252);
textFont(font3, 14);
text("North Center, North Lawndale, Roseland x3, South Shore x4, Washington Heights, West Englewood, West Garfield Park,", 8, 250);
line(0, 272, width, 272);
textFont(font3, 14);
text("West Pullman x2, West Town.", 8, 270);
stroke(167, 0, 0);
}
}
else {
//Circle Fill Below
fill(92, 184, 252, 95);
}
ellipse(circleX10, circleY10, 60, 60);
}
