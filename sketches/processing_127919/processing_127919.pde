
int Y_AXIS = 1;
color c1, c2;

void setup(){
  size(800,450);
  
  c1 = color(255, 250, 205);
  c2 = color(135, 206, 235);  
  setGradient(0, 0, 800, 450, c1, c2, Y_AXIS);

  noStroke();
  
  fill(255,99,71);
  ellipse(120,120,200,200);
   
  fill(178,34,34);
  ellipse(175,185,60,60);
  
  fill(0,0,0);
  ellipse(120,120,150,150);
  
  fill(78,0,130);
  ellipse(120,120,80,80); 
  
  stroke(1);
  line(650,250,780,250);
  line(650,320,780,320);
  line(650,285,780,285);  
  line(680,220,680,350);
  line(720,220,720,350); 
  line(760,220,760,350);
  
  noStroke();
  fill(255,255,255);
  rect(680,250,40,35);
  rect(720,285,40,35);
  
  stroke(255,50,0);
  noFill();
  arc(450,200,50,50,PI,TWO_PI);
  arc(495,200,40,40,PI,TWO_PI);
  arc(530,200,30,30,PI,TWO_PI);
  
  noStroke();
  fill(255,215,0);
  triangle(700,420,738,380,760,430);
    
  noStroke();
  fill(255,99,71);
  ellipse(570,95,50,50);
  
  stroke(0,0,0);
  fill(255,215,0,200);
  strokeWeight(2);
  ellipse(550,100,50,50);
  
  noFill();
  strokeWeight(1);
  bezier(200,400,100,400,100,100,50,400);

  fill(218,165,32);
  noStroke();
  triangle(380,380,460,320,480,380);  
  
  fill(46,139,87);
  quad(490,300,510,380,480,380,460,320);
  
  
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  } 
}



