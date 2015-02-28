
void setup()
{
  size(400,400);
  background(180);
  noStroke();
  
  smooth();
}


void draw()
{
  
shinosuke();

}

void shinosuke()
{
  //pushMatrix();
  translate(mouseX,mouseY);
  
  //noCursor();
  background(180);
  
  //translate(180,180);
  
  scale(6); //al acabar el dibuix he de treure el factor d'escala//
  
  //rectangle base//
  //stroke(0);
  //strokeWeight(0.2);
  //rect(0,0,40,50);
  
  
  noStroke();
  
  //cames//
  fill(255,220,170);
  quad(12,37.5,12,44,14,44,15,37.5);
  quad(22,37.5,23,45,25,45,25,37.5);
  
  //mitjons//
  fill(255);
  quad(12,44,12,47.5,13.5,47.5,14,44);
  quad(23,45,23.5,47.5,25,47.5,25,45);
  
  //sabates//
  fill(160,110,50);
  quad(8,50,14,50,13.5,47.5,11,47.5);
  ellipse(11.5,47.5,1,4);
  quad(23.5,47.5,23,50,29.5,50,26,47.5);
  ellipse(25.5,47.5,1,4);
  
  //pantalons//
  fill(240,240,60);
  quad(11,30,10,37.5,17,38,21,30);
  quad(16,30,19,38,27.5,38,26.5,30);
  
  //jersei//
  fill(200,0,0);
  triangle(12,19,38,11.5,19,29);
  triangle(3,11,18,28,20,18);
  triangle(12,19,10,31,27,31);
  triangle(10,31,27,31,27,18);
  
  //mans//
  fill(255,220,170);
  quad(35,12.4,36,13.5,38,12,38,11);
  ellipse(37.5,11.5,3,3);
  quad(3,11,3,11.5,5,13.2,6,12.2);
  ellipse(3,11,3,3);
  
  //dits//
  noFill();
  stroke(255,220,170);
  strokeWeight(0.9);
  line(3,11,0.5,8);
  line(3.5,11,2,7);
  line(37.5,11,39.5,8.5);
  line(37,11,38,7.5);
  
  noStroke();
  
  //cara i cabell//
  fill(255,220,170);
  
  rect(12,8,7,9);
  triangle(19,0.5,19,15,32.5,13); //recubriment de la cara//  
  
  arc(12,12.5,10,9,HALF_PI,HALF_PI+PI);
  arc(19,8,14,15,PI,PI+HALF_PI);
  beginShape();
  vertex(19,0.5);
  bezierVertex(19,0.5,28,2,30,9.3);
  vertex(12,17.5);
  bezierVertex(12,17.5,22,18,32.5,13);
  vertex(26,12.5);
  bezierVertex(26,12.5,35,2,32.5,13);
  endShape();
  
  noFill();
  stroke(0);
  strokeWeight(1.2);
  beginShape();
  vertex(16,1);
  bezierVertex(16,1,28,0,29.5,8);//línia de cabell//
  endShape();
  
  noStroke();
  fill(0);
  triangle(31,8,29,9.5,28.75,5); //acabament del cabell//
  
  
  noStroke();
  
  //boca, ulls i celles//
  fill(140,90,100);
  ellipse(12,16,3,3.5);
  
  fill(0);
  ellipse(16.5,8,3.5,3.5);
  ellipse(24,9,3.5,3.5);
  
  fill(255);
  ellipse(16.75,8.25,1.25,1.25);
  ellipse(24.25,9.25,1.25,1.25);
  
  noFill();
  stroke(0);
  strokeWeight(0.2);
  arc(16,6.25,5,5,PI,PI+PI);
  arc(22.5,6.5,5,4.5,PI,PI+PI);
  
  strokeWeight(1.5);
  line(13.5,2.5,16,0.5);
  line(16,0.5,18,2.5);
  
  line(20.5,2.5,23,0.75);
  line(23,0.75,25.5,4); 
  
  //popMatrix();
}
