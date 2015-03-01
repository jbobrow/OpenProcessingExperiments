
PGraphics Plate1;
PGraphics Plate2; 
void setup() {
    size(960,960);
    background(37,37,37);
    Plate1 = createGraphics(width/2, height); 
    Plate2 = createGraphics(width/2, height);
    Plate1.beginDraw();
    Plate1.fill(137,137,200);
    Plate1.rect(0, 280, 480, 160);
    Plate1.fill(77,77,200);
    Plate1.rect(320, 0, 160, 960);
    Plate1.fill(20,20,20);
    Plate1.rect(0, 260, 480, 40);
    Plate1.fill(200,200,200);
   // Plate1.ellipse(320, 280, 300, 120);
    Plate1.stroke(200, 80);
    Plate1.strokeWeight(.75);
    Plate1.fill(20,20,20);
    Plate1.rect(160, 480, 337, 337);
    Plate1.fill(0,137,177);
    //Plate1.ellipse(320, 280, 110, 110);
      for (int i = 0; i < 1000; i++) {
        float x1 = random(width/2*5%100);
        float x2 = random(width/2*5%100);
        float y1 = random(height/2);
        float y2 = random(height/2);
        Plate1.fill(37,37,100);
        Plate1.ellipse(x1, x2, y1, y2);
        Plate1.ellipse(y2, x1, x2, y1);
        Plate1.ellipse(y1, y2, x1, x2);
        Plate1.ellipse(x2, y1, y1, x1);
        Plate1.line(2*x1, x2, y2, y2);
        Plate1.line(y2, 2*x1, x2, x2);
        Plate1.line(y1, 2*y2, x2, x1);
        Plate1.line(2*x2, y1, y2, y1);
        }
    Plate1.fill(37,37,37);
    //Plate1.ellipse(320, 280, 40, 40);
    Plate1.endDraw();
    Plate2.beginDraw();
    Plate2.fill(137,137,200);
    Plate2.rect(0, height-280, 480, 160);
    Plate2.fill(77,77,200);
    Plate2.rect(320, height-0, 110, 310);
    Plate2.fill(20,20,20);
    Plate2.rect(0, height-260, 480, 40);
    Plate2.fill(0,0,0);
    //Plate2.ellipse(320, 280, 300, 120);
    Plate2.stroke(200, 80);
    Plate2.strokeWeight(.75);
    Plate2.fill(77,77,200);
    Plate2.rect(0, 400, 480, 80);
    Plate2.fill(0,137,177);
    //Plate2.ellipse(320, 280, 110, 110);
    Plate2.fill(25,25,25);
   // Plate2.ellipse(320, 280, 40, 40);
      for (int i = 0; i < 77; i++) {
        float x1 = random(width/2*5%140);
        float x2 = random(width/2*5%140);
        float y1 = random(height);
        float y2 = random(height*.75);
        Plate2.fill(37,37,100);
        Plate2.ellipse(x1, x2, y1, y2);
        Plate2.ellipse(y2, x1, x2, y1);
        Plate2.ellipse(y1, y2, x1, x2);
        Plate2.ellipse(x2, y1, y1, x1);
        Plate2.line(2*x1, x2, y2, y2);
        Plate2.line(y2, 2*x1, x2, x2);
        Plate2.line(y1, 2*y2, x2, x1);
        Plate2.line(2*x2, y1, y2, y1);
      }

    Plate2.endDraw();
    //image(Plate2, width/2, 0);
    image(Plate1, 0, 0);
    pushMatrix();
    scale(-1.0, -1.0);
    translate(-width/2,-height);
    image(Plate2, -Plate2.width, 0);
     popMatrix();
 }
void draw() {
}





