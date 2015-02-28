
int mouthsize=130;
int mouthgrowthrate;
float nosehole=20;
float noseholegrowthrate;

void setup() {
  size(650, 500);
  smooth();
  strokeWeight(2);
  mouthgrowthrate=4;
  noseholegrowthrate=4;
}
void mouseClicked(){
  nosehole=0;
}

void draw() {
  //fill in the background 
  background(122, 207, 255);
  if (mouthsize>=130){
    mouthgrowthrate = -1;}
    else if(mouthsize<=0){
      mouthgrowthrate=1;
    }
    mouthsize= mouthsize+mouthgrowthrate;
    
   if(nosehole>=20){
     noseholegrowthrate = -0.5;}
     else if(nosehole<=0){
       noseholegrowthrate=0.5;
       }
    nosehole= nosehole+noseholegrowthrate;
  //draw a tail for a pig
  noFill();
  stroke(253, 229, 182);
  strokeWeight(15);
  curve(500, 350, 450, 450, 550, 330, 1000, 550);
  
 //draw legs for a pig  
  strokeWeight(1);
  stroke(252,186,108);
  fill(255, 229, 182);
  rect(250, 435, 30, 60, 3, 6, 12, 18);
  rect(215, 428, 30, 60, 3, 6, 12, 18);
  rect(400, 435, 30, 60, 3, 6, 12, 18);
  rect(435, 428, 30, 60, 3, 6, 12, 18);
  
  //draw body for a pig
  strokeWeight(1);
  stroke(252, 186, 108);
  fill(253, 229, 182);
  ellipse(350,400,300,150);
  
 

  // draw triangles for ears
  strokeJoin(ROUND);
  fill(252, 202, 160);
  triangle(86, 100, 105, 200, 350, 150);
  strokeJoin(ROUND);
  fill(252,202,160);
  triangle(414, 100, 395, 200, 150, 150);
 
 // details of ears by drawing lines
  stroke(249, 232, 213);
  strokeWeight(10);
  strokeCap(ROUND);
  line(394,120,375,220);
  strokeCap(ROUND);
  line(394, 120, 180, 150);
  strokeCap(ROUND);
  line(106, 120,125, 220);
  strokeCap(ROUND);
  line(106, 120, 330, 150);  
  
 //pig face
   strokeWeight(1);
   stroke(252, 186, 108);
  fill(253, 229, 182);
  ellipse(250, 250, 300, 300);
  
  //nose
  stroke(1);
   fill(253, 235, 170);
  ellipse(250, 280, 100, 80);
  
  //eyes
  fill(254, 254, 254);
  ellipse(190, 220, 50, 55);
  fill(254, 254, 254);
  ellipse(310, 220, 50, 55);
  fill(50);
  ellipse(190, 230, 30, 35);
  fill(50);
  ellipse(310, 230, 30, 35);
  
 //nose hole 
  fill(243, 190, 122);
  ellipse(235, 280, nosehole, nosehole);
  fill(243, 190, 122);
  ellipse(270, 280, nosehole, nosehole);
    
  //mouth
  noStroke();
  fill(247, 11, 16);
  arc(250, 325, 130, mouthsize, 0, radians(180));
 
  stroke(1);
  fill(30);
  quad(300, 160, 330, 170, 350, 180, 360, 190);
  
  fill(30);
  quad(200, 160, 170, 170, 150, 180, 140, 190);

  
}
