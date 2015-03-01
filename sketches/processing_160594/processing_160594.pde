
Pimage landscape; 
float speed = 1.6;
float myimage; 
void setup () {

size(400,400); 
landscape= loadImage("http://kathyhofmann.files.wordpress.com/2013/01/copy-kathy-hofmann_koskonong-creek_11x11_200711.jpg");
}
void draw() { 
myimage=myimage+speed ;
image(landscape,0,myimage); 
if (myimage > 100) {myimage=-10;
}
float base = height * 0.75;
float scalar = 0.8; // Different for each font

textSize(32);  // Set initial text size
float a = textAscent() * scalar;  // Calc ascent
line(0, base-a, width, base-a);
text("Land", 0, base);  // Draw text on baseline

textSize(64);  // Increase text size
a = textAscent() * scalar;  // Recalc ascent
line(40, base-a, width, base-a);
text("scape", 80, base);  // Draw text on baselin}
}
