

// populations from:
// http://www.undiscoveredscotland.co.uk/usscotfax/geography/townscities.html


String[] location = {
  "Glasgow",
  "Edinburgh",
  "Aberdeen",
  "Dundee",
  "Paisley",
  "East Kilbride",
  "Livingston",
  "Cumbernauld",
  "Hamilton",
  "Kirkcaldy",
  "Dunfermline",
  "Ayr",
  "Perth",
  "Kilmarnock",
  "Inverness",
  "Greenock",
  "Coatbridge",
  "Glenrothes",
  "Airdrie",
  "Falkirk",
  "Stirling",
  "Irvine",
  "Rutherglen",
  "Dumfries",
  "Motherwell"
};

int [] population = {
  581320,
  454280,
  183030,
  142070,
  74100,
  73200,
  54740,
  50480,
  48900,
  48630,
  46430,
  46070,
  44820,
  44390,
  44220,
  43130,
  42000,
  38750,
  35500,
  34570,
  33710,
  32920,
  31700,
  31610,
  31180
};

int y = 10;     // start position of the bars
float w;        // width of the bars


void setup(){
  
  size(1000,900);
  background(255);

  // check the data is contained properly
  for(int i=0; i<population.length; i++){
    println(location[i] + " - " + population[i]);
  }
  
  int y = 20;    // y position of first bar
  
  // draw the bars
  for(int i=0; i<population.length; i++){
    // when mapping, use slightly higher than maximum
    // this means the bar will not go all the way to the right side
    w = map(population[i], 31180,581400,0,height - 50);
    fill(0);
    rect(0,y,w,20);
    
    // labels
    fill(255,0,0);
    text(location[i], 10, y+15);
    
    y+=30;  // increment to move the bars down the screen
  }
  
}


void draw(){
  
}


