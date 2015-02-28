
//Iv Shqevi

//Drawing Machine

// this sketch was inspired by the color blind test

//Rule 1 Make ellipses of random height and width, between 100 and 200pixels, that vary in diameter that are skattered evenly around the page
//Rule 2 Fill the ellipses with a grayscale that is evenly dispersed thoughout the page by setting a ratio of 1/25 to each color 
//Rule 3 Create the same ellipse size variation only in a smaller scale
//Rule 4 Rotate these figures so that they form a circle; this circle's radius should vary within the page
//Fill this second group of ellipses with white transparent color

void setup() {
  size(500, 500);
  colorMode(RGB, 50);
  background(50);
  smooth();
  
}

float count = 5;
float ellipseSize = 50;
float num = 1500;


float radius = random(80,240);

void draw() {

  if (count>0);

  if (count < num) {
    if (count % 1/25 == 0) {
      ellipseSize = random(100, 200);
      noStroke();
      fill(random(20, 45));
      ellipse(random(0, 600), random(0, 600), random(ellipseSize/2), random(ellipseSize/2));
      
      count++;
    }
  }
  if (mousePressed == true) {
  if (count == 1500) {
    translate(width/2, height/2);  

    for (int i = 0; i < 360; i+=ellipseSize/20) {
      pushMatrix();   
      rotate(radians(i));    
      translate(radius, 0);   
      colorMode(RGB, 600);
      fill(600, 450);
      ellipse(0-random(-20, 10), 0-random(-20, 20), random(30, 40), random(30, 40));
      popMatrix();
    } 

    count++;
  }
}
}


