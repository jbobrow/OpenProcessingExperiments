
class Body {
  
int   bodywidth = 77;
int   R = 234;
int   B = 255;
int   tx1 = 75;
int   ty1 = 80;
int   tx2 = 103;
int   tx3 = 130;
int   tdiam = 20;
int   nuby = 70;
int   nubwidth = 20;
int   nubheight = 10;
int   eye = 10;
int   pupil = 4;



void displaybody() {
      noStroke();
      fill(R,mouseX,mouseY);
      ellipse(center,45,bodywidth,bodywidth);
      rect(center,60,bodywidth,22);
      fill(24,196,214);
      rect(center,bodywidth,80,14);

//first twirly

      fill(R,mouseX,mouseY);
      ellipse(tx1,80,tdiam,tdiam);
      fill(24,196,214);
      ellipse(tx1+3,80,tdiam,tdiam);

      fill(R,mouseX,mouseY);
      ellipse(tx1,100,tdiam,tdiam);
      fill(24,196,214);
      ellipse(tx1-3,100,tdiam,tdiam);

      fill(R,mouseX,mouseY);
      ellipse(tx1,120,tdiam,tdiam);
      fill(24,196,214);
      ellipse(tx1+3,120,tdiam,tdiam);

      fill(R,mouseX,mouseY);
      ellipse(tx1,140,tdiam,tdiam);
      fill(24,196,214);
      ellipse(tx1-3,140,tdiam,tdiam);

      fill(R,mouseX,mouseY);
      ellipse(tx1,160,tdiam,tdiam);
      fill(24,196,214);
      ellipse(tx1+3,160,tdiam,tdiam);

      fill(R,mouseX,mouseY);
      ellipse(tx1,180,tdiam,tdiam);
      fill(24,196,214);
      ellipse(tx1-3,180,tdiam,tdiam);

//second twirly

      fill(R,mouseX,mouseY);
      ellipse(tx2,85,tdiam,tdiam);
      fill(24,196,214);
      ellipse(tx2-3,85,tdiam,tdiam);

      fill(R,mouseX,mouseY);
      ellipse(tx2,105,tdiam,tdiam);
      fill(24,196,214);
      ellipse(tx2+3,105,tdiam,tdiam);

      fill(R,mouseX,mouseY);
      ellipse(tx2,125,tdiam,tdiam);
      fill(24,196,214);
      ellipse(tx2-3,125,tdiam,tdiam);
  
      fill(R,mouseX,mouseY);
      ellipse(tx2,145,tdiam,tdiam);
      fill(24,196,214);
      ellipse(tx2+3,145,tdiam,tdiam);

//third twirly

      fill(R,mouseX,mouseY);
      ellipse(tx3,70,tdiam,tdiam);
      fill(24,196,214);
      ellipse(tx3+3,70,tdiam,tdiam);
    
    
      fill(R,mouseX,mouseY);
      rect(tx3-3,65,20,10);
      fill(234,mouseX,mouseY);
      ellipse(tx3,90,tdiam,tdiam);
      fill(24,196,214);
      ellipse(tx3-3,90,tdiam,tdiam);

      fill(R,mouseX,mouseY);
      ellipse(tx3,110,tdiam,tdiam);
      fill(24,196,214);
      ellipse(tx3+3,110,tdiam,tdiam);

      fill(R,mouseX,mouseY);
      ellipse(tx3,130,tdiam,tdiam);
      fill(24,196,214);
      ellipse(tx3-3,130,tdiam,tdiam);

      fill(R,mouseX,mouseY);
      ellipse(tx3,150,tdiam,tdiam);
      fill(24,196,214);
      ellipse(tx3+2,150,tdiam,tdiam);

      fill(R,mouseX,mouseY);
      ellipse(tx3,170,tdiam,tdiam);
      fill(24,196,214);
      ellipse(tx3-3,170,tdiam,tdiam);

//legs   
    
    strokeWeight(1);
    stroke(155,10,196);
    line(71,70,71,175);
    line(87,70,87,125);
    line(103,70,103,125);
    line(118,70,118,150);
    line(134,70,134,150);

    stroke(255);
    line(63,70,63,150);
    line(79,70,79,150);
    line(95,70,95,150);
    line(110,70,110,175);
    line(126,70,126,175);




//nubs
  noStroke();
  fill(R,mouseX,mouseY);
  ellipse(71,nuby,nubwidth,nubheight);
  ellipse(90,nuby,nubwidth,nubheight);
  ellipse(109,nuby,nubwidth,nubheight);
  ellipse(128,nuby,nubwidth,nubheight);

//face
  fill(255);
  ellipse(110,55,eye,eye);
  ellipse(125,55,eye,eye);
  fill(155,10,196);
  ellipse(110,55,pupil,pupil);
  ellipse(125,55,pupil,pupil);

//mouth

  fill(59,1,47);
  ellipse(127,67,6,4);

//monacle

  stroke(0);
  noFill();
  ellipse(125,55,15,15);

//hat

  stroke(59,1,47);
  strokeWeight(3);
  fill(59,1,47);
  quad(65,10,74,18,84,10,75,2);
  strokeWeight(4);
  line(70,23,90,8);

//spots

  noStroke();
  fill(255);

  ellipse(100,10,4,2);
  ellipse(110,15,5,2);
  ellipse(85,20,6,3);
  ellipse(96,15,4,2);
  ellipse(120,18,5,2.5);
}}

