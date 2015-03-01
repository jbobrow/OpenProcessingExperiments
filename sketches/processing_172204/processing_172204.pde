
float mund_verschiebung;

void setup()
{
  frameRate( 30 );
  size( 500,500 );
  colorMode( HSB,360,100,100 );
  smooth();
}

void draw(){
  background( map( mouseY,0,height,360,240 ) ,60,100 );
  
  //  Kopf  //////////
  pushMatrix();
  stroke( 0 );
  fill( 0,0,100 );
  ellipse( width/2,height/2, 400,460 );
  /*fill(0,0,0);beginShape();
  vertex(198.14265, 76.92634);
  bezierVertex(198.14265, 76.92634, 198.14265, 30.775772, 198.14265, 76.92634);
  bezierVertex(198.14265, 123.07692, 144.26544, 142.08008, 147.02838, 147.50957);
  bezierVertex(149.7913, 152.93904, 229.91638, 112.21796, 232.67932, 78.28371);
  bezierVertex(235.44226, 44.349472, 261.69012, 45.70684, 261.69012, 75.56897);
  bezierVertex(261.69012, 105.43111, 228.53493, 129.86377, 228.53493, 129.86377);
  bezierVertex(228.53493, 129.86377, 281.03067, 98.64426, 283.7936, 75.56897);
  bezierVertex(286.55655, 52.49369, 310.04147, 61.995277, 310.04147, 75.56897);
  bezierVertex(310.04147, 89.14267, 289.31946, 109.50322, 289.31946, 108.14584);
  bezierVertex(289.31946, 106.788475, 308.66, 101.35899, 328.00055, 76.92634);
  endShape();
  arc(width/2,height/2, 400, 460, -2.35, -PI/4, OPEN);
  */
  popMatrix();
  
  //  Augen  //////////
  pushMatrix();
  fill( 0,0,0 );
  translate( (width/2)-50,(height/2)-20 );
  rotate( map(mouseY,0,height,0,-0.2) );
  ellipse( -50,0, 100,map(mouseY,0,height,50,30) );
  popMatrix();
  pushMatrix();
  fill( 0,0,0 );
  translate( (width/2)+50,(height/2)-20 );
  rotate( map(mouseY,0,height,0,0.2) );
  ellipse( 50,0, 100,map(mouseY,0,height,50,30) );
  popMatrix();
  
  /*//  Wangen  ////////
  pushMatrix();
  noStroke();
  ellipse( (width/2)-100,(height/2)+60,150,150 );
  popMatrix();
  */
  
  //  Mund  //////////
  mund_verschiebung = map(mouseY,0,height,0,50);
  translate(width/2,350);
  beginShape();
  vertex(-100, mund_verschiebung);
  bezierVertex(-100.0, mund_verschiebung, -100.0, mund_verschiebung, -100.0, mund_verschiebung );
  bezierVertex(-100.0, 0.0, -50.0, 20.0, 0, 20.0);
  bezierVertex(50.0, 20.0, 100.0, 0.0, 100.0, mund_verschiebung );
  bezierVertex(100.0, mund_verschiebung, 50.0, 40.0, 0.0, 40.0);
  bezierVertex(-50.0, 40.0, -100.0, mund_verschiebung, -100.0, mund_verschiebung );
  endShape();
}
