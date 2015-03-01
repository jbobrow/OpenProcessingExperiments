

float a = 0.0;
float s = 0.0;

void setup() {
  size(800,800);
}

void draw() {
  
  strokeWeight(6.0);
  strokeCap(ROUND);
  stroke(171,154,132);
  fill(115,74,21);              //body organic
  ellipse(400,400,500,600);
    noStroke();                //body non-organic
    rect(153,400,495,700,25);
      rotate(-0.6);
      fill(171,154,132);       //body shine
      ellipse(150,296,140,60);
        rotate(0.6);
        fill(242,124,163);        //nose
        ellipseMode(CENTER);
        ellipse(400,400,240,120);
          fill(250,222,240);
          ellipse(340,375,70,50);
            strokeWeight(2.0);
            stroke(26,32,94);
            fill(0,0,0);            //eyes
            ellipseMode(CENTER);
            ellipse(300,280,40,100);
            ellipse(500,280,40,100);
            noStroke();
            fill(255,255,255);    //eye sparkles
            ellipseMode(CENTER);
            ellipse(300,257,30,50);
            ellipse(500,257,30,50);
              stroke(156,145,112);
              fill(105,86,31);        //dirt clumps
              rect(700,700,100,100);
              rect(550,650,200,200);
              rect(400,730,150,150);
              rect(300,675,175,175);
              rect(100,650,200,200);
              rect(200,710,200,220);
              rect(0,720,200,200);
}


