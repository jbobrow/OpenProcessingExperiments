
float schiggi =0;
float schwerkraft = 0.02;
float pickachu=0;
float speed = 0;
float x = 100;
float y = 0;
float spawner = 0;

void setup() {
  size(500, 500);
  //smooth();
  colorMode(RGB, 255, 255, 255);

  noStroke();
}


void draw() {



  float brim = map(sin(schiggi), -1, 1, 0.7, 1);
  float brim1 = map(sin(schiggi), -1, 1, 0.7, 1);
  float brim2 = map(sin(pickachu), -1, 1, 0.8, 0.82);
  float brim3 = map(sin(pickachu), -1, 1, 0.7, 0.72);

  pushMatrix();
  float change = map(mouseX, 0, 500, 1, 100);
  float rgb = map(mouseX, 0, 250, 241, 189); 
  float rgb2= map(mouseX, 0, 250, 196, 195); 
  float rgb3 = map(mouseX, 0, 250, 15, 199); 
  background(rgb, rgb2, rgb3);
  popMatrix();


  pushMatrix();
  float herzrgb1 = map(mouseX, 0, 250, 192, 149); 
  float herzrgb2= map(mouseX, 0, 250, 57, 165); 
  float herzrgb3 = map(mouseX, 0, 250, 43, 166);
  translate(width/2, height/2);
  scale(brim);

  if (brim>=0.95) {
    scale(brim1);
  }

  fill(herzrgb1, herzrgb2, herzrgb3);

  triangle(0, 175, -165.5, 0, 165.5, 0);

  ellipseMode(CENTER);
  rectMode(CENTER);
  rect(0, 0, 100, 150);
  ellipse(99, -75, 200, 200);
  ellipse(-99, -75, 200, 200);
  popMatrix();


  println( sin(schiggi) );
  schiggi +=0.06;
  println(sin(pickachu));
  pickachu +=0.03;


  pushMatrix();
  float bgfarbe1 = map(mouseX, 250, 500, 189, 44);
  float bgfarbe2 = map(mouseX, 250, 500, 195, 62);
  float bgfarbe3 = map(mouseX, 250, 500, 199, 80);


  if (mouseX >= 250) {
    background(bgfarbe1, bgfarbe2, bgfarbe3);
  }
  popMatrix();
  pushMatrix();
  if (mouseX >= 400) {
    fill(0, 0, 0, 50);
    textSize(25);
    text ("Klicken", 410, 490);
  }
  popMatrix();
  //Tutoren fragen!!!
  pushMatrix();
  fill(0);
  float bewegung = map(sin(pickachu), -1, 1, -100, 350);
  float bewegung2 = map(sin(pickachu), 1, -1, 100, 100);


  if (mouseX >= 250 && (mouseButton == LEFT)) {
  
    
    for (int spawn=0; spawn<20; spawn++)
    {
      pushMatrix();
      
      fill(41, 128, 185);
      translate(sin(spawner+spawn)*35, 100-spawn*50);
      ellipseMode(CENTER);  
      //ellipse(340, y-10, 10, 10);
      ellipse(140, y+10, 10, 10);
      //ellipse(160, y-10, 10, 10);
      ellipse(180, y-10, 10, 10);
      //ellipse(200, y-10, 10, 10);
      ellipse(220, y+10, 10, 10);
      //ellipse(240, y-10, 10, 10);
      ellipse(260, y-10, 10, 10);
      //ellipse(280, y-10, 10, 10);
      ellipse(300, y+10, 10, 10);
       //ellipse(320, y-10, 10, 10);
 popMatrix();
    }
    spawner +=0.01;
  
    y = y + speed;
    speed = speed + schwerkraft;

 }
 
  
  popMatrix();
if (speed >= 3){
  speed = 3;} 

if (y >= height) {
  y = 0;}
  pushMatrix();

  float heartfarbe1 = map(mouseX, 240, 500, 149, 263);
  float heartfarbe2 = map(mouseX, 240, 500, 165, 240);
  float heartfarbe3 = map(mouseX, 240, 500, 166, 241);
  //float hue = map (mouseX,200,250 , 0,100);

  if (mouseX >= 250) {

    fill(bgfarbe1, bgfarbe2, bgfarbe3);

    rect(0, 0, 1000, 200);
    fill(heartfarbe1, heartfarbe2, heartfarbe3);
    ellipseMode(CENTER);
    scale(brim3);
    ellipse(230, 100, 160, 160);
    ellipse(450, 110, 185, 185);
    ellipse(450, 200, 110, 110);
    scale(brim2);
    ellipse(350, 60, 110, 110);
    ellipse(450, 120, 210, 210);
    ellipse(230, 200, 160, 160);
    ellipse(330, 220, 130, 130);
    ellipse(430, 230, 160, 160);
    //rect(0,0,500,500);
  }
  popMatrix();
}

