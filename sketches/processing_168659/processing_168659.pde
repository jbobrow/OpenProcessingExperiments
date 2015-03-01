
void setup(){
  size(800,800);
}
void draw(){
  println(mouseX+","+mouseY);
  background(255,255,0);
  fill(253,223,122);
  ellipse(400, 400, 480, 600 );
  strokeWeight(10);
  stroke(253,223,122);
  line(117,312, 129,378);
  strokeWeight(1);
  noStroke();
  ellipse(640,345, 80,100);
  ellipse(667,310, 50,70);
  ellipse(160,339,85,100);
  line(118,309, 129,377);
  stroke(0);
  //oreja derecha
  arc(661, 300, 70, 70, -PI, 0.7);
  arc(661, 300, 40, 40, -PI, 0.7);
  arc(650, 380, 40, 40, -0.1,2);
  arc(650, 380, 20, 20, -0.1,2);
  line(687,322, 669,379);
  line(676,312, 660,378);
  fill(253,223,122);
  //oreja izquierda
  arc(143, 300, 70, 70, 2.7 ,6);
  arc(143, 300, 40, 40, 2.7 ,6);
  arc(142, 380 ,35, 35 , -0.2, 3.3);
  arc(142, 380 ,20, 20 , -0.2, 3.3);
  line(111,313, 124,377);
  line(124,308, 133,378);
 //ojo derecho
 fill(255);
 ellipse(490,310, 100, 70);
 noFill();
 fill(157, 79, 0);
 ellipse(490, 310 , 60, 50);
 strokeWeight(20);
 point(490, 310);
 strokeWeight(1);
 //ojo izquierdo
 fill(255);
 ellipse(305,310, 100, 70);
 noFill();
 fill(157, 79, 0);
 ellipse(305,310, 60 ,50);
 strokeWeight(20);
 point(305, 310);
 strokeWeight(1);
 
 //cejas
 fill(0);
 triangle(531,258, 441,272, 528, 274);
 triangle(253,258, 351,270, 259, 276);
 noFill();
 
 //pelo!!
 fill(0);
 ellipse(217,206, 70,70);
 ellipse(250,157, 80,80);
 ellipse(293,132, 90,90);
 ellipse(347,107, 90,90);
 ellipse(402, 103, 90,90);
 ellipse(466,109,90,90);
 ellipse(517,137, 80,80);
 ellipse(556,172, 70,70);
 ellipse(583,206, 60,60);
 triangle(232,238, 179,321, 182,215);
 triangle(567,233, 619,319, 615,214);
 strokeWeight(10);
 line(247,206, 340,140);
 line(568,225, 483,151);
 line(337,146, 456,144);
 stroke(157,79,0);
 strokeWeight(1);
 noFill();
 
 //nariz
 stroke(0);
 line(392,362, 364,430);
 arc(388,439 ,50,50, 0.9,3.5);
 
 //boca
fill(255,0,0);
beginShape();
vertex(303,522);
vertex(365,514);
vertex(365,514);
vertex(376,519);
vertex(376,519);
vertex(382,527);
vertex(382,527);
vertex(389,520);
vertex(389,520);
vertex(403,516);
vertex(403,516);
vertex(466,519);
vertex(303,522);
vertex(382,538);
vertex(382,538);
vertex(466,519);
endShape();
noFill();

//pecas
strokeWeight(5);
point(507,441);
point(520,472);
point(545,443);
point(272,480);
point(300,456);
point(267,440);
strokeWeight(1);
 
//lagrimas
fill(0,255,255);
arc(466,367, 20,20, -0.6,3.5);
line(456,362, 462,347);
line(463,347, 475,363);
noStroke();
triangle(457,364, 463,347, 474,363);
ellipse(465,366, 15,20);
   
}


