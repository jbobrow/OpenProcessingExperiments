
//Was bewirkt der Knopf RUN CODE ?


void setup(){
  stroke(255);
  strokeWeight(4);
  background(0,0,0);
  size(800,800);
  frameRate(15); 
  smooth();
};

void draw(){
    background(45,179,34);

    fill(0,160,255);
    noStroke();
    rect(0,0, 800, 250);

    strokeWeight(6);
    stroke(249,240,0);
    line(0, 0, 300, 240);
    line(0, 0, 200, 240);
    line(0, 0, 100, 240);
    line(0, 0, 400, 240);
    line(0, 0, 500, 200);
    line(0, 0, 500, 100);
    line(0, 0, 450, 30);
    line(0, 0, 25, 240);
    noStroke();

    fill(249,240,0);
    ellipse(0, 0, 150, 150);

    fill(255,255,255);
    ellipse(100, 100, 70, 70);
    ellipse(150, 75, 70, 70);
    ellipse(200, 75, 70, 70);
    ellipse(250, 100, 70, 70);
    ellipse(200, 125, 70, 70);
    ellipse(150, 125, 70, 70);

    ellipse(350, 150, 70, 70);
    ellipse(400, 125, 70, 70);
    ellipse(450, 125, 70, 70);
    ellipse(500, 150, 70, 70);
    ellipse(450, 175, 70, 70);
    ellipse(400, 175, 70, 70);

    ellipse(650, 100, 70, 70);
    ellipse(700, 75, 70, 70);
    ellipse(750, 75, 70, 70);
    ellipse(800, 100, 70, 70);
    ellipse(750, 125, 70, 70);
    ellipse(700, 125, 70, 70);

    noFill();
    strokeWeight(50);
    stroke(217,224,225);
    arc(460, 450, 500, 500, 0, HALF_PI);
    strokeWeight(1);
    stroke(0,0,0);

    fill(217,224,225);
    ellipse(400, 350, 130, 130);
    ellipse(150, 350, 130, 130);

    fill(255,200,200);
    ellipse(400, 350, 70, 70);
    ellipse(150, 350, 70, 70);

    ellipse(150, 350, 70, 70);

    fill(217,224,225);
    ellipse(278, 730, 400, 400);


    fill(217,224,225);
    ellipse(278, 500, 400, 400);

    fill(255,251,251);
    ellipse(200, 400, 60, 35);
    ellipse(350, 400, 60, 35);
    fill(242,106,100);
    triangle(238,500, 318, 500, 278, 550);

    line(318,500, 450, 550);
    line(318,500, 425, 500);
    line(318,500, 450, 450);
    line(238,500, 100, 550);
    line(238,500, 125, 500);
    line(238,500, 110, 450);

    fill(217,224,225);
    arc(238, 550, 80, 120, 0, HALF_PI*2);
    arc(318, 550, 80, 120, 0, HALF_PI*2);

    fill(0,160,255);
    textSize(150);
    text("Cat",150, 800);


    fill(14,195,208);
    ellipse(200, 400, 20, 35);
    ellipse(350, 400, 20, 35);

    fill(0,0,0);
    ellipse(200, 400, 8, 14);
    ellipse(350, 400, 8, 14);

    noStroke();
    fill(198,136,67);
    triangle(650, 200, 690, 350, 610, 350);
    stroke(0, 0, 0);
    var dx = random(-100,100);
    var dy = random(-100,100);
    stroke(random(220), random(155), random(100));
    line(650,200,650+dx,200+dy);
    var dx = random(-100,100);
    var dy = random(-100,100);
    stroke(random(220), random(155), random(100));
    line(650,200,650+dx,200+dy);
    var dx = random(-100,100);
    var dy = random(-100,100);
    stroke(random(220), random(155), random(100));
    line(650,200,650+dx,200+dy);
  
    var dx = random(-100,100);
    var dy = random(-100,100);
    stroke(random(220), random(155), random(100));
    line(650,200,650+dx,200+dy);
    noStroke();
    fill(249,2,2);
    arc(588, 425,25, 25,PI,TWO_PI);
    arc(612, 425,25, 25,PI,TWO_PI);
    triangle(600, 455, 575, 425, 625, 425);
  
 
  
};
