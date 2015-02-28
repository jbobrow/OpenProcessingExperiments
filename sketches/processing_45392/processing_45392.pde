
String[] country =

{

"United Kingdom:", 

"Indonesia:", 

"India:", 

"United States:", 

"Turkey:", 

"Brazil:", 

"Mexico:", 

"Philippeans", 

"France:", 

"Germany:",
};

int[] facebookUsers = {

155981460,

40829720, 

38045000, 

38045000, 

30473280, 

30453260, 

30121400, 

26752000, 

23248340, 

21634380,
};

void setup() {

size(500, 500);
background(21,62,126);
}

void draw() {

int x=0;

for (int i=0;i<10;i++) {

if (mouseX>x && mouseX<=x+40) {

fill(224,255,255);

text(country[i], 100, 100);

fill(128, 5, 23);

}
else {

fill(224, 255, 255);
}

float h = map(facebookUsers[i], 100000, 134000000, 0, 400);

rect(x+4, height-h, 32, h);

x+=40;

}
}

