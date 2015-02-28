

PFont font1;
PImage img1;

String p1 = "My Dearest Sixsmith,";
String p2 = "Its done. ";
String p3 = "Finished in a frenzy that reminded me of our last night in Cambridge.";
String p4 = "Watched my final sunrise, enjoyed my last cigarette. ";
String p5 = "Didn’t think that you could be any more perfect";
String p6 = "until I saw the beat up trilby. ";
String p7 = "Honestly Sixsmith, ";
String p8 = "as ridiculous as that thing makes you look,";
String p9 =" I don’t think I have seen anything more beautiful. ";
String p10 ="Watched you for as long as I dared.";
String p11 ="I don’t believe it was a fluke that I saw you first.";
String p12 ="I believe there is another world waiting for us, Sixsmith, ";
String p13 ="a better world,";
String p14 ="and I’ll be waiting for you there. ";
String p15 ="I believe we do not stay dead long.";
String p16 ="Find me beneath the course of the stars where we first kissed.";
String p17="Yours eternally, R.F.";


int page = 0;

void setup () {
  size(700, 400);
  frameRate(12);
  font1 = loadFont("Times-Roman-48.vlw");

  img1 = loadImage("3.png");
}
float angle;
void draw () {
  background(0);


  if (page == 0) {
    fill(255);
    image(img1, 0, 0);
    textFont(font1, 17);
    text(p1, width/2, height/2);
    textAlign(CENTER);

    //////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }

  else if (page == 1) {
    image(img1, 0, 0);
    fill(255);
    textFont(font1, 17);
    text(p2, width/2, height/2);
    textAlign(CENTER);
    //////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }

  else if (page == 2) {
    image(img1, 0, 0);
    fill(255);
    textFont(font1, 17);
    text(p3, width/2, height/2);
    textAlign(CENTER);
    /////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }
  else if (page == 3) {
    image(img1, 0, 0);
    fill(255);
    textFont(font1, 17);
    text(p4, width/2, height/2);
    textAlign(CENTER);
    /////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }
  else if (page == 4) {
    image(img1, 0, 0);
    fill(255);
    textFont(font1, 17);
    text(p5, width/2, height/2);
    textAlign(CENTER);
    /////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }

  else if (page == 5) {
    image(img1, 0, 0);
    fill(255);
    textFont(font1, 17);
    text(p6, width/2, height/2);
    textAlign(CENTER);
    /////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }

  else if (page == 6) {
    image(img1, 0, 0);
    fill(255);
    textFont(font1, 17);
    text(p7, width/2, height/2);
    textAlign(CENTER);
    //////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }


  else if (page == 7) {
    image(img1, 0, 0);
    fill(255);
    textFont(font1, 17);
    text(p8, width/2, height/2);
    textAlign(CENTER);
    //////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }

  else if (page == 8) {
    image(img1, 0, 0);
    fill(255);
    textFont(font1, 17);
    text(p9, width/2, height/2);
    textAlign(CENTER);
    //////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }
  else if (page == 9) {
    image(img1, 0, 0);
    fill(255);
    textFont(font1, 17);
    text(p10, width/2, height/2);
    textAlign(CENTER);
    //////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }
  else if (page == 10) {
    image(img1, 0, 0);
    fill(255);
    textFont(font1, 17);
    text(p11, width/2, height/2);
    textAlign(CENTER);
    //////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }
  else if (page == 11) {
    image(img1, 0, 0);
    fill(255);
    textFont(font1, 17);
    text(p12, width/2, height/2);
    textAlign(CENTER);
    //////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }
  else if (page == 12) {
    image(img1, 0, 0);
    fill(255);
    textFont(font1, 17);
    text(p13, width/2, height/2);
    textAlign(CENTER);
    //////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }
  else if (page == 13) {
    image(img1, 0, 0);
    fill(255);
    textFont(font1, 17);
    text(p14, width/2, height/2);
    textAlign(CENTER);
    //////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }
  else if (page == 14) {
    image(img1, 0, 0);
    fill(255);
    textFont(font1, 17);
    text(p15, width/2, height/2);
    textAlign(CENTER);
    //////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }
  else if (page == 15) {
    image(img1, 0, 0);
    fill(255);
    textFont(font1, 17);
    text(p16, width/2, height/2);
    textAlign(CENTER);
    //////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }
  else if (page == 16) {
    image(img1, 0, 0);
    fill(255);
    textFont(font1, 17);
    text(p17, width/2, height/2);
    textAlign(CENTER);
    //////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }

  else if (page == 17) {
    image(img1, 0, 0);

    //////
    translate(width/2, height/2);
    ellipseMode(CENTER);
    fill(255);
    for (int i = 255; i >1; i -=10)
    {
      rotate(radians(angle) /PI);
      strokeWeight (0.01);
      stroke(255);
      fill(0, 0, 0, 0);
      ellipse(20, 120, i, i);
    }
    angle += 1;
  }
}


void mousePressed () {
  if (page == 0) {
    page =1;
  }
  else if (page == 1) {
    page =2 ;
  }
  else if (page == 2) {
    page =3 ;
  }
  else if (page == 3) {
    page =4 ;
  }
  else if (page == 4) {
    page =5 ;
  }
  else if (page == 5) {
    page =6 ;
  }
  else if (page == 6) {
    page =7 ;
  }
  else if (page == 7) {
    page =8 ;
  }
  else if (page == 8) {
    page =9 ;
  }
  else if (page == 9) {
    page =10 ;
  }
  else if (page == 10) {
    page =11 ;
  }
  else if (page == 11) {
    page =12 ;
  }
  else if (page == 12) {
    page =13 ;
  }
  else if (page == 13) {
    page =14 ;
  }
  else if (page == 14) {
    page =15 ;
  }  
  else if (page == 15) {
    page =16 ;
  }
  else if (page == 16) {
    page =17 ;
  }
  else if (page == 17) {
    page =0 ;
  }
    println(page);

}



