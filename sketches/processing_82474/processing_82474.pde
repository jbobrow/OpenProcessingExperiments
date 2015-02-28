
PFont f; 

String[] Country = {
"US",
"Australia",
"Japan:",
"Mexico:",
"Norway:",
"India:",
"Mozambique:",
"Cambodia:",
"Ghana:",
"Kenya:",
"Rawanda:",
"Angola:",
"Burkina Foso:",
"Phillipines:",
"UK:",
};
 
float[] waterconsumption = {
575,
500,
375,
366,
301,
135,
4,
15,
36,
46,
15,
15,
27,
164,
149,
};
 

 
void setup() {
size(600, 700);
background(153, 204, 255);
f= loadFont("AmericanTypewriter-48.vlw"); 
textAlign (CENTER); 
text ("Water consumption in Liters person/day", 300, 640); 
text ("US", 15, 620); 
text ("Australia", 68, 540); 
text ("Japan", 100, 405); 
text ("Mexico", 140, 395);
text ("Norway", 184, 325); 
text ("India", 216, 152); 
text ("Mozambique", 263, 13); 
text ("Cambodia", 280, 30); 
text ("Ghana", 330, 46);
text ("Kenya", 380, 56); 
text ("Rwanda", 413, 25); 
text ("Angola", 458, 25);
text ("Burkina Faso", 480, 37);
text ("Phillippines", 510, 180); 
text ("UK", 572, 165); 
}
 
void draw() {
int x=0;
for (int i=0;i<15;i++) {
if (mouseX>x && mouseX<=x+40) {
fill((#1B3CDB), (#148E1D), (110), 10);
}
else {
fill(#1B3CDB);
}
 
float h = map(waterconsumption[i], 4, 575, 0, 600);
 
rect(x+4,0, 25, h);
 
x+=40;
}
}

