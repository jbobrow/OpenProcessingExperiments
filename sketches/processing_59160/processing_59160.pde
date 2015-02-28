
size(500,700);
background(150);
stroke(255);
noFill();
smooth();
strokeWeight(4);
triangle(50,20,450,20,250,300);
fill(255);
triangle(130,50,180,50,155,100);
triangle(320,50,370,50,345,100);
rect(200,200,100,200);
line(200,400,150,500);
line(300,400,350,500);
fill(0, 102, 153);
print("hallo");
PFont font;
// The font must be located in the sketch's 
// "data" directory to load successfully
font = loadFont("LydianBT-Bold-48.vlw"); 
textFont(font, 75);
text("h a l l o", 150,600);
textFont(font, 400);
text("!", 190,500);

/* programmkommentare */

