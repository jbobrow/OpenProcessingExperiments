
// Complexity, Randomness, Balance 
// Allison Etheredge
// 11 September 2011 

// Code of an inverted skyline shown in the winter
// Controlled Randomness allows for varying city skylines to be produced
// Each time the screen is reset 
// Orange Sky is common with city light pollution, reflecting off snow to create a glow
// Allows quick test to produce random skylines
// Continue playing until you find the one you like! 


void setup() { 
  size(600, 300);
  background(x); // See int x below - controls the background color
  frameRate(8); // Controls the rate in which the skyline is produced
}


float count = 0; // Starts the city on the left side of the screen - at 0 
float num = 30; // Controls the width and number of buildings in the skyline
int x = #D3350D - #FFDA03; // Controls the range of colors in the sky
int numOfSnow = 75; //Controls the number of snowballs - allows for heavy or light snow in the city


void draw() {  

  // Small Snowballs - random count of snowballs
  if (numOfSnow > 0) {
    noStroke(); 
    fill(255, 95); // White snowballs - 95% opacity
    ellipse(random(width), random(height), 3, 3);
    numOfSnow--; // Controls the number of snowballs produced - stops count at 75
  }

  // Moon - gets brighter as the city progresses
  fill(255, 5); 
  ellipse(80, 230, 50, 50); 
  fill(x); 
  ellipse(90, 230, 50, 50); 

  // Large Snowballs - random count of snowballs
  if (numOfSnow > 0) {
    noStroke(); 
    fill(255, 95); // White snowballs - 95% opacity
    ellipse(random(width), random(height), 6, 6);
    numOfSnow--; // Controls the number of snowballs produced - stops count at 75
  }

  // Conditional pattern counter loop top 1/4 of screen - low buildings
  if (count < num) { 
    if (count % 1 == 0) { 
      fill(0);  //Silhouette 
      rect(count * width/num, 0, width/num, random(height/4)*2); 
      rect(count * width/num, 0, width/num, random(height/4));
    }
  }
  
  // Conditional pattern counter loop top 3/4 of screen - skyscrapers
  if (count > 5 && count < 25) { // Keeps the 'skyscrapers' in the middle of the screen
    if (count % 1 == 0) { 
      fill(0);   //Silhouette 
      rect(count * width/num, 0, width/num, random(height/8)*7); 
      rect(count * width/num, 0, width/num, random(height/8)*6);
    }
  } 
  
  count++; // Increment the counter by one - Iportant for the skyline to evolve!
  // Without this only the first building will be produced
}


