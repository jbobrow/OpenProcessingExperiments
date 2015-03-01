
XML xml;

PFont labels;

int d = width/2;
int y = height/2;
int w = 180;
int h = 180;
int l = 63;
// float r = 180;

int biller = #66ff99;
int einstein = #9966ff;
int third = #D44D31;

// color inside = color(204, 102, 0);
// color middle = color(204, 153, 0);
// color outside = color(153, 51, 0);

void setup() {

size(1000, 800, P2D);
background(#333333);
noLoop();
labels = createFont("Helvetica", 12, true);
textLeading(10);
smooth(8);	

xml = loadXML("data/arcs.xml");

}

void draw() {
	plot();
	arcText();
	
}

void plot() {


	XML [] children = xml.getChildren("task");

	for (int i = 0; i < children.length; i++) {

		// String name = children[i].getContent();

		
		float roles = children[i].getFloat("roles");

		
		float start = children[i].getFloat("start"); 

	 	
	 	int coloring = children[i].getInt("system");
		// color name = children[i].getInt("system");

		// noFill();
		// noStroke();
		// ellipse(0,0,r*2,r*2);

		// float arclength = 0;

		// char currentChar = children.charAt(i);
		// float z = textWidth(currentChar);

		// //Each box is centered so we move half the width
		// arclength += z/2;
		// //Angle in the radians is the arclength divided by the radius
		// float theta = PI + arclength/r;


	// pushMatrix();
	
	// popMatrix();

pushMatrix();
	translate(width/2,height/2);
	if ((coloring) < 5) {
		stroke(#A66189);
	} else if ((coloring) < 15) {
		stroke(#5D882B);
	} else {
		stroke(third);
	}
	// Thick arc on perimeter
	// stroke(coloring);
	noFill();
	// fill(coloring);
	strokeWeight(20);
	strokeCap(ROUND);
	arc(d, y, (w), (h), (PI*start), (PI*roles));
popMatrix();



// pushMatrix();
// 	translate(width/2,height/2);
// 	fill(0);
// 	textFont(labels);
// 	text(name, (l + 10), (l));
// popMatrix();



w += 55;
h += 55;


	
}

}

void arcText () {

	XML [] children = xml.getChildren("task");

	for (int i = 0; i < children.length; i++) {

		String name = children[i].getContent();

	 	
	 	int coloring = children[i].getInt("system");
		// color name = children[i].getInt("system");

pushMatrix();
	translate(width/2,height/2);
		noStroke();

	if ((coloring) < 5) {
		fill(#A66189);
	} else if ((coloring) < 15) {
		fill(#5D882B);
	} else {
		fill(#D44D31);
	}
	rect(l-6, l-13, 250, 18,7);


	fill(255,255,255);
	ellipse((l+4), (l-4), 7, 7);

	fill(#ffffff);
	textFont(labels);
	text(name, (l + 12), (l));


popMatrix();

l += 20;

// arclength += z/2;




}

}















