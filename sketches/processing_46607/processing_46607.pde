
// data visualisation for cooking
// matching calories with quantities of a certain type of food

String lines[];
PFont font;

String food[], units[];
int amount[];
float calories[];
int[] daily;

int selectedFood = 0, start = 0, dailyCalories = 2000;

color[] circlecolour = { #ECD078, #D95B43, #C02942, #542437, #53777A, #ECD078, #D95B43, #C02942, #542437, #53777A };

// Array: 0 Food / 1 Units / 2 Amount / 3 Calories


void setup() {
	size(700, 700);
	smooth();
	noStroke();
	//noLoop();
	font = loadFont("Aller-Regular-13.vlw");
	textFont(font, 13);
	
	lines = loadStrings("nutrients.csv");
  	 	
	food = new String[lines.length];
	units = new String[lines.length];
	amount = new int[lines.length];
	calories = new float[lines.length];
	
	daily = new int[0];

	for(int i = 1; i<lines.length; i++){
		String thisline[] = split(lines[i], ",");
				
		// remove 1 to i each time to cancel the CSV header		
		
		food[i-1] = thisline[0];
		units[i-1] = thisline[1];
		amount[i-1] = int(thisline[2]);
		calories[i-1] = float(thisline[3]);
	}
}

void draw() {
	background(25);
	
	
	// Draw the list for all items
		
	for(int j = 0; j < lines.length; j++) {
		// Highlight the current item in red
		if(selectedFood == j) fill(230, 0, 0);
		else fill (255);
		
		text(food[j] + " ", 20, 20 * j+120 + (selectedFood * 20)*(-1));
	}
	
	
	// Write the text for the currently selected item
	
	fill(255);
	text(char(0x21D2) + " " + amount[selectedFood] + " " + units[selectedFood] + " makes " + floor(calories[selectedFood]) + " calories", 230, 120);
	
	
	
	// Draw the circles
	noStroke();
	
	int caloriesStack = 0;
	
	for(int i = 0; i < daily.length; i++) {
		fill(circlecolour[i], 40);
		
		float mapX = map(calories[daily[i]] + caloriesStack, 10, dailyCalories, 10, 300);
		ellipse(460, 290, mapX, mapX);
		
		caloriesStack += calories[daily[i]];
	}


	// Draw the outer circle (limit)
	noFill();
	stroke(255);
	ellipse(460, 290, 300, 300);
	
	
	
	// Draw the selected daily items List
	
	for(int k = 0; k < daily.length; k++) {
		fill(circlecolour[k]);
		text(amount[daily[k]] + " " + units[daily[k]] + " of " + food[daily[k]] + " = " + floor(calories[daily[k]]) + " calories", 310, 460 + k*20);		
	}
	
	
	// Write the total number of calories
	// If it is over the daily limit, show it in red
	
	fill(255);
	line(310, 655, 500, 655);
	if(caloriesStack > dailyCalories) fill(255, 0, 0);
	text("TOTAL: " + caloriesStack + " calories out of your " + dailyCalories + " recommended intake", 310, 680);

	
	
	// Draw instructional text
	// at the top
	
	noStroke();
	fill(40, 240);
	rect(0, 0, width, 95);
	fill(255);
	text("Use the " + char(0x2191) + " and " + char(0x2193) + " arrows to choose a product\nHit Enter/Return to add the selected product to your daily list, Backspace to delete the last item\nUse the " + char(0x2190) + " and " + char(0x2192) + " arrows to change your daily calories need (average for women: 1940, for men: 2550)", 20, 30);

}

void keyPressed() {

	// Move in the list

	if(keyCode == 38 && selectedFood > 0)
		selectedFood--;
		
	if(keyCode == 40)
		selectedFood++;
		
	
	
	// Change the personal daily calories needs
	
	if(keyCode == 39 && dailyCalories < 6000)
		dailyCalories += 50;
		
	if(keyCode == 37 && dailyCalories > 200)
		dailyCalories -= 50;
		
		
		
		
	// Add or delete an item to/from the list

	if((keyCode == ENTER || keyCode == RETURN) && daily.length < 10)
		daily = append(daily, selectedFood);
	
	if(keyCode == BACKSPACE && daily.length > 0)
		daily = shorten(daily);
}

