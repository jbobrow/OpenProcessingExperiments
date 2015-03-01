

void setup() {
size(500,500);
background(75);
  frameRate(10);

  smooth();
  
  fill(0);
  ellipse(245,389,300,100);
 //body
strokeWeight(1);
fill(255,204,51);
rect(180,250,130,130);
fill(200);
rect(191,262,108,108);
fill(222,178,44);
quad(180,250,310,250,280,220,210,220);

//Neck
fill(222,178,44);
strokeWeight(1);
rect(236,237,20,-30);
quad(236,209,257,209,260,180,232,180);
rect(238,180,13,-40);
rect(220,153,60,-20);

//eyes
fill(150);
stroke(150);
ellipse(293,153,40,40);
ellipse(196,153, 40,40);
quad(209,171,234,155,234,122,193,134);
quad(283,171,255,155,259,122,300,134);
fill(157,44,222);
stroke(0);
strokeWeight(4);
ellipse(216,144,22,22);
ellipse(275,144, 22,22);
strokeWeight(2);
stroke(255);
fill(20);
ellipse(216,144,7,7);
ellipse(275,144, 7,7);

//feet
strokeWeight(1);
stroke(0);
fill(125,94,64);
rect(188,381,50,14);
rect(250,381,50,14);
rect(188,398,50,8);
rect(250,398,50,8);

//hands
strokeWeight(1);
fill(150);
rect(161,287,18,55);
rect(311,287,18,55);
fill(175);
quad(171,306,202,320,202,303,171,293);
quad(171,327, 202,337,202,326,171,314);
quad(319,312,288,320,287,304,320,297);
quad(319,334,288,340,287,326,319,321);

}
void draw() {
    int x =int(random(20,220));
  fill(231,118,x);
  stroke(231,118,x);
 triangle(269,42,245,85,221,44);
  ellipse(235,42,25,30);
  ellipse(255,42,25,30);

    }






