
  float mil, sek, min, std;
  float milx, mily, sekx, seky, minx, miny, stdx, stdy;
  int value= 0;

  void setup(){

  size(500,500);
 
  }
  void draw(){
  background(#9FA09E);
  mil = map(millis(), 0, 60000, 0, 360);
  sek = map((millis()/1000.0)%60, 0, 60, 0, radians(360)) - radians(90);
  min = map(minute()+second()/60.0, 0, 60, 0, radians(360)) - radians(90);
  std = map(hour()%12+minute()/60.0, 0, 12, 0, radians(360)) - radians(90);

  {if (mousePressed == true)
  {
  milx = cos(mil)*(width*.37);
  mily = sin(mil)*(height*.37);
  sekx = cos(sek)*(width*.225);
  seky = sin(sek)*(height*.225);
  minx = cos(min)*(width*.123);
  miny = sin(min)*(height*.123);
  stdx = cos(std)*(width*.05);
  stdy = sin(std)*(height*.05);
  }
  else
  {
  milx = cos(mil)*(width*.05);
  mily = sin(mil)*(height*.05);
  sekx = cos(sek)*(width*.123);
  seky = sin(sek)*(height*.123);
  minx = cos(min)*(width*.225);
  miny = sin(min)*(height*.225);
  stdx = cos(std)*(width*.37);
  stdy = sin(std)*(height*.37); }}
  
  //Hintergrund, Scheiben
  noStroke();
  pushMatrix();
  fill(0);
  ellipse(250,250,440,440);
  fill(#ffffff);
  ellipse(250,250,280,280);
  fill(0);
  ellipse(250,250,165,165);
  fill(#ffffff);
  ellipse(250,250,70,70);
  popMatrix();

  translate (width/2, height/2);
  
  //Zeitzeiger
  fill(#E5E5E5);
  for (int i=0; i<360; i+=30) { 
  pushMatrix();
  rotate(radians(i));
  translate(0,20); 
  rect(0, 0, 1, 35);
  popMatrix(); 
  }
  
  for (int i=0; i<360; i+=30) { 
  pushMatrix();
  rotate(radians(i)); 
  translate(0,75); 
  translate(-2.5,0);
  rect(0, 0, 5, 20);
  popMatrix();
 }
 
  for (int i=0; i<360; i+=30) { 
  pushMatrix();
  rotate(radians(i)); 
  translate(0,120); 
  translate(-5,0);
  rect(0, 0, 10, 40);
  popMatrix();
  
  }
  for (int i=0; i<360; i+=30) { 
  pushMatrix();
  rotate(radians(i)); 
  translate(0,190); 
  translate(-7.5,0);
  rect(0, 0, 15, 60);
  popMatrix();
  }

  //bewegliche Kreiselemente 
  {if (mousePressed == true)
  {
  fill(#84FF03);
  noStroke();
  
  //mil
  pushMatrix();
  translate(stdx, stdy);
  ellipse( 0, 0, 20,20);
  popMatrix();
  //sek
  pushMatrix();
  translate(minx, miny);
  ellipse( 0, 0, 40, 40);
  popMatrix();
  //min
  pushMatrix();
  translate(sekx, seky);
  ellipse( 0, 0, 60, 60);
  popMatrix();
  //std
  pushMatrix();
  translate(milx, mily);
  ellipse( 0, 0, 80, 80);
  popMatrix();
  }
  else
  {
  fill(#84FF03);
  noStroke();
  //mil
  pushMatrix();
  translate(milx, mily);
  ellipse( 0, 0, 20,20);
  popMatrix();
  //sek
  pushMatrix();
  translate(sekx, seky);
  ellipse( 0, 0, 40, 40);
  popMatrix();
  //min
  pushMatrix();
  translate(minx, miny);
  ellipse( 0, 0, 60, 60);
  popMatrix();
  //std
  pushMatrix();
  translate(stdx, stdy);
  ellipse( 0, 0, 80, 80);
  popMatrix(); 
     
  }}
 
  //visuallisierungselemente
 
  fill(255,0,0,127);
  triangle(milx, mily, sekx, seky, minx, miny);
  
  fill(0,255,0,127);
  triangle(milx, mily, sekx, seky, stdx, stdy);
  
  fill(0,0,255,127);
  triangle(stdx, stdy, sekx, seky, minx, miny);

   }
