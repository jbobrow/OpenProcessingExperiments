
int elliSec = 60;
int elliMin = 60;
int elliHour = 24;

int distance =40;
int distMin = 30;
int distHour = 20;
float angle_increment = TWO_PI/elliSec;
float angle_incrementHour = TWO_PI/elliHour;
float current_angle =0;

void setup() {
  size(200, 200);
  smooth();
  noStroke();
  //colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0);
  fill(255);
  text((hour() + ":" + minute() + ":" + second()),130,180);

  for (int i=0; i<elliHour; i+=1) { 
    fill(240, 78, 62);
    float offsetX = cos(current_angle+angle_incrementHour*i)*distHour;
    float offsetY = sin(current_angle+angle_incrementHour*i)*distHour;
    ellipse(width/2 + offsetX, height/2 + offsetY, 10, 10);
  }


  for (int i=0; i< hour(); i+=1) { 
    fill(246, 139, 31);
    float offsetX = cos(current_angle+angle_incrementHour*i)*distHour;
    float offsetY = sin(current_angle+angle_incrementHour*i)*distHour;
    ellipse(width/2 + offsetX, height/2 + offsetY, 10, 10);
  }



  for (int i=0; i<elliMin; i+=1) { 
    fill(47, 181, 106);
    float offsetX = cos(current_angle+angle_increment*i)*distMin;
    float offsetY = sin(current_angle+angle_increment*i)*distMin;
    ellipse(width/2 + offsetX, height/2 + offsetY, 10, 10);
  }

  for (int i=0; i<minute(); i+=1) { 
    fill(246, 139, 31);
    float offsetX = cos(current_angle+angle_increment*i)*distMin;
    float offsetY = sin(current_angle+angle_increment*i)*distMin;
    fill(153, 212, 192);
    ellipse(width/2 + offsetX, height/2 + offsetY, 10, 10);
  }

  for (int i=0; i<elliSec; i+=1) {
    fill(48, 105, 179);
    float offsetX = cos(current_angle+angle_increment*i)*distance;
    float offsetY = sin(current_angle+angle_increment*i)*distance;
    ellipse(width/2 + offsetX, height/2 + offsetY, 10, 10);
  }

  for (int i=0; i<second(); i+=1) {
    fill(68, 200, 245);
    float offsetX = cos(current_angle+angle_increment*i)*distance;
    float offsetY = sin(current_angle+angle_increment*i)*distance;
    ellipse(width/2 + offsetX, height/2 + offsetY, 10, 10);
  }
}


