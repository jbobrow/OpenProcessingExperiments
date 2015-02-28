
void setup(){
  size(600,600);
 
}

void draw(){
  background(247,233,217);

//drawing... ha...//
  stroke(50);
  fill(77,138,163);
  triangle(60,165,105,164,83,238);
  fill(198,45,26);
  triangle(50,238,123,240,83,312);
  fill(232,170,26);
  triangle(83,312,157,482,17,482);
  
  fill(232,170,26);
  triangle(264,165,252,238,287,238);
  noFill();
  quad(265,238,232,310,309,310,309,310);
  fill(0,24,127);
  triangle(267,313,200,482,347,482);
  //////////////
  
  fill(77,138,163);
  arc(479,206,280,280,QUARTER_PI,HALF_PI-PI/11);
  fill(232,170,26);
  arc(479,206,280,280,HALF_PI-PI/11,HALF_PI+PI/11);
  fill(77,138,163);
  arc(479,206,280,280,HALF_PI+PI/11,PI-QUARTER_PI);
  
  fill(247,233,217);
  arc(479,206,260,260,QUARTER_PI,PI-QUARTER_PI);
  
  
  
  /////////////////
  
  
  

  fill(232,170,26);
  arc(479,206,217,217,PI/8,HALF_PI-PI/11);
  fill(77,138,163);
  arc(479,206,217,217,HALF_PI-PI/11,HALF_PI+PI/13);
  fill(232,170,26);
  arc(479,206,217,217,HALF_PI+PI/13,PI-PI/8);
  
  fill(247,233,217);
  arc(479,206,197,197,PI/8,PI-PI/8);
  
 
  fill(198,45,26);
  ellipseMode(CENTER);
  ellipse(479,206,82,82);
  noFill();
  triangle(479,247,379,482,584,482);

}
