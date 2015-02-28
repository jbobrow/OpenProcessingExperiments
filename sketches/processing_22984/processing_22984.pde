
void setup () {
  size(800,800);
  background(245,200,211);
  smooth();
  strokeWeight(6);
}

void draw () {
background(245,200,211);
 //FEET
fill(169,66,234);
ellipse(360,560,80,60);
ellipse(460,560,80,60);

fill(145,232,220);

//ARMS
strokeWeight(30);
stroke(169,66,234);
line(100,400,400,400);
line(400,400,700,400);

strokeWeight(6);
stroke(0);
//BODY
ellipse(400,400,300,300);
fill(240,70,51);
ellipse(400,420,40,30);
pmouseX=400;
pmouseY=480;
fill(0);
ellipse(pmouseX,pmouseY,mouseX,mouseY);

//HAIR
fill(85,59,46);
ellipse(300,240,80,80);
ellipse(500,240,80,80);
fill(169,66,234);
triangle(252,230,252,280,302,280);
triangle(302,280,352,280,352,230);
triangle(452,230,452,280,502,280);
triangle(502,280,552,280,552,230);

//EYES
fill(0);
ellipse(370,360,30,50);
ellipse(430,360,30,40);
}

void keyPressed () {
fill(255);
ellipse(370,360,30,50);
ellipse(430,360,30,40);
}

void mousePressed () {
  println("BAM");
}

