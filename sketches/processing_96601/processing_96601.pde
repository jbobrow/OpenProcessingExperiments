
size(400,400);
background(0);
stroke(255,0,0);
float base = height * 0.75;
float scalar = 0.8; // Different for each font
String c = "oQq☻";
textSize(32);  // Set initial text size
float a = textDescent() * scalar;  // Calc ascent
line(0, base+a, width, base+a);
text(c, 0, base);  // Draw text on baseline

textSize(64);  // Increase text size
a = textDescent() * scalar;  // Recalc ascent
line(200, base+a, width, base+a);
text(c, 200, base);  // Draw text on baseline

base = height * 0.25;

textSize(128);  // Set initial text size
a = textDescent() * scalar;  // Calc ascent
stroke(0,255,0);
line(0, base+a, width, base+a);
stroke(0,0,255);
line(0,base,width,base);
text(c, 0, base);  // Draw text on baseline
