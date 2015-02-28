

//easing
float x = 0.0; 
float y = 0.0; 
float easing = 0.1;//0.0 -1 





void setup() {
  size(600,600);
}
void draw() {

  background(0);
  //background//
  noCursor();


  stroke(random(255),mouseY,mouseX);
  strokeWeight(3);
  line(600,370,300,630);
  line(600,370,0,380);
  line(600,370,0,400);
  line(600,370,200,600);
  line(600,370,0,560);
  line(600,370,375,670);
  line(600,370,550,770);
  strokeWeight(7);
  line(600,379,0,420);
  line(600,370,0,350);
  line(600,370,0,470);
  line(600,370,0,570);
  line(600,370,250,620);
  strokeWeight(15); 
  line(600,375,0,545);
  line(600,370,0,510);
  line(600,370,325,640);
  line(600,370,580,780);
  line(600,375,50,635);
  line(600,370,450,720);
  strokeWeight(20);
  line(600,370,400,690);
  line(600,375,500,755);



  //pacman

  //fill(random(255),random(255),random(255),random(255));
  fill(255,216,0,250);
  stroke(random(255),random(255),random(255),random(255));
  strokeWeight(20);
  ellipse(200,200,300,300);
  //1(object)


  //triangle 

  fill(0);

  stroke(0);
  strokeWeight(10);
  triangle(200,200,950,200,600,360);
  //5(object)



  fill(148,87,165);
  strokeWeight(0);
  stroke(55,100,150);
  beginShape();
  vertex(270,500);
  vertex(270,440);
  vertex(280,440);
  vertex(280,430);
  vertex(330,430);
  vertex(330,440);
  vertex(340,440);
  vertex(340,500);
  vertex(330,500);
  vertex(330,490);
  vertex(320,490);
  vertex(320,500);
  vertex(310,500);
  vertex(310,490);
  vertex(300,490);
  vertex(300,500);
  vertex(290,500);
  vertex(290,490);
  vertex(280,490);
  vertex(280,500);
  vertex(270,500);

  endShape();


  fill(239,0,5);
  strokeWeight(0);
  stroke(55,100,150);
  beginShape();
  vertex(470,400);
  vertex(470,340);
  vertex(480,340);
  vertex(480,330);
  vertex(530,330);
  vertex(530,340);
  vertex(540,340);
  vertex(540,400);
  vertex(530,400);
  vertex(530,390);
  vertex(520,390);
  vertex(520,400);
  vertex(510,400);
  vertex(510,390);
  vertex(500,390);
  vertex(500,400);
  vertex(490,400);
  vertex(490,390);
  vertex(480,390);
  vertex(480,400);
  vertex(470,400);

  endShape();





  fill(3,0,185);
  strokeWeight(0);
  stroke(55,100,150);
  beginShape();
  vertex(470,200);
  vertex(470,140);
  vertex(480,140);
  vertex(480,130);
  vertex(530,130);
  vertex(530,140);
  vertex(540,140);
  vertex(540,200);
  vertex(530,200);
  vertex(530,190);
  vertex(520,190);
  vertex(520,200);
  vertex(510,200);
  vertex(510,190);
  vertex(500,190);
  vertex(500,200);
  vertex(490,200);
  vertex(490,190);
  vertex(480,190);
  vertex(480,200);
  vertex(470,200);

  endShape();



  fill(255,169,8);
  strokeWeight(0);
  stroke(55,100,150);
  beginShape();
  vertex(70,550);
  vertex(70,490);
  vertex(80,490);
  vertex(80,480);
  vertex(130,480);
  vertex(130,490);
  vertex(140,490);
  vertex(140,550);
  vertex(130,550);
  vertex(130,540);
  vertex(120,540);
  vertex(120,550);
  vertex(110,550);
  vertex(110,540);
  vertex(100,540);
  vertex(100,550);
  vertex(90,550);
  vertex(90,540);
  vertex(80,540);
  vertex(80,550);
  vertex(70,550);

  endShape();







  if (mousePressed==true) {


    //dessin point par point

    fill(random(255),random(255),random(255),random(255));
    strokeWeight(0);
    stroke(55,100,150);
    beginShape();
    vertex(270,500);
    vertex(270,440);
    vertex(280,440);
    vertex(280,430);
    vertex(330,430);
    vertex(330,440);
    vertex(340,440);
    vertex(340,500);
    vertex(330,500);
    vertex(330,490);
    vertex(320,490);
    vertex(320,500);
    vertex(310,500);
    vertex(310,490);
    vertex(300,490);
    vertex(300,500);
    vertex(290,500);
    vertex(290,490);
    vertex(280,490);
    vertex(280,500);
    vertex(270,500);

    endShape();


    fill(random(255),random(255),random(255),random(255));
    strokeWeight(0);
    stroke(55,100,150);
    beginShape();
    vertex(470,400);
    vertex(470,340);
    vertex(480,340);
    vertex(480,330);
    vertex(530,330);
    vertex(530,340);
    vertex(540,340);
    vertex(540,400);
    vertex(530,400);
    vertex(530,390);
    vertex(520,390);
    vertex(520,400);
    vertex(510,400);
    vertex(510,390);
    vertex(500,390);
    vertex(500,400);
    vertex(490,400);
    vertex(490,390);
    vertex(480,390);
    vertex(480,400);
    vertex(470,400);

    endShape();





    fill(random(255),random(255),random(255),random(255));
    strokeWeight(0);
    stroke(55,100,150);
    beginShape();
    vertex(470,200);
    vertex(470,140);
    vertex(480,140);
    vertex(480,130);
    vertex(530,130);
    vertex(530,140);
    vertex(540,140);
    vertex(540,200);
    vertex(530,200);
    vertex(530,190);
    vertex(520,190);
    vertex(520,200);
    vertex(510,200);
    vertex(510,190);
    vertex(500,190);
    vertex(500,200);
    vertex(490,200);
    vertex(490,190);
    vertex(480,190);
    vertex(480,200);
    vertex(470,200);

    endShape();



    fill(random(255),random(255),random(255),random(255));
    strokeWeight(0);
    stroke(55,100,150);
    beginShape();
    vertex(70,550);
    vertex(70,490);
    vertex(80,490);
    vertex(80,480);
    vertex(130,480);
    vertex(130,490);
    vertex(140,490);
    vertex(140,550);
    vertex(130,550);
    vertex(130,540);
    vertex(120,540);
    vertex(120,550);
    vertex(110,550);
    vertex(110,540);
    vertex(100,540);
    vertex(100,550);
    vertex(90,550);
    vertex(90,540);
    vertex(80,540);
    vertex(80,550);
    vertex(70,550);

    endShape();
  };


  fill(255);
  ellipse(125,510,15,15); 
  ellipse(100,510,15,15); 
  ellipse(290,460,15,15); 
  ellipse(320,460,15,15); 
  ellipse(510,360,15,15);
  ellipse(480,360,15,15);
  ellipse(520,160,15,15);
  ellipse(490,160,15,15);


fill(0);
  ellipse(125,510,5,5); 
  ellipse(100,510,5,5); 
  ellipse(290,460,5,5); 
  ellipse(320,460,5,5); 
  ellipse(510,360,5,5);
  ellipse(480,360,5,5);
  ellipse(520,160,5,5);
  ellipse(490,160,5,5);


  //souris

  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX - x) * easing;
  y += (targetY - y) * easing;
  noFill(); 
  stroke(255); 
  strokeWeight(2);
  ellipse(mouseX,mouseY,80,80); 
  ellipse(mouseX,mouseY,50,50);
  ellipse(x,y,10,10);
  line(mouseX,mouseY,mouseX + 50, mouseY );
  line(mouseX,mouseY,mouseX, mouseY + 50);
  line(mouseX,mouseY,mouseX -50, mouseY);
  line(mouseX,mouseY,mouseX, mouseY - 50 );
  //easing
  float x = 0.0; 
  float y = 0.0; 
  float easing = 0.1;//0.0 -1
}


