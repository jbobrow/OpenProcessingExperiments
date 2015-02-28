
String[] s = loadStrings("http://www.lse.co.uk/currency-converter.asp?sym=gbp&currency=pound_sterling");
String p = "";
Float number;
boolean real = false;

String typing = "";
float timer, start, totalTime;
int v = 0;

PImage bg;

public void setup()
{

size(600, 300);

bg = loadImage("euflag.png");
noLoop();

loop();
for (int i =0; i < s.length; i++) {
p += s[i];
}

String startMarker = "<td width=\"45%\">";
String endMarker = "</div>Euro</td>";

int start = p.indexOf(startMarker);


p = p.substring ( start + startMarker.length(), p.length());

int end = p.indexOf(endMarker);


String ss = p.substring(0, end);

String[] bits = ss.split(">");
println(bits[5]);
number = new Float(bits[5]);
println(number);
}


void draw()
{
image(bg, 0, 0, 600, 300);

text(typing, 280, 250);

start = 300;
timer += 1;
totalTime = timer;

float mx = map(number, 0, 3, 0, width);

fill(100);
strokeWeight(5);

line(50, 150, 550, 150);
line(50, 100, 50, 200);
line(550, 100, 550, 200);
noStroke();
smooth();

fill(254, 216, 93);
ellipse(mx, height/2, 40, 40);
fill(244, 164, 96);
strokeWeight(2);
ellipse(mx, height/2, 30, 30);
fill(255, 216, 0);
ellipse(mx, height/2, 28, 28);

fill(0);
text("€", mx-5, height/2+5);

text("Euro rate to the £", 250, 30);
fill(255);
text("current rate for £1 in euros: " + number, 200, 275);
real = true;
textSize(14);
strokeWeight(10);
//text("Enter a 3 digit number to convert:", 100, 250);
//text("Number Converted:", 320, 250);
demo();
}

void keyPressed() {
boolean finished = false;

// Otherwise, concatenate the String
// Each character typed by the user is added to the end of the String variable.
typing = typing + key; 

float f = Float.parseFloat(typing);

float total;
println(typing);
total = f * number;
println(total);

v++; 

if (v == 3) {

text(total, 450, 250);
}
}

public void demo()
{

if (totalTime > start) {

text ("DEMO", 50, 50);
frameRate(1);
boolean a = false;



for (int i = 0; i < 2; i++)
{
number = number + 0.2;
//number = 0f;
a = true;
}
if (number > 2.7) {
noLoop();

}

}

}

