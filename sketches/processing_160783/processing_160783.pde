
void setup() {
  size (1000, 1000);
  background(#FAF5E8);
  colorMode(HSB, 360, 100, 100);
}

void draw() {

  int space = 50;  
  
  //this for loop draws ellipses across the x-axis before jumping to the next y-axis
  for (int y = 0; y < 100; y++) {

    for (int x = 0; x < 100; x++) {

      noStroke();
      //circles are drawn with a space of 50 above and below them
      ellipse(x*space, y*space, 20, 20);
      
        //row 3 and column y have black circles
        if ((x == 3) || (y == 3)) {
        fill(0,0,0);
        }
        
        //all other columns contain colored circles
        //these colors are randomly generated each time the program is run
        else {
        fill (random(360),100,100);
        }
      
    } 
    
  }

save("HirstEgo01.jpg");
stop(); 
  
}
