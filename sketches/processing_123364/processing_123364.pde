
String msg = "Happy Birthday Old Fart!";
float spacing;
color[] colours;

void setup() {
	size(800, 280);

        textSize(48);
	spacing = width / (msg.length() + 4);

	colours = new color[3];
	colours[0] = #e00000;
	colours[1] = #00e000;
	colours[2] = #0000e0;
}

void draw() {
	background(0);

	for(int c = 0; c < msg.length(); c++) {
		fill(colours[c % 3]);
		text(
			msg.charAt(c), 
			(c * spacing) + (2 * spacing), 
			(sin(radians(c * 30 + frameCount)) * 50) + (height / 2) 
		);
	}
}


