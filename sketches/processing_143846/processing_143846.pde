
int[] data;

void setup() {
  size(300,300);
  background(0);
  // Load text file as a string
  String[] stuff = loadStrings("data.txt");
  // Convert string into an array of integers using ',' as a delimiter
  data = int(split(stuff[0],','));
  
}

void draw() {
  fill(255,40);
  noStroke();
  
  for (int i = 0; i < data.length; i++) {
  ellipse(data[i] * 8, width/2 - 100, 16,16);
  ellipse(data[i] * 8, width/2, 16,16);
  ellipse(data[i] * 8, width/2 + 100, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 - 150, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 - 140, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 - 130, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 - 120, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 - 110, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 - 100, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 - 90, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 - 80, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 - 70, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 - 60, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 - 50, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 - 40, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 - 30, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 - 20, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 - 10, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 + 10, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 + 20, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 + 30, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 + 40, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 + 50, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 + 60, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 + 70, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 + 80, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 + 90, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 + 100, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 + 110, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 + 120, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 + 130, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 + 140, 16,16);
  ellipse(ceil(random(0,99)) * 8, height/2 + 150, 16,16);
  noLoop();
 };
}



