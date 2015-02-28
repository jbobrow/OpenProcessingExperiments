
int[] dates = {1919, 1940, 1975, 1976, 1990};
String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday"};
int[] data = new int[18];


void setup() {
  
    size(800,600);
    colorMode(HSB, width, height, 100, 255);
    background(0);
    smooth();
    
    
        for (int i = 0; i < dates.length; i++) {
          print(days[i] + " in the year of ");
          println(dates[i] + ".");
        }
    
}

void draw() {
  
  
    fill(0,20);
    rect(0,0,width,height);
    
    translate(400, 0);

    
    for(int i = 0; i < data.length; i++) {
       for(int j = 0; j < height; j+=20) {
         fill(mouseY,mouseX,100,40);
//         fill(int(random(width)),mouseX,100,60);
         data[i] = int(random(1,3));
         noStroke();
         int xpos = int(random(-width/2,width/2));
         ellipse(xpos, j, i, i);
         strokeWeight(0.3);
         stroke(0, 0, 100, 255);
         ellipse(xpos, j, i/2, i/2);
       }
    }
    
    if (mousePressed) {
      saveFrame("starstruck-####.tif");
    }
}

