
//General Spacial and Color Rules

  void draw(){ 
  size(202, 119);  
  smooth();
  PFont font;
 
 
//Yellow Box
  fill(249, 211, 43);
  noStroke();
  rect(0,70,60,60);


//Light Green Box
  fill(105, 153, 79);
  noStroke();
  rect(0, 0,90, 69);

//Dark Green/Teal armchair
  beginShape();
  stroke(1);
  strokeWeight(4);
  
 //Semi-straight line up to halfway
  curveVertex(60, 140); //  start  point
  curveVertex(60, 140); //  also the start point
  curveVertex(60, 60);
  curveVertex(65, 30);
  curveVertex(75, 10);
  curveVertex(95, 0);
  endShape();

//Begin Main Arc
  fill(0, 70, 74);
  arc(125, 50, 130, 120, PI, 50); // 180 degrees

//Black Circle
  fill(5,8,17);
  ellipse(100,40,76,80);
  
//White Spiral
  stroke(255);
  noFill();
  beginShape();
  vertex(100, 40); // first point
  bezierVertex(60, 40, 150, 110, 120, 0);
  bezierVertex(20, -30, 75, 130, 120, 80);
  endShape();
  
//Orange Line
  stroke(244, 170, 47);
  noFill();
  line(0, 90, 20, 90);
    line(20, 110, 20, 90);
        line(20, 110, 40, 110);
             line(40, 110, 40, 90);
                 line(40, 90, 55, 92);
 
 
  // font
 
  font = loadFont("AllerDisplay-24.vlw");
  textFont(font);
  fill(139, 31, 120);
  text("Art is a lie that", 5, 50);
  text("makes us realize", 5, 70);
  text("truth.", 5, 90);
  text("-Pablo Picasso", 40, 112);
}


