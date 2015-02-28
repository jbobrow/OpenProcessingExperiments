
//start from the top left corner please

//setting variables
int a = 50;
int s = 350;
float x;
float y;
float px;
float py;
int radius = 50;
int radius2 = 50;
int radius3 = 50;
int radius4 = 50;

void setup(){
 
size(400, 400);
smooth();
stroke(255);
ellipseMode(RADIUS);

}

void draw(){

background(100);
//used the color selector to find just the right colors
//
  float f = dist(mouseX, mouseY, a, a);
  if ( f < radius){
    radius++;
    fill(255, 52, 228);
  }else{
    fill(255);
  } 
  ellipse(a, a, radius, radius);
 
 
   float d = dist(mouseX, mouseY, s, a);
  if ( d < radius2){
    radius2++;
    fill(251, 255, 41);
  }else{
    fill(255);
  } 
  ellipse(s, a, radius2, radius2);
  
    float j = dist(mouseX, mouseY, s, s);
  if ( j < radius3){
    radius3++;
    fill(3, 255, 104);
  }else{
    fill(255);
  } 
  ellipse(s, s, radius3, radius3);
    float k = dist(mouseX, mouseY, a, s);
  if ( k < radius4){
    radius4++;
    fill(136, 8, 250);
  }else{
    fill(255);
  } 
  ellipse(a, s, radius4, radius4);
  

  }
    






