
float x = 0.0;
float y = 0.0;
float easing = 0.1;//0.0 -1

PFont font;
String letters = "";


void setup() {
  size(600, 600);
  smooth();
}

void draw() {





  //background
  {
    float mapColor = map(mouseX, 600,0, 0,60);
    fill(mapColor);
    rect(0,0, width, height);
  }



  //dot
  for (int y = 0; y <= height; y += 20) {
    for (int x = 0; x <= width; x += 20) {
      fill(35);
      noStroke();
      ellipse(x, y, 5, 5);
    }
  } 







  //bgcircle
  noStroke();
  smooth();
  fill(30);
  ellipse(302,275,460,460);
  fill(0);
  ellipse(260,307,340,340);
  fill(30);
  ellipse(230,335,240,240);
  fill(0);
  ellipse(207,355,165,165);
  fill(30);
  ellipse(190,370,110,110);
  fill(0);//
  ellipse(180,380,70,70);





  //object
  smooth();
  fill(255);

  noStroke();
  //1
  {
    if (mousePressed == true) {
      if (mouseButton == LEFT)
        fill(251,227,255);
      else if (mouseButton == RIGHT)
        fill(148,209,32);
    }
    else {
      fill(255);
    }
    quad(380,360,585,320,460,528,340,440);
    triangle(207,480,240,560,160,540);
    triangle(100,400,100,420,80,420);
    ellipse(80,400,40,40);
    ellipse(125,305,26,26);
    ellipse(195,300,18,18);
    ellipse(220,340,11,11);
    ellipse(221,367,7,7);
    ellipse(213.5,386,5,5);
    ellipse(201,398,4.2,4.2);
    ellipse(185,402,3.3,3.3);
    ellipse(172.5,396.4,2.2,2.2);
    ellipse(165.1,387.5,1.7,1.7);
    ellipse(166,379,1.5,1.5);
    ellipse(169,374,1.3,1.3);
    ellipse(175,372,1.1,1.1);
    ellipse(181,376,0.9,0.9);
  }





  //2
  {
    if (mousePressed == true) {
      if (mouseButton == LEFT)
        fill(197,22,216);
      else if (mouseButton == RIGHT)
        fill(255,252,227);
    }
    else {
      fill(255);
    }
    quad(380,20,520,200,340,340,200,160);
    quad(280,500,300,488,380,540,280,580);
    triangle(101.6,440,148,470,101.6,500);
    ellipse(100,470,40,58.4);
    triangle(106.5,345.5,100,356,91,355.5);
    ellipse(92.5,340,30,30);
    ellipse(165,290,21,21);
    ellipse(214,320,14,14);
    ellipse(222.5,355.5,8,8);
    ellipse(218,377,6,6);
    ellipse(208,393,4.7,4.7);
    ellipse(193,401,3.8,3.8);
    ellipse(178,400,2.8,2.8);
    ellipse(168,392,1.8,1.8);
    ellipse(165.3,383,1.6,1.6);
    ellipse(168,375,1.4,1.4);
    ellipse(171.3,372,1.2,1.2);
    ellipse(179,374,1,1);
    ellipse(182,378,0.6,0.6);
  }








  //layout1
  {
    if (mousePressed == true) {
      if (mouseButton == LEFT)
        fill(197,22,216);
      else if (mouseButton == RIGHT)
        fill(29,58,1);
    }
    else {
      fill(190);
    }
    quad(110,0,130,0,163,238.5,154,240);
    quad(0,210,0,165,100,275,91.5,282);
    quad(82,500,87,505,10,600,0,580);
    quad(0,580,10,580,10,600,0,600);
    quad(390,565,400,560,440,600,410,600);
    quad(483,521.5,600,580,600,590,480,529);
  }

  //layout2
  {
    if (mousePressed == true) {
      if (mouseButton == LEFT)
        fill(80,0,91);
      else if (mouseButton == RIGHT)
        fill(148,209,3);
    }
    else {
      fill(255);
    }
    quad(0,0,80,0,80,70,0,70);
    quad(0,70,80,0,150,260,132.5,272);
    quad(0,260,0,236,79,290,75,295);
    quad(0,454.5,60,430,65,440,0,475);
    quad(400,540,410,526,523,600,460,600);
    quad(75,480,77,485,0,556,0,545);
    quad(100,520,130,540,112,600,45,600);
  }


  //mouseover
  {
    noStroke();
    noFill();
    int x =342;
    int y =126;
    int w =120;
    int h =120;
    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y + h)) {
      fill(148,209,32);
    }
    else {
      fill(197,22,216);
    }
    rect(x,y,w,h);
  }








  //text
  fill(0);
  {
    text(letters, 280, 100, 160, 160);
    text(letters, 380, 360, 120, 112);
    text(letters, 285, 500, 40, 71);
    text(letters, 188, 500, 30, 50);
    text(letters, 85, 445, 35, 50);
    text(letters, 67, 385, 30, 30);
    text(letters, 83, 324, 25, 30);

    if( keyPressed == true ) {
      letters = letters + key;
    }
  }






  //easing
  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX- x)*easing;
  y += (targetY- y)*easing;
  noFill();
  stroke(255);
  strokeWeight(2);
  ellipse(mouseX,mouseY,80,80);
  ellipse(mouseX,mouseY,50,50);
  strokeWeight(3);
  ellipse(mouseX,mouseY,40,40);
  strokeWeight(1);
  ellipse(x,y,20,20);
  fill(255);
  ellipse(mouseX,mouseY,30,30);
  strokeWeight(3);
  ellipse(x,y,10,10);
}


