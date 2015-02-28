
void setup() {
  size(displayWidth, displayHeight);
  colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);
}

void draw() {

  float time = millis()/300.0;
  float sine = sin(time);
  float sine1  = map(sin(time), -1, 1, 0, 1);
  float sine2 = map(sin(time + HALF_PI), -1, 1, 0, 1);
  float sine3 = map(sin(time + PI), -1, 1, 0, 1);
  float sine4 = map(sin(time + HALF_PI*3), -1, 1, 0, 1);

  float r = 350; 

  float hue = map(sine, -1, 1, 0, 360);
  float sat = map(sine, -1, 1, 0, 100);
  float bri = map(sine, -1, 1, 0, 100);

  background(200, 80, bri);


  for (int i = 0; i< 10; i+= 10) {

    fill(60, 95, bri); //stars
        strokeWeight(0);
    ellipse(random(width), random(height), 10, 10);
    
    fill(60, 95, bri); //stars 2
        strokeWeight(0);
    ellipse(random(width), random(height), 10, 10);

    fill(hue+165, sat-50, bri-50);  //buildings
    strokeWeight(5);
    rect(random(width), (random(height))+600, displayWidth/4, displayHeight);
    
        fill(hue+165, sat-50, bri-50);  //buildings
    strokeWeight(5);
    rect(random(width), (random(height))+600, displayWidth/4, displayHeight);
    
  }



  strokeWeight(10);
  strokeCap(ROUND);
  fill(229, 23, 63);
  rect(random(width*sine1), height*1, int(r), int(r)); //train 1

  strokeWeight(10);
  strokeCap(ROUND);
  fill(229, 23, bri);
  rect(random(width*sine1), height*1, int(r), int(r)); //train 2
  
    strokeWeight(10);
  strokeCap(ROUND);
  fill(229, 23, bri);
  rect(random(width*sine1), height*1, int(r), int(r)); //train 3
  
    strokeWeight(10);
  strokeCap(ROUND);
  fill(229, 23, bri);
  rect(random(width*sine1), height*1, int(r), int(r)); //train 4
  
  strokeWeight(10);
  strokeCap(ROUND);
  fill(60, sat, 97);
  rect(random(width*sine1), (height*1)-125, (int(r))-300, (int(r))-300); //windows
  
    strokeWeight(10);
  strokeCap(ROUND);
  fill(60, sat, 97);
  rect(random(width*sine1), (height*1)-125, (int(r))-300, (int(r))-300); //windows 2
  
    strokeWeight(10);
  strokeCap(ROUND);
  fill(60, sat, 97);
  rect(random(width*sine1), (height*1)-125, (int(r))-300, (int(r))-300); //windows 3
  
  strokeWeight(10);
  strokeCap(ROUND);
  fill(60, sat, 97);
  rect(random(width*sine1), (height*1)-125, (int(r))-300, (int(r))-300); //windows 4
  
  strokeWeight(10);
  strokeCap(ROUND);
  fill(60, sat, 97);
  rect(random(width*sine1), (height*1)-125, (int(r))-300, (int(r))-300); //windows 5
  
    strokeWeight(3);
  strokeCap(ROUND);
  fill(34, 58, bri);
  ellipse(random(width*sine1), (height*1)-125, (int(r))-320, (int(r))-320); //people
  
  strokeWeight(3);
  strokeCap(ROUND);
  fill(34, 58, bri);
  ellipse(random(width*sine1), (height*1)-125, (int(r))-320, (int(r))-320); //people 2
  
    strokeWeight(3);
  strokeCap(ROUND);
  fill(34, 58, bri);
  ellipse(random(width*sine1), (height*1)-125, (int(r))-320, (int(r))-320); //people 3
}
boolean sketchFullScreen() {
  return true;
}
