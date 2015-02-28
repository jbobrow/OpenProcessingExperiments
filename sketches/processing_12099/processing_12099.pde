
PImage img;

void setup() {
  size(1080,863);
  img = loadImage("Starry Night.jpg");
}

void draw() {
  //background(0);
  //image(img,0,0);
  //base background
  background(0);
  noStroke();
  fill(231, 198, 164);
  rect(10, 10, 1060, 840);
  fill(30, 90, 131);
  rect(20, 20, 1040, 820);

  //dark sky shifts
  noFill();
  stroke(40, 90, 180);
  for(int b=0;b<100;b++) {
    ellipse(0,860,4000-15*b,1640-15*b);
  }
  stroke(27, 23, 144);
  for(int c=0;c<50;c++) {
    ellipse(1080,860,3500-15*c,1640-15*c);
  }
  stroke(53, 33, 25, 90);
  for(int c=0;c<50;c++) {
    ellipse(1080,860,3500-15*c,2000-15*c);
  }
  stroke(216, 96, 96, 80);
  for(int c=0;c<50;c++) {
    ellipse(0,860,3500-15*c,2000-15*c);
  }
  noStroke();
  fill(0);
  rect(0,0,10,863);
  rect(1070,0,1080,863);
  fill(231,198,164);
  rect(10,10,10,840);
  rect(1060,10,10,840);

  //line grid
  //  fill(0);
  //  for(int i= 1; i<10;i++){
  //  line(100*i,0,100*i,860);
  //  }
  //  line(0,215,1080,215);
  //  line(0,430,1080,430);
  //  line(0,645,1080,645);

  //the flowing wind
  for (int i=0;i<8;i++) {
    noFill();
    stroke(249,250,246);
    beginShape();
    vertex(30, 120+25*i); 
    bezierVertex(100, 300+20*i, 300, 220+25*i, 400, 140+13*i);
    bezierVertex(500, 120+20*1, 600, 120+20*1, 680-i, 260+13*i);
    endShape();
    for(int m=0;m<10;m++) {
      ellipse(540,300,280-20*m,280-20*m);
    }
    beginShape();
    vertex(400,140+13*i);
    bezierVertex(400, 130+13*i,700,120+13*i,520+20*i, 300+10*i);
    //bezierVertex(400,300+13*i,500,250+13*i,400+10*i, 350+10*i);
    endShape();

    for(int n=0;n<6;n++) {
      ellipse(750, 390, 120-10*i,120-10*i);
    }
    beginShape();
    vertex(420-2*i,220+20*i);
    bezierVertex(450, 500, 800, 250,750+10*i,350+10*i);
    bezierVertex(600,500,800,500,700+10*i, 410+10*i);
    endShape();
  }

  //the lights above the mountains
  stroke(240,185,34);
  strokeWeight(2);
  for(int l=0;l<10;l++) {
    beginShape();
    vertex(30,500+15*l);
    bezierVertex(150,500,300,500, 30,525+15*l);
    bezierVertex(300,600,400,500,400,500+15*l);
    bezierVertex(500,500,700,500,780,420+15*l);
    bezierVertex(900,350,1050,400,1050,300+15*l);
    endShape();
  }

  //the mountains
  stroke(5,5,5,75);
  strokeWeight(3);
  for(int i = 0; i<10; i++) {
    beginShape();
    vertex(30-i,676);
    bezierVertex(500-10*i,600,400-10*i,600,400-10*i,645+10*i);
    bezierVertex(600-10*i,600,700-10*i,500,780-10*i,570+10*i);
    bezierVertex(800-10*i,500,900-10*i,500,1050-10*i,433+10*i);
    endShape();
    ellipse(1080,860,1400-20*i,700-20*i);
    ellipse(0,860,800-10*i,400-10*i);
    ellipse(540,860,800-20*i,500-20*i);
  }

  //stars base
  stroke(5,5,5,75);
  strokeWeight(1.5);
  for(int i=0;i<4;i++) {
    int j = 10*i;
    fill(253, 207, 108, 100-j);
    ellipse(130,  50,  round(60*(100-j)/100),  round(60*(100-j)/100));
    ellipse(150, 410,  round(60*(100-j)/100),  round(60*(100-j)/100));
    ellipse(270, 158,  round(70*(100-j)/100),  round(70*(100-j)/100));
    ellipse(350, 300,  round(40*(100-j)/100),  round(40*(100-j)/100));
    ellipse(375,  60,  round(60*(100-j)/100),  round(60*(100-j)/100));
    ellipse(450,  80,  round(40*(100-j)/100),  round(40*(100-j)/100));
    ellipse(655, 100,  round(80*(100-j)/100),  round(80*(100-j)/100));
    ellipse(755, 220,  round(60*(100-j)/100),  round(60*(100-j)/100));
    ellipse(950, 150, round(200*(100-j)/100), round(200*(100-j)/100));
    fill(249, 250, 246, 100-j);
    ellipse( 60, 390,  round(40*(100-j)/100),  round(40*(100-j)/100));
    ellipse(380, 450,  round(150*(100-j)/100), round(150*(100-j)/100));
    ellipse(260,  45,  round(35*(100-j)/100),  round(35*(100-j)/100));
    fill(215, 103, 76, 100-j);
    ellipse(260,  45,  15,  15);
  }

  //the moon
  fill(220,156,77);
  ellipse(950, 150, 110, 110);
  fill(253, 207, 108);
  ellipse(970, 140, 68,68);

  //the village
  for(int i=0;i<5;i++) {
    fill(28,47,165-20*i,90-5*i);
    beginShape(QUADS);
    vertex(0+10*i,860);
    vertex(0+10*i,670);
    vertex(300+20*i,700+10*i);
    vertex(400-20*i,660+10*i);
    vertex(400-20*i,660+10*i);
    vertex(600+10*i,800-10*i);
    vertex(1080,400-10*i);
    vertex(1080,860);
    endShape();
  }

  for(int i=0;i<5;i++) {
    fill(95,95,95,90-10*i);
    beginShape(TRIANGLES);
    vertex(42+10*i, 839-10*i);
    vertex(792-10*i, 840-10*i);
    vertex(708+10*i, 551+10*i);
    vertex(1053-10*i, 574+10*i);
    vertex(810+10*i,532+10*i);
    vertex(874+10*i,841-10*i);
    vertex(700+10*i,840-10*i);
    vertex(800+10*i, 500+10*i);
    vertex(900+10*i,800+10*i);
    endShape();
  }

  //foreground tree

  for(int i=0;i<5;i++) {
    fill(50, 33, 25,100-10*i);
    ellipse(350,800,400,50);
    triangle(150+10*i,800-10*i,400+10*i,800-5*i,210+5*i,200-5*i);
    triangle(260+10*i,750-10*i,470+10*i,750-5*i,270+5*i,400-5*i);
    triangle(100+10*i,820-10*i,600+10*i,820-5*i,270+5*i,640-5*i);
  }

  //the frame
  noStroke();
  fill(0);
  rect(0,0,10,863);
  rect(0,0,1080,10);
  rect(0,860,1080,850);
  rect(1070,0,1080,863);
  fill(231,198,164);
  rect(10,10,1060,10);
  rect(10,10,10,840);
  rect(1060,10,10,840);
  rect(10,840,1060,10);
}



