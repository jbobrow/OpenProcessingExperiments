
//only flashes once :(
int color_value=0;
int count=0;
int m;

void setup () {
  size(400, 400);
  m = millis();
}


void draw() {

  fill(255, 255, color_value);
  rect(10, 10, 50, 15);


  if (millis() >= m + 501) {
    m=millis();

    if (color_value == 0) {
      color_value=255;
    } 
    else {
      color_value=0;
    }
  }
  
}






