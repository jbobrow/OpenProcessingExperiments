
size(400, 400);
background(255);

rectMode(CENTER);


fill(170, 50, 50, 150);
float x = 20;
float y = 20;
float w = 20;

for (int i = 0; i < 22; i++) {

  w = cos((120 - x) / 30) * 20 + 25;
  for (int j = 0; j < 13; j++){
    y = j * 30 + 20;
    
    rect(x, y, w, 70);
  }
  x = x + w + 10;

}

