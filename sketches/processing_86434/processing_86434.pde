
// © Julia Shen 2013
// yuans @ andrew.cmu.edu

size(400, 400 ); 
background(255, 211, 179);
smooth();

float x, y, wd, ht;
x = 100;
y = 100;
wd = 200;
ht = 200;

// temporary bounding box
noFill();
stroke(255);
strokeWeight(5);

// face
fill(252, 234, 222);
stroke(255);
strokeWeight(2);
ellipse (x + 0.5 * wd, y + 0.35 * ht, 1.25 * wd, 1.25 * ht);

// circles
noFill();
stroke(255);
strokeWeight(2);
ellipse (x + 0.5 * wd, y + 0.35 * ht, 1.29 * wd, 1.29 * ht);
ellipse (x + 0.5 * wd, y + 0.35 * ht, 1.33 * wd, 1.33 * ht);


// j

noFill();
stroke(255, 141, 141);
strokeWeight(3);

beginShape();
  curveVertex(x + 0.48 * wd, y - 0.1 * ht);

  curveVertex(x + 0.5 * wd, y);
  curveVertex(x + 0.53 * wd, y + 0.45 * ht);
  curveVertex(x + 0.5 * wd, y + 0.5 * ht);
  curveVertex(x + 0.45 * wd, y + 0.4 * ht);
  
  curveVertex(x + 0.4 * wd, y + 0.35 * ht);

endShape();


// glasses
noFill();
stroke(255);
strokeWeight(3);
beginShape();
    
  curveVertex(x - 0.1 * wd, y - 0.1 * ht); 
  
  curveVertex(x, y);  
  curveVertex(x + 0.1 * wd, y + 0.25 * ht);
  curveVertex(x + 0.2 * wd, y + 0.3 * ht);
  curveVertex(x + 0.35 * wd, y + 0.25 * ht);
  curveVertex(x + 0.45 * wd, y);
  
  curveVertex(x + 0.5 * wd, y - 0.1 * ht);
  
endShape();

beginShape();

  curveVertex(x + 0.5 * wd, y - 0.1 * ht); 
  
  curveVertex(x + 0.55 * wd, y);  
  curveVertex(x + 0.65 * wd, y + 0.25 * ht);
  curveVertex(x + 0.75 * wd, y + 0.3 * ht);
  curveVertex(x + 0.9 * wd, y + 0.25 * ht);
  curveVertex(x + wd, y);
  
  curveVertex(x + 1.1 * wd, y - 0.1 * ht);

endShape();

line(x, y, x + wd, y); 


// moustache

fill(255);
stroke(255);
strokeWeight(3);

beginShape();
  
  curveVertex(x + 0.15 * wd, y + 0.7 * ht);
  
  curveVertex(x + 0.2 * wd, y + 0.65 * ht);
  curveVertex(x + 0.35 * wd, y + 0.57 * ht);
  curveVertex(x + 0.5 * wd, y + 0.56 * ht);
  curveVertex(x + 0.35 * wd, y + 0.68 * ht);
  curveVertex(x + 0.2 * wd, y + 0.65 * ht);
 
  curveVertex(x + 0.15 * wd, y + 0.7 * ht);

endShape();


beginShape();
  
  curveVertex(x + 0.85 * wd, y + 0.7 * ht);
  
  curveVertex(x + 0.8 * wd, y + 0.65 * ht);
  curveVertex(x + 0.65 * wd, y + 0.57 * ht);
  curveVertex(x + 0.5 * wd, y + 0.56 * ht);
  curveVertex(x + 0.65 * wd, y + 0.68 * ht);
  curveVertex(x + 0.8 * wd, y + 0.65 *  ht);
 
 curveVertex(x + 0.85 * wd, y + 0.7 * ht);
 
endShape();

//saveFrame("hw2.jpg");



