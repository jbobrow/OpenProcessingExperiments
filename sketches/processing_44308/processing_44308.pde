
import processing.pdf.*;

float perlinPosition = 0;
float perlinSpeed = 0.01;

boolean PDFing = false;

void setup() {
  size(450, 450);
  background(0);
  smooth();
}

void draw() {
  //line(width/2,height/2,width/2+200,height/2);
  noFill();
  stroke(0, 255, 0, 10);
  translate(width/2, height/2);
  rotate(frameCount*.01);
  //rotate(radians(45));
  //float armLength = random(100,200);
  float armLength = noise(perlinPosition)*300;
  rect(0, 0, armLength, 1500 );
  ellipse(armLength, 0, 1, 100);
  perlinPosition= perlinPosition + perlinSpeed;
}
void keyPressed() {
  if (key =='s') {
    int id=frameCount;
    save("out/perlin" + id + ".png");
    println("IMAGESAVED");
  }

  if (key == 'p') {
    //Are we currently recording a PDF?
    if (PDFing) {
      //YES
      endRecord();
      println("PDFRECORD ENDED");  
      PDFing=false;
    }
    else {
      //NO.
      beginRecord(PDF, "out/record.pdf");
      println("PDF RECORD STARTED");
      PDFing=true;
    }
  }
}
                
