
int teethsize=60;
int teethgrowthrate;

void setup() {
  size(400, 400);
  smooth();
  strokeWeight(5);
  teethgrowthrate = 5;
}
void draw() {
  background(0, 200, 200);
  if (teethsize >= 200){
    teethgrowthrate= -1;
  } else if( teethsize<=0){
    teethgrowthrate=1;
  }
   teethsize= teethsize +teethgrowthrate;
  stroke(70);

  fill(255, 200, 200);
  arc(310, 360, 30, 30, 90, PI+180, CHORD);
  rect(80, 50, 55, 100, 7);
  rect(270, 50, 55, 100, 7);
  rect(80, 130, 245, 130, 7);
  rect(103, 260, 200, 130, 7);
  rect(120, 320, 50, 70, 10);
  rect(230, 320, 50, 70, 10);




  stroke(0);
  ellipse(130, 200, 60, 60);
  ellipse(270, 200, 60, 60);

  point(220, 236);
  point(220, 244);
  point(228, 241);

  point(180, 236);
  point(180, 244);
  point(173, 241);

  fill(127, 0, 0);
  stroke(127, 0, 0);
  ellipse(130, 200, 20, 20);
  ellipse(270, 200, 20, 20);
  stroke(0);
  line(160, 200, 237, 200);
  
  stroke(50);
  fill(253, 157, 54);
  triangle(200, 305, 100, 250, 100, 305);

  fill(0, 157, 0);
  triangle(80, 290, 100, 280, 100, 290);
  triangle(80, 260, 100, 270, 100, 290);

 
  fill(0);
  stroke(50);
  ellipse(200, 220, 10, 10);

  line(150, 250, 250, 250);
  line(200, 230, 200, 250);


  line(150, 303, 150, 295);
  line(130, 303, 130, 290);
  fill(240, 0, 0);
  quad(270, 115, 320, 145, 320, 115, 270, 145);
  quad(80, 115, 130, 145, 130, 115, 80, 145);
  
  fill(254, 254, 254);
  rect(180, 250, 20, teethsize);
  rect(200, 250, 20, teethsize);

}
