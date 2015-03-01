
float logo = 0;
void setup() {
  size(700,700);
  background (50);
}
void draw() {
  
  fill (15, 230, 15);
  logo=logo+0.05;
  float posicionX = 15*sin(logo);
  float posicionY = 15*cos(logo);
  ellipse(width/2+posicionX, height/2+posicionY,45, 45);
  
  fill (250, 250, 0);
  logo=logo+0.5;
  float posicionX = 60*sin(logo);
  float posicionY = 60*cos(logo);
  ellipse(width/2+posicionX, height/2+posicionY, 65, 65);
  
  fill (230, 15, 15);
  logo=logo+0.05;
  float posicionX = 75*sin(logo);
  float posicionY = 75*cos(logo);
  ellipse(width/2+posicionX, height/2+posicionY, 75, 75);
  
  fill (15, 230, 15);
  logo=logo+0.5;
  float posicionX = 95*sin(logo);
  float posicionY = 95*cos(logo);
  ellipse(width/2+posicionX, height/2+posicionY,45, 45);
  
  fill (250, 250, 0);
  logo=logo+0.5;
  float posicionX = 170*sin(logo);
  float posicionY = 170*cos(logo);
  ellipse(width/2+posicionX, height/2+posicionY,75, 75);
  
  fill (230, 15, 15);
  logo=logo+0.5;
  float posicionX = 290*sin(logo);
  float posicionY = 290*cos(logo);
  ellipse(width/2+posicionX, height/2+posicionY, 93, 93);  
}
