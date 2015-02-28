
// Data about legality of homosexuality
// in various countries as of 2011

// Extracted from: http://old.ilga.org/Statehomophobia/ILGA_State_Sponsored_Homophobia_2011.pdf

String countriesDPenalty[] = { "Mauritania", "Sudan", "Nigeria (in 12 states)", "Somalia (southern parts)", "Iran", "Saudi Arabia, Yemen" };

String countriesIllegal[] = { "Algeria", "Angola", "Botswana", "Burundi", "Cameroon", "Comoros", "Egypt", "Eritrea", "Ethiopia", "Gambia", "Ghana", "Guinea", "Kenya", "Lesotho", "Liberia", "Libya", "Malawi", "Mauritania", "Mauritius", "Morocco", "Mozambique", "Namibia", "Nigeria", "São Tomé and Principe", "Senegal", "Seychelles", "Sierra Leone", "Somalia", "Sudan", "Swaziland", "Tanzania", "Togo", "Tunisia", "Uganda", "Zambia", "Zimbabwe", "Afghanistan", "Bangladesh", "Bhutan", "Brunei", "Some parts of Indonesia (South Sumatra and Aceh Province)", "Iran", "Kuwait", "Lebanon", "Malaysia", "Maldives", "Myanmar", "Oman", "Pakistan", "Qatar", "Saudi Arabia", "Singapore", "Sri Lanka", "Syria", "Turkish Republic of Northern Cyprus (internationally unrecognised)", "Turkmenistan", "United Arab Emirates", "Uzbekistan", "Yemen", "Occupied Palestinian Territory", "Antigua and Barbuda", "Barbados", "Belize", "Dominica", "Grenada", "Guyana", "Jamaica", "St Kitts & Nevis", "St Lucia", "St Vincent & the Grenadines", "Trinidad and Tobago", "Kiribati", "Nauru", "Palau", "Papua New Guinea", "Samoa", "Solomon Islands", "Tonga", "Tuvalu", "New Zealand associate of Cook Islands"};

String countriesUnclear[] = { "Bahrein", "Iraq" };

String countriesProtection[] = { "Botswana", "Cape Verde", "Mauritius", "Mozambique", "Seychelles", "Taiwan", "A few cities in Japan", "Albania", "Bosnia and Herzegovina", "Bulgaria", "Cyprus", "Estonia", "Georgia", "Greece", "Italy", "Kosovo", "Latvia", "Lithuania", "Malta", "Montenegro", "Poland", "Romania", "Serbia", "Slovakia", "United Kingdom", "Some parts of Brazil", "Costa Rica", "Nicaragua", "Venezuela", "Canada", "Some parts of the United States", "Fiji" };

String countriesPartRights[] = { "Andorra", "Croatia", "Czech Republic", "France", "Luxembourg", "Slovenia", "Ecuador", "Uruguay", "Some parts of Argentina", "Brazil", "Mexico", "United States", "Australia" };

String countriesCPartnership[] = { "Israel", "Austria", "Denmark", "Finland", "Germany", "Hungary", "Ireland", "Liechtenstein", "Switzerland", "United Kingdom", "Isle of Man", "Brazil", "Colombia", "some parts of the United States", "New Zealand", "Some parts of Australia" };

String countriesMarriage[] = { "South Africa", "Iceland", "Belgium", "Netherlands", "Norway", "Portugal", "Spain", "Sweden", "Argentina", "The Federal District in Mexico", "Canada" };


// Import the physics library
import fisica.*;

FWorld world;
//countryBall countryBall;

int ballCount = 160; // total number of countries
FCircle[] b = new FCircle[ballCount];

color displaycolour;
PFont fengardo;
String displaytext = "";

void setup() {
	size(600, 400);
	smooth();
	
	fengardo = loadFont("Fengardo-16.vlw");
	
	// Initialize the physics library

	Fisica.init(this);

	world = new FWorld();
	world.setEdges();
	world.setEdgesRestitution(0.0);
	
	
	// Fix bug where the applet would crash if the edges are hovered
	world.left.setName("");
  	world.right.setName("");
  	world.top.setName("");
  	world.bottom.setName("");
  	
	// Create sets and define colour range for each
  
	createSet(countriesDPenalty, 135, 7, 7, "Death penalty");
	createSet(countriesIllegal, 170, 55, 30, "Illegal, leads to prison or heavy fines");
	createSet(countriesUnclear, 110, 110, 110, "Unclear laws");
	createSet(countriesProtection, 45, 110, 205, "Has laws against discrimination on sexual orientation grounds");
	createSet(countriesPartRights, 26, 200, 157, "Has laws allowing some rights to gay people");
	createSet(countriesCPartnership, 26, 200, 90, "Has laws allowing most rights to gay people (ie. Civil Partnership)");
	createSet(countriesMarriage, 50, 206, 40, "Gay marriage is allowed");
}

void draw() {
	background(30);
	
	textFont(fengardo, 14);
	fill(0);
	text(displaytext, 20, 32);
	fill(displaycolour);
	text(displaytext, 20, 30);
	
	world.step();
	world.draw();
	

}

// Changes the text to display along

void mouseMoved() {
	FBody hovered = world.getBody(mouseX, mouseY);
	
	if(hovered != null) {
		displaytext = hovered.getName();
		displaycolour = hovered.getFillColor();
	}
	else
		displaytext = "";
}

// Creates each ball

void createSet(String[] countrylist, int colR, int colG, int colB, String definition) {

	for (int i=0; i < countrylist.length; i++) {
	  	b[i] = new FCircle(random(18, 30));
	  	b[i].setName(countrylist[i].toUpperCase() + " — " + definition);
	  	b[i].setPosition(random(30, width-30), height/(random(4, 8)));
		b[i].setNoStroke();
		b[i].setFill(colR, colG, colB);

		world.add(b[i]);
	}
}

