
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
}

void drawUnit( origin_x, origin_y, radius, degrees) {
  x = origin_x + (radius * cos(degrees));
  y = origin_y + (radius * sin(degrees));
  arc(origin_x, origin_y, radius*2, radius*2, 0, degrees-0.05 );
  arc(x,y,15,15,0,TWO_PI );
}
 
void draw() {  //draw function loops 
  background(255);
  origin_x = width/2;
  origin_y = height/2;
  
  month_degrees = ( TWO_PI / 12 ) * month();
  drawUnit( origin_x, origin_y, 240, month_degrees );
  
  day_degrees = ( TWO_PI / 31 ) * day();
  drawUnit( origin_x, origin_y, 200, day_degrees );
  
  hour_degrees = ( TWO_PI / 24 ) * hour();
  drawUnit( origin_x, origin_y, 160, hour_degrees );
  
  minute_degrees = ( TWO_PI / 60 ) * minute();
  drawUnit( origin_x, origin_y, 120, minute_degrees);
  
  second_degrees = ( TWO_PI / 60 ) * second();
  drawUnit( origin_x, origin_y, 80, second_degrees );
  
  millis_degrees = ( TWO_PI / 1000) * (millis() % 1000);
  drawUnit( origin_x, origin_y, 40, millis_degrees );
}
