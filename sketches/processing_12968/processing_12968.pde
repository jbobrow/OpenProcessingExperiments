
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}

                
                // happy coding ~
size(200,200);

background(#000000);
stroke(0);
strokeWeight(3);

//얼굴
strokeWeight(4);
fill(#00de5e);
beginShape();
ellipse(100,120,190,150);
endShape(CLOSE);

//왼눈
strokeWeight(3);
fill(#000000);
ellipse(50,100,20,20);

strokeWeight(1);
fill(#ffffff);
ellipse(45,102,5,5);

strokeWeight(1);
fill(#ffffff);
ellipse(53,103,10,10);

//오눈
strokeWeight(3);
fill(#000000);
ellipse(145,100,20,20);

strokeWeight(1);
fill(#ffffff);
ellipse(140,102,5,5);

strokeWeight(1);
fill(#ffffff);
ellipse(148,103,10,10);

//입
strokeWeight(3);
line(30,150,170,150);
fill(#000000);

//이1
fill(#ffffff);
strokeWeight(2);
beginShape();
vertex(140,150);
vertex(160,150);
vertex(150,175);
endShape(CLOSE);

//이2
fill(#ffffff);
strokeWeight(2);
beginShape();
vertex(60,150);
vertex(50,175);
vertex(40,150);
endShape(CLOSE);

//뿔
strokeWeight(3);
fill(#e71bd6);
stroke(5);
beginShape();
vertex(80,47);
vertex(120,47);
vertex(100,5);
endShape(CLOSE);

//뿔선
line(93,20,107,20);
line(90,30,110,30);
line(85,40,115,40);

//이마데코
strokeWeight(1);
fill(#3c00ff);
beginShape();
ellipse(72,57,9,9);
ellipse(84,62,9,9);
ellipse(96,64,9,9);
ellipse(108,63,9,9);
ellipse(118,60,9,9);
ellipse(128,55,9,9);
endShape(CLOSE);

strokeWeight(1);
fill(#ff0000);
beginShape();
ellipse(69,55,5,5);
ellipse(74,58,5,5);
ellipse(79,60,5,5);
ellipse(84,62,5,5);
ellipse(90,63,5,5);
ellipse(96,64,5,5);
ellipse(102,64,5,5);
ellipse(108,63,5,5);
ellipse(113,62,5,5);
ellipse(118,60,5,5);
ellipse(123,58,5,5);
ellipse(128,55,5,5);
endShape(CLOSE);

//왼눈썹
strokeWeight(1);
fill(#3c00ff);
ellipse(50,78,35,10);

stroke(#00de5e);
fill(#00de5e);
ellipse(50,80,35,8);

//오눈썹
strokeWeight(1);
fill(#3c00ff);
ellipse(145,77,35,10);

stroke(#00de5e);
fill(#00de5e);
ellipse(145,80,35,8);

//콧구뇽
strokeWeight(1);
fill(#000000);
rect(86,120,8,8);
rect(98,120,8,8);

//배경꾸며요 뻘짓이에용
point(10,10);
point(20,20);
point(30,30);
point(40,40);
point(50,50);
point(170,170);
point(180,180);
point(190,190);
point(10,30);
point(20,30);
point(30,30);
point(40,30);
point(50,30);
point(60,30);
point(70,30);
point(80,30);
point(110,30);
point(120,30);
point(130,30);
point(140,30);
point(150,30);
point(160,30);
point(170,30);
point(180,30);
point(190,30);
point(10,20);
point(10,30);
point(10,40);
point(10,50);
point(10,60);
point(10,70);
point(10,80);
point(10,90);
point(10,100);
point(10,110);
point(10,140);
point(10,150);
point(10,160);
point(10,170);
point(10,180);
point(10,190);
point(20,10);
point(20,30);
point(20,40);
point(20,50);
point(20,60);
point(20,70);
point(20,80);
point(20,160);
point(20,170);
point(20,180);
point(20,190);
point(30,10);
point(30,20);
point(30,40);
point(30,50);
point(30,60);
point(30,70);
point(30,170);
point(30,180);
point(30,190);
point(40,10);
point(40,20);
point(40,30);
point(40,50);
point(40,60);
point(40,180);
point(40,190);
point(50,10);
point(50,20);
point(50,30);
point(50,40);
point(50,190);
point(60,10);
point(60,20);
point(60,30);
point(60,40);
point(60,50);
point(60,190);
point(70,10);
point(70,20);
point(70,30);
point(70,40);
point(70,50);
point(70,190);
point(80,10);
point(80,20);
point(80,30);
point(80,40);
point(90,10);
point(90,20);
point(90,30);
point(90,40);
point(100,10);
point(100,20);
point(100,30);
point(100,40);
point(110,10);
point(110,20);
point(110,30);
point(110,40);
point(120,10);
point(120,20);
point(120,30);
point(120,40);
point(130,10);
point(130,20);
point(130,30);
point(130,40);
point(130,50);
point(130,190);
point(140,10);
point(140,20);
point(140,30);
point(140,40);
point(140,50);
point(140,190);
point(150,10);
point(150,20);
point(150,30);
point(150,40);
point(150,50);
point(150,60);
point(150,70);
point(150,190);
point(160,10);
point(160,20);
point(160,30);
point(160,40);
point(160,50);
point(160,60);
point(160,190);
point(160,180);
point(170,10);
point(170,20);
point(170,30);
point(170,40);
point(170,50);
point(170,60);
point(170,70);
point(170,180);
point(170,190);
point(180,10);
point(180,20);
point(180,30);
point(180,40);
point(180,50);
point(180,60);
point(180,70);
point(180,80);
point(180,90);
point(180,100);
point(180,110);
point(180,120);
point(180,130);
point(180,140);
point(180,150);
point(180,160);
point(180,170);
point(180,180);
point(180,190);
point(190,10);
point(190,20);
point(190,30);
point(190,40);
point(190,50);
point(190,60);
point(190,70);
point(190,80);
point(190,90);
point(190,100);
point(190,110);
point(190,120);
point(190,130);
point(190,140);
point(190,150);
point(190,160);
point(190,170);
point(190,180);
point(190,190);

