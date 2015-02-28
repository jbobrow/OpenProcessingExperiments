
String lines[];
String[][][] items;
PImage[] illustration;
PFont font, fonttitle;
int selectedCategory = 0, selectedItem = 0;
String catnames[] = { "les animaux / Tieren", "les métiers / Arbeiten", "les hobbies / Hobbies", "les couleurs / Farben", "les pays / Ländern" };

// CSV header: category slug french german

void setup() {
	size(800, 600);
	smooth();
	background(255);
	noLoop();
	
	noStroke();
	
	fonttitle = loadFont("Garfield.vlw");
	font = loadFont("Clarendon.vlw");


	lines = loadStrings("items.csv");
	
	items = new String[5][0][10];
	illustration = new PImage[lines.length];

	// Count what category is currently processed
	// reset count to 0 everytime we change category
	int count = 0, currentcat = 0;

	for(int i = 0; i < lines.length; i++){
		String thisline[] = split(lines[i], ",");
		int cat;
		
		if (thisline[0].equals("animal"))
		    cat = 0;
		else if (thisline[0].equals("occupation"))
		    cat = 1;
		else if (thisline[0].equals("hobby"))
		    cat = 2;
		else if (thisline[0].equals("colour"))
		    cat = 3;
		else if (thisline[0].equals("country"))
		    cat = 4;		
		else {
			cat = 4;
			println("Unknown category: " + join(thisline, ", "));
		}
		
    	if(currentcat < cat) {
			count = 0;
			currentcat = cat;
		}
    	
		items[cat] = (String[][])expand(items[cat], items[cat].length + 1);
		    	
		items[cat][count] = thisline;
		items[cat][count] = append(items[cat][count], ""+i);
			
		illustration[i] = loadImage("img/" + thisline[0] + "-" + thisline[1] + ".png");
		
		count++;
		
	}
}

void draw() {
	background(255);
	fill(20);
	
	// Draw left/right triangles
	
	if(selectedItem >= 1) fill (0);
	else fill(200);
		triangle(20, height/2, 50, height/2-30, 50, height/2+30);
	
	if(selectedItem < items[selectedCategory].length - 1) fill (0);
	else fill(200);
	
	triangle(width-20, height/2, width-50, height/2-30, width-50, height/2+30);
	
	// Draw header
	fill(0);
	rect(0, 0, width, 65);
	fill(255);
	
	textFont(fonttitle); 
	textAlign(LEFT);
	text(catnames[selectedCategory], 50, 45);
	
	if(selectedCategory >= 1) fill (255);
	else fill(50);
	triangle(width-50, 20, width-60, 30, width-40, 30);
	
	if(selectedCategory < items.length - 1) fill (255);
	else fill(50);
	
	triangle(width-50, 45, width-60, 35, width-40, 35);
	
	int j = selectedItem;
	image(illustration[Integer.parseInt(items[selectedCategory][selectedItem][4])], width/2-200, 70);
	
	textFont(font); 
	
	textAlign(CENTER);
	fill(#ff5511);
	text(items[selectedCategory][j][2], width/2, 520);
	
	fill(#171bff);
	text(items[selectedCategory][j][3], width/2, 570);
	
	//println(items[selectedCategory].length);
}



///

void keyPressed() {

	// Change the selected category

	if(keyCode == 38 && selectedCategory > 0){
		selectedCategory--;
		selectedItem = 0;
	}		
	if(keyCode == 40 && selectedCategory < 4) {
		selectedCategory++;
		selectedItem = 0;
	}
	
	
	
	// Change the selected item
	
	if(keyCode == 39 && selectedItem < items[selectedCategory].length - 1)
		selectedItem++;
		
	if(keyCode == 37 && selectedItem > 0)
		selectedItem--;
		
	redraw();
}

