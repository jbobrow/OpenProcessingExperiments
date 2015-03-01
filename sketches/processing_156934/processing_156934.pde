
int[] years = {1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999};
int[] babies = {9, 14, 10, 6, 0, 1, 4, 7, 2, 16};
int i;

void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  
  text("Number of Babies per year!", 225, 75);
  
  for(i=0; i < years.length; i++) {
    //println(years[i] + ": " + babies[i] + " babies!");


    
    noStroke();
    fill(255, 0, 0);
    rect(150, (25*i+100), (25 * babies[i]), 10);
    
    fill(0);
    text(years[i], 90, (25*i+110));

    stroke(200);
    line(i * 50 + 150, 100, i * 50 + 150, 340);
  
    text("0", 147, 360);
    text("2", 197, 360);
    text("4", 247, 360);
    text("6", 297, 360);
    text("8", 347, 360);
    text("10", 394, 360);
    text("12", 444, 360);
    text("14", 494, 360);
    text("16", 507, 360);
  }
  
}


