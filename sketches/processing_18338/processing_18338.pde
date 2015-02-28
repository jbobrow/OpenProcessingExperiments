
void setup(){
  size(400, 400);
  background(255);
  //noFill();

  smooth();
  stroke(121);
//handle
  beginShape(LINES);
  vertex(60, 40);
  vertex(160, 10);
  vertex(220, 100);
  vertex(160, 150);
  endShape();
  strokeWeight(3);
  beginShape(POINTS);
  vertex(60, 40);
  vertex(160, 10);
  vertex(220, 100);
  vertex(160, 150);
  endShape();

  strokeWeight(1);

  stroke(126,233,30);

  beginShape();
  vertex(60, 40); //set the first anchor point , need a vertex here v1
  bezierVertex(160, 10, 160, 60, 160, 150);//c1,c2,v2
  endShape();

strokeWeight(4);
  stroke(0);
  beginShape();
  vertex(160, 150); //set the first anchor point , need a vertex here v1
  bezierVertex(60, 210, 220, 300, 200,200);//c1,c2,v2
  bezierVertex(200, 21, 260, 40, 330,200);//c1,c2,v2
  endShape();

  stroke(230,0,130);
  beginShape();
  vertex(200, 200); //set the first anchor point , need a vertex here v1
  bezierVertex(200, 21, 260, 40, 330,200);//c1,c2,v2
  endShape();

  stroke(0,230,230);
  beginShape();
  vertex(330, 200); //set the first anchor point , need a vertex here v1
  bezierVertex(400, 321, 240, 440, 100,300);//c1,c2,v2
  endShape();


}



