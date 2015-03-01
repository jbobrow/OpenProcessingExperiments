
PImage img; 





void setup() {
  size(450, 320);
  noStroke();
  img = loadImage("table2.gif"); 
}

void draw() {
  float s = second();
  float m = minute();
  float h = hour();
  background(map(m,0,60,255,202), map(m,0,60,255,199), map(m, 0,60, 255, 234)); 
  image(img, 0, 0);


  fill(240);
  ellipse(215, 20, 30, 30);

  fill(198, 84, 8);
  ellipse(215, 8, 15, 9); 

  fill(255, 108, 10);
  ellipse(215, 5, 15, 5); 


  fill(240);
  rect(200, 20, 30, 60);
  
  fill(240, 191, 234);
  rect(200, map(s, 0, 60, 20, 80), 30, map(s, 0, 60, 60, 0));
  
  
fill(map(m,0,60,255,60), map(m,0,60,3,255), map(m, 0,60, 184, 3));
quad(209, 35, 225, 30, 218, 40, 203, 45);
triangle(211, 40, 208, 60, 229, 35); 


  String r = h + ":" + m + ":" + s;
  text(r, 170, 200);
  
  fill(240, 56, 231);
  text("Stay Hydrated!",172,220);
  text("Drink at least 100 oz a day!", 145, 233);



  
  
}



