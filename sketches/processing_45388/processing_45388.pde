
import java.text.DecimalFormat;

Country[] countries;
Country countryMax;
final int GRAPH_TOP = 50;
final int GRAPH_BOTTOM = 550;
final int GRAPH_LEFT = 300;
final int GRAPH_RIGHT = 800;
final int GRAPH_MIN_SIZE = 5;
final int GRAPH_MAX_SIZE = 100;
public String viewInfo;
public String verticalAxis;
public String horizontalAxis;
public String sizeAxis;

PFont viewFont;
PFont labelFont;

void setup() {
  countries = new Country[10];
  populateCountries(); //Put at bottom of code to keep it out of the way.
  
  size(850, 600);
  viewFont = loadFont("ArialMT-14.vlw");
  labelFont = loadFont("ArialMT-20.vlw");
  viewInfo = "";
  verticalAxis = "Millitary Expenditures";
  horizontalAxis = "GDP";
  sizeAxis = "Population";
  drawInstructions();
}

void draw() {
  //Reset view info
  setViewInfo("");
  
  //Clear graph and redraw it
  noStroke();
  fill(75);
  rect(GRAPH_LEFT - GRAPH_TOP, 0, width - GRAPH_LEFT + GRAPH_TOP, height);
  stroke(0);
  line(GRAPH_LEFT, GRAPH_TOP, GRAPH_LEFT, GRAPH_BOTTOM);			//Vertical axis
  line(GRAPH_LEFT, GRAPH_BOTTOM, GRAPH_RIGHT, GRAPH_BOTTOM);			//Horizontal axis

  //Labels
  fill(255);
  textFont(labelFont);
  textAlign(LEFT, TOP);
  text(horizontalAxis, GRAPH_RIGHT - (GRAPH_RIGHT - GRAPH_LEFT)/2, GRAPH_BOTTOM + 10);
  
  //Rather hacky way to draw text sideways, but it works
  textAlign(CENTER, BOTTOM);
  translate(GRAPH_TOP - (GRAPH_TOP - GRAPH_BOTTOM)/2 - 10, GRAPH_LEFT);
  rotate(-PI/2);
  text(verticalAxis, 0, 0);
  text("0", - (GRAPH_BOTTOM - GRAPH_TOP)/2, 0);
  text(countryMax.getValueString(verticalAxis), (GRAPH_BOTTOM - GRAPH_TOP)/2, 0);
  resetMatrix();
  
  
  //Loop through each country
  for(Country country : countries) {
    //Calculate the position and size of each circle
    float y = map(country.millitaryExpenditures, 0, countryMax.millitaryExpenditures, GRAPH_BOTTOM, GRAPH_TOP);
    float x = map(country.GDP, 0, countryMax.GDP, GRAPH_LEFT, GRAPH_RIGHT);
    float s = map(country.population, 0, countryMax.population, GRAPH_MIN_SIZE, GRAPH_MAX_SIZE);
    //Set the new position and size
    country.setPosition(x, y);
    country.setSize(s);
    country.display();
    
    //Get info for display
    if (country.isTouching(mouseX, mouseY)) {
      //println("Touching " + country.name);
      setViewInfo("Name: " + country.name + "\n" +
                  "Population: " + country.population + "\n" +
                  "Pop. Density: " + country.populationDensity + "/km^2\n" +
                  "Pop. Growth: " + country.populationGrowthRate + "%\n" +
                  "GDP: US$" + country.GDP + "\n" +
                  "Troops: " + country.troops + "\n" +
                  "Millitary: US$" + country.millitaryExpenditures + "\n" +
                  "Health: US$" + country.healthCareExpenditures + "\n" +
                  "Area: " + country.area + "km^2\n");
    }
  }
  //Update display
  drawView();
}

void keyPressed() {
  if (key == CODED) {
    if (key == LEFT) {
      
    } else if (key == RIGHT) {
      
    } else if (key == UP) {
      
    } else if (key == DOWN) {
      
    }
  }
}

public void setViewInfo(String info) {
  viewInfo = info;
}

public void drawView() {
  noStroke();
  fill(74);
  rect(25, height - 200 - 25, GRAPH_LEFT - GRAPH_TOP - 50, 200);
  fill(255);
  textFont(viewFont);
  textAlign(LEFT, TOP);
  text(viewInfo, 30, height - 200 - 25);
}

public void drawInstructions() {
  noStroke();
  fill(74);
  rect(25, height - 200 - 25, GRAPH_LEFT - GRAPH_TOP - 50, 200);
  fill(255);
  textFont(viewFont);
  textAlign(LEFT, TOP);
  text(viewInfo, 30, height - 200 - 25);
}

class Country {
  //Will set up accessors and make private when i have time
  public String name;				//All below
  public int population;			//http://en.wikipedia.org/wiki/List_of_countries_by_population
  public int populationDensity;			//Calculate from population & area, but also available at http://en.wikipedia.org/wiki/List_of_countries_by_population_density
  public float populationGrowthRate;		//http://en.wikipedia.org/wiki/List_of_countries_by_population_growth_rate
  public long GDP;				//http://en.wikipedia.org/wiki/List_of_countries_by_GDP_(nominal)
  public int troops;				//http://en.wikipedia.org/wiki/List_of_countries_by_number_of_troops
  public long millitaryExpenditures;		//http://en.wikipedia.org/wiki/List_of_countries_by_military_expenditures
  public long healthCareExpenditures;		//http://en.wikipedia.org/wiki/List_of_countries_by_health_care_expenditures
  public int area;				//http://en.wikipedia.org/wiki/List_of_countries_by_area
  public float x;
  public float y;
  public float diameter;
  public float radius;
  public color colour;

  public Country(String name, int population, int populationDensity, float populationGrowthRate, long GDP, int troops, long millitaryExpenditures, long healthCareExpenditures, int area, color colour) {
    this.name = name;
    this.population = population;
    this.populationDensity = populationDensity;
    this.populationGrowthRate = populationGrowthRate;
    this.GDP = GDP;
    this.troops = troops;
    this.millitaryExpenditures = millitaryExpenditures;
    this.healthCareExpenditures = healthCareExpenditures;
    this.area = area;
    this.colour = colour;
  }
  
  //Yes, this is a mess, I know, but it's late and it works (I hope)
  public String getValueStringFormatted(String key) {
    DecimalFormat f = new DecimalFormat("###,###,###,###,###,##0.##");
    if (key == "Name") {
      return name;
    } else if (key == "Population") {
      return f.format(population);
    } else if (key == "Population Density") {
      return f.format(populationDensity) + "/km^2";
    } else if (key == "Population Growth Rate") {
      return f.format(populationGrowthRate) + "%";
    } else if (key == "GDP") {
      return "US$" + f.format(GDP);
    } else if (key == "Troops") {
      return f.format(troops);
    } else if (key == "Millitary Expenditures") {
      return "US$" + f.format(millitaryExpenditures);
    } else if (key == "Healthcare Expenditures") {
      return "US$" + f.format(healthCareExpenditures);
    } else if (key == "Area") {
      return f.format(area) + "km^2";
    } else {
      return "Ah bugger...";
    }
  }
  
  //Yes, this is a mess, I know, but it's late and it works (I hope)
  public String getValueString(String key) {
    if (key == "Name") {
      return name;
    } else if (key == "Population") {
      return Integer.toString(population);
    } else if (key == "Population Density") {
      return Integer.toString(populationDensity);
    } else if (key == "Population Growth Rate") {
      return Float.toString(populationGrowthRate);
    } else if (key == "GDP") {
      return Long.toString(GDP);
    } else if (key == "Troops") {
      return Integer.toString(troops);
    } else if (key == "Millitary Expenditures") {
      return Long.toString(millitaryExpenditures);
    } else if (key == "Healthcare Expenditures") {
      return Long.toString(healthCareExpenditures);
    } else if (key == "Area") {
      return Integer.toString(area);
    } else {
      return "Ah bugger...";
    }
  }
  
  public void setPosition(float x, float y) {
    //If passed position = -1, keep current position
    this.x = (x == -1 ? this.x : x);
    this.y = (y == -1 ? this.y : y);
  }
  
  public void setSize(float diameter) {
    this.diameter = diameter;
    this.radius = diameter/2;
  }
  
  public void display() {
    noStroke();
    fill(colour, 128);
    ellipse(x, y, diameter, diameter);
  }
  
  public boolean isTouching(int mX, int mY) {
    if (mX >= x - radius &&
        mX <= x + radius &&
        mY >= y - radius &&
        mY <= y + radius) {
      return true;
    } else {
      return false;
    }
  }
  
  //Simple debug function to print out all data
  public void printAll() {
    println("Name:			" + name);
    println("Population:		" + population);
    println("Population Density:		" + populationDensity);
    println("Population Growth Rate:	" + populationGrowthRate);
    println("GDP:			" + GDP);
    println("Troops:			" + troops);
    println("Millitary Expenditures:	" + millitaryExpenditures);
    println("Health Care Expenditures:	" + healthCareExpenditures);
    println("Area:			" + area);
  }
}

//Temp values until I hack together a scraper or find a nicely formatted list
void populateCountries() {
  String[] name = {	"Belgium",
			"Brazil",
			"China",
			"France",
			"Japan",
			"Luxembourg",
			"North Korea",
			"South Korea",
			"United Kingdom",
  			"USA"};
  int[] population = {	10839905,		//Order may be wrong :/
			190755799,
			1339724852,
			65821885,
			127720000,
			511840,
			24052231,
			48219000,
			62300000,
			312566000};
  float[] populationGrowth = {	0.09,
				1.2,
				0.47,
				0.56,
				-0.19,
				1.17,
				0.42,
				0.27,
				0.47,
				0.98};
  long[] GDP = {	467779000000L,			//USD
			2090314000000L,
			5878257000000L,
			2562742000000L,
			5458797000000L,
			55195000000L,
			28000000000L,
			1014482000000L,
			2250209000000L,
			14526550000000L};
  int[] troops = {	40492,			//Total (active + reserve + paramilitary)
			1667710,
			4585000,
			469461,
			284350,
			1512,
			9495000,
			8691500,
			410180,
			3049790};
  long[] militaryExpenditures = {4544000000L,			//Total (active + reserve + paramilitary)
				27120000000L,
				114000000000L,
				61285000000L,
				51420000000L,
				301000000L,
				0L,				//Not reported
				26550000000L,
				57424000000L,
				698105000000L};
  float[] healthExpenditures = {11.1,				//Percentage of GDP - must calculate based on that
				8.4,
				4.3,
				11.2,
				8.3,
				6.8,
				0,				//Not reported
				6.5,
				8.7,
				15.2};
  int[] area = {	30528,			//total (land + water) in km^2
			8514877,
			9596961,
			643801,
			377915,
			2586,
			120538,				//Not reported
			99720,
			243610,
			9826675};
  color[] colour = {	color(255,120,0),
			color(0,200,0),
			color(255,0,0),
			color(100,0,255),
			color(255,120,120),
			color(120,120,255),
			color(255,0,200),
			color(255,120,200),
			color(0,0,255),
			color(255,0,100)};
  
  //No properties can be less than zero, so set max to zero to begin with
  int maxPop = 0;
  int maxPopDen = 0;
  float maxPopGrowth = 0;
  long maxGDP = 0;
  int maxTroops = 0;
  long maxMilExp = 0;
  long maxHealthExp = 0;
  int maxArea = 0;
  
  for(int i = 0; i < countries.length; i++) {
    countries[i] = new Country(	name[i],
				population[i],
				population[i]/area[i],
				populationGrowth[i],
				GDP[i],
				troops[i],
				militaryExpenditures[i],
				(long)((GDP[i] / 100) * healthExpenditures[i]),
				area[i],
				colour[i]);
    //Get maximum values
    if (population[i] > maxPop) maxPop = population[i];
    if (countries[i].populationDensity > maxPopDen) maxPopDen = countries[i].populationDensity;
    if (populationGrowth[i] > maxPopGrowth) maxPopGrowth = populationGrowth[i];
    if (GDP[i] > maxGDP) maxGDP = GDP[i];
    if (troops[i] > maxTroops) maxTroops = troops[i];
    if (militaryExpenditures[i] > maxMilExp) maxMilExp = militaryExpenditures[i];
    if (countries[i].healthCareExpenditures > maxHealthExp) maxHealthExp = countries[i].healthCareExpenditures;
    if (area[i] > maxArea) maxArea = area[i];
  }
  countryMax = new Country("MAX", maxPop, maxPopDen, maxPopGrowth, maxGDP, maxTroops, maxMilExp, maxHealthExp, maxArea, color(0));
}

