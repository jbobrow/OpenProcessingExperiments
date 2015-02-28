
//my program
//by Christine Kim
//reference website: http://voices.yahoo.com/10-interesting-facts-coffee-275935.html
//http://abcnews.go.com/GMA/american-coffee-habits-spend-coffee/story?id=16923079#.UFq0-dD-_Ns
//http://www.e-importz.com/Support/specialty_coffee.htm
//http://www.abc2news.com/dpp/news/national/who-drinks-the-most-coffee-wcpo1285764032246
//http://www.statisticbrain.com/coffee-drinking-statistics/

//
void setup(){
  size(500,300);
  smooth();
}

//draw runs 60fps
void draw(){
background(255,249,198);
noStroke();
fill(121,97,72);
ellipse(35,34,30,12);
fill(252);
ellipse(35,34,33,15);
rect(20,33,32,30);
ellipse(35,60,33,15);
fill(121,97,72);
textSize(40);
text("COFFEE IN AMERICA", 71,65); 
fill(143,175,39);
rect(22,102,600,80);
fill(252);
beginShape(TRIANGLES);
vertex(26, 127);
vertex(33, 115);
vertex(39, 127);
endShape();
beginShape();
vertex(26, 132);
vertex(38, 132);
vertex(38, 144);
vertex(26, 144);
endShape(CLOSE);
textSize(15);
text(" NY Drinks 6.7 times more coffee than any other cities in US", 38, 127); 
text("Nurses drink the Most coffee", 42, 144); 
stroke(153);
beginShape(LINES);
vertex(20, 190);
vertex(600, 190);
endShape();
beginShape(TRIANGLES);
vertex(26, 164);
vertex(33, 147);
vertex(39, 164);
endShape();
text("54% of Americans drink coffee everyday", 39, 164); 
fill(121,97,72);
ellipse(35,34,30,12);
noStroke();
fill(211,240,140);
ellipse(100,245,82,82);
textSize(10);
fill(85,137,41);
text("Spends",84,245);
text(" $14.40/week",67,255);
noStroke();
fill(211,240,140);
ellipse(200,245,82,82);
textSize(10);
fill(85,137,41);
text("Spends",183,245);
text(" $164.71/year",170,255);
noStroke();
fill(211,240,140);
ellipse(300,245,82,82);
textSize(10);
fill(85,137,41);
text("Average cup ",266,245);
text("Size 9oz",280,255);
noStroke();
fill(211,240,140);
ellipse(400,245,82,82);
textSize(10);
fill(85,137,41);
text("35% prefer ",373,245);
text("black coffee",370,255);





println("x: " + mouseX  + " y: " + mouseY); 
}


