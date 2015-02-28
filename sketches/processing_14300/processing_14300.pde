
//vertex
noStroke();
fill(85, 180, 123);
beginShape();
vertex(100,280);
vertex(540,160);
vertex(480,300);
vertex(420,320);
vertex(420,260);
vertex(120,340);
vertex(100,280);
endShape(CLOSE);

float f;   
// arrow quad button
 noStroke();
if (mousePressed && insideQuad(100,280,520,140,420,240,120,340)
||insideQuad(520,140,500,280,440,300,400,180)
||insideQuad(600,420,600,480,300,580,280,520)) {
    f = random(255);
  }
  else {
    f= 0;
  }
  fill(f);
  quad(100,280,520,140,420,240,120,340);
  quad(520,140,500,280,440,300,400,180); 
  quad(600,420,600,480,300,580,280,520);
//ellipse
fill(22, 196, 233);
ellipse(260,260,120,120);
//arc
noFill();
stroke(191, 237, 248);
strokeWeight(20);
arc(260,260, 80,80,radians(150), radians(330));
//arc
noFill();
stroke(0);
strokeWeight(30);
arc(260,260, 180,180,radians(110), radians(330));
//arc
noFill();
stroke(70);
strokeWeight(5);
arc(260,260, 80,80,radians(30), radians(60));
//arc
noFill();
stroke(0);
strokeWeight(20);
arc(260,260, 200,200,radians(15), radians(80));
//arc
noFill();
stroke(70);
strokeWeight(10);
arc(260,260, 180,180,radians(15), radians(80));
 
//ellipse
fill(241, 245, 66);
noStroke();
ellipse(280,280,10,10);
//ellipse
fill((color(random(255),random(255),random(0))));
noStroke();
ellipse(260,260,40,40);
 









