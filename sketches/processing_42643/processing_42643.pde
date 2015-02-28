
void setup() {


  size(600, 600);
  background(#FFFFFF);

  smooth();
}


void draw() {
  //cappellino//

  fill(#E00202);
  ellipse(330, 150, 100, 90); 


  pushMatrix();
  translate(300, 120);
  rotate(radians(145));
  fill(#C10000);
  ellipse(0, 0, 120, 140);
  popMatrix();

  //ovetto//
  strokeWeight(6);
  fill(#FFFFFF);



  ellipse(300, 300, 250, 360);

  //occhi//
  fill(#000000);
  ellipse(259, 230, 10, 17);
  ellipse(335, 230, 10, 17);

  //riflessi occhi//

  noStroke();
  fill(#FFFFFF);
  ellipse(264, 227, 6, 9);
  fill(#FFFFFF);
  ellipse(330, 227, 6, 9);

  //naso//
  fill(#000000);
  ellipse(300, 270, 20, 18);

  //guancette//  
  fill(#FF0303);
  ellipse(210, 280, 20, 18);
  ellipse(375, 280, 20, 18);

  //sottorosso//
  arc(300, 300, 250, 360, 0, PI);
  fill(#FFFFFF);
  arc(300, 299, 250, 200, 0, PI);

  //piede//
  fill(#E00202);
  ellipse(230, 500, 100, 60);
  ellipse(370, 500, 100, 60);  
  
}


