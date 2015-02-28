
int Y;
void setup () {
  size(500, 500); 

  colorMode(HSB,360,100,100);
  Y = color(210,50,30);
}

void draw () {
  background(Y);
  color T = color(random(255), random(255), random (255),random(255));
  if(mousePressed) {
    float C = alpha(0);
    fill (C);
  }
  else {
    fill (T);
  }
  rect ((width/2)-50, (height/2)-50, 100, 100);
  smooth();
  strokeWeight(10);
  line (0, width/2,500, height/2);
  line (width/2,0,height/2,500);
  triangle(mouseX+30,mouseY+75,mouseX+58,mouseY+20,mouseX+86,mouseY+75);
  if(mousePressed){
    
  } 
    else{
  for (float N = random(255); N < 200; N = random(255)) {
    for(float M = random(255); M < 200; M = random(255)) {
      point(N+random(255),M+random(255));
    }
  }}
}


