
int counter = 0;
int shapes = 0; 
int spacingX = 0;
int spacingY = 0;
void setup()
{
  size(640, 480);
  background(255, 255, 255);
  strokeCap(PROJECT);

  /*
 line(0,0,400,400);
   stroke(128,128,128);
   strokeWeight(5);
   line(0,10,400,410);
   fill(0,255,0);
   rect(320,240,128,128);
   ellipse(240,240,128,128);
   fill(0,255,255);
   triangle(240,240,320,240,240,320);
   */
}
void draw()
{


  strokeWeight(0 );
  //  saveFrame("frames/"+shapes+".png"); 
  if (shapes < 50) {
    spacingX = int(random(640));
    spacingY = int(random(480));
    shapes++;
    fill(random(255),random(255),random (255));
   // rect(0, 0, 640, 480);
    triangle(spacingX,spacingY,spacingX+16,spacingY-16,spacingX+16,spacingY+32);
    fill(random(1, 5), random(1, 5), random(1, 5));
    //rect (random(-100, 640), random(-120, 480), random(5, 50), random(5, 50));
  }
  if (shapes >= 50 && shapes < 100) {
    fill(0, 0, 0);
    rect(0, 0, 640, 480);
    fill(random(250, 255), random(250, 255), random(250, 255));
    shapes++;
    ellipse(random(-100, 640), random(-120, 480), random(200, 259), random(200, 260));
  }

  if (shapes >= 100) {
    shapes++;
  }
  if (shapes > 100 && shapes <=600) { //counter goes to 400
    counter++;
  } 
  if (shapes == 101) {
    strokeWeight(8);
    fill(255, 255, 255);
    rect(0, 0, 640, 480);
  }
  if (counter == 275) {
    strokeWeight(8);
    line(0, 446, 640, 446);
  }
  if (counter == 300) {
    strokeWeight(8);
    line(0, 150, 640, 150);
  }
  if (counter == 350) {
    strokeWeight(8);
    line(280, 0, 280, 480);
  }
  if (shapes == 250) {
    strokeWeight(8);
    line(501, 0, 501, 480);
  }
  if (shapes == 225) {
    strokeWeight(8);
    //line(595,0,595,480);
    line(353, 284, 353, 480);
  }

  if (counter < 282 && counter != 0) {
    strokeWeight(8);  
    point (counter, 284);
  }

  if (counter < 350 && counter != 0) {
    strokeWeight(8);
    point (595, counter);
  }

  if (counter == 250) {
    strokeWeight(8);

    fill(255, 255, 255);

    fill(244, 235, 0);
    //yellow rect 1
    rect(0, 0, 200, 150);
  }
  if (counter == 200) {
    fill(0, 0, 215);
    //blue rect 1
    rect(200, 0, 80, 150);
  }
  if (counter == 125) {
    fill(215, 0, 0);
    //red rect 1
    rect(280, 150, 73, 134);
  }
  if (counter == 350) {
    strokeWeight(8);
    fill(22, 74, 0);
    //green square 1
    rect(501, 352, 94, 94);
  }
}
//background(counter);



