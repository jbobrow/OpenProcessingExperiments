
//Graphs by Nathan Palmer

//Favorite Types of Pie:
    int a = 30; //People who like Apple pie?
    int b = 80; //People who like Pumpkin pie?
    int c = 100; //People who like Cocconut pie?
    int d = 20; //People who like Banana Cream pie?

//Favorite Types of Bars:
    int e = 50; //People who like Crunch Bars?
    int f = 10; //People who like Butterfingers?
    int g = 20; //People who like Twix Bars?
    int h = 90; //People who like Milky Way Bars?
    //Pie Chart Math
        int i = (e + f + g + h);
        int j = ((e * 360) / i);
        int k = ((f * 360) / i);
        int l = ((g * 360) / i);
        int m = ((h * 360) / i);
        int[] angles = { j, k, l, m};
        
void setup() {
  size(1200, 400);
  noStroke();
  noLoop();  // Run once and stop
}

void draw() {
  background(#30BAE3);
  
// Layout
    textSize(24);
    fill(#FFFFFF);
    text("Bar Chart of", 220, 60);
    textSize(32);
    fill(#FFFFFF);
    text("Favorite Types of Pie", 140, 90);
    
    fill(#FFFFFF);
    rect(600, 50, 5, 300, 7); // Verticle Page Rule
    
    textSize(24);
    fill(#FFFFFF);
    text("Pie Chart of", 850, 60);
    textSize(32);
    fill(#FFFFFF);
    text("Favorite Types of Bars", 750, 90);
    
    //Pie Chart Legend
      fill(#FFFFFF);
      rect(700, 150, 170, 150);
      textSize(18);
      fill(#B8D8D9);
      text("Crunch", 705, 180);
      text((e* 100 / i)+"%", 825, 180);
      fill(#80E330);
      text("Butterfinger", 705, 210);
      text((f* 100 / i)+"%", 825, 210);
      fill(#6C208B);
      text("Twix", 705, 240);
      text((g* 100 / i)+"%", 825, 240);
      fill(#FFBB27);
      text("Milky Way", 705, 270);
      text((h* 100 / i)+"%", 825, 270);
    
// Bars
    fill(#B8D8D9); //Apple Pie
    rect(40, 300, 100, -a, 7);
    fill(#80E330); //Pumpkin Pie
    rect(160, 300, 100, -b, 7);
    fill(#6C208B); //Cocconut Pie
    rect(280, 300, 100, -c, 7);
    fill(#FFBB27); //Banana Cream Pie
    rect(400, 300, 100, -d, 7);
    
// Bar Lables
    textSize(18);
    fill(#FFFFFF);
    text("Apple", 40, 320);
    text(a, 80, 290 - a);
    textSize(18);
    fill(#FFFFFF);
    text("Pumpkin", 160, 320);
    text(b, 200, 290 - b);
    textSize(18);
    fill(#FFFFFF);
    text("Cocconut", 280, 320);
    text(c, 320, 290 - c);
    textSize(18);
    fill(#FFFFFF);
    text("Banana Cream", 400, 320);
    text(d, 440, 290 - d);
   
//Pie Slices
    fill(#B8D8D9);
    arc(1000, 225, 200, 200, radians (0), radians (j));
    fill(#80E330);
    arc(1000, 225, 200, 200, radians (j), radians (k+j)); 
    fill(#6C208B);
    arc(1000, 225, 200, 200, radians (k+j), radians (k+j+l));
    fill(#FFBB27); 
    arc(1000, 225, 200, 200, radians (k+j+l), radians (k+j+l+m+4));

}
