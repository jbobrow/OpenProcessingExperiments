

size(600, 600);
background(232, 255, 253);

strokeWeight(1.5);

fill(232, 255, 253); //lines from bottom of last rectangle
rect(530, 530, 70, 70);
rect(540, 540, 70, 70);
rect(550, 550, 70, 70);
rect(560, 560, 70, 70);
rect(570, 570, 70, 70);
noFill();

fill(255, 255, 255);
stroke(0);
rect(580, 580, 20, 20);
noFill();
noStroke();

fill(0,0,0); //outline for last rectangle
rect(450, 450, 120, 10);
rect(570,450,10,120);
rect(450, 570, 130, 10);
rect(450, 460, 10, 120);
noFill();

fill(224,255,253);
rect(460, 460, 110,110);

fill(87, 240, 231); //last rectangle (90x90)
stroke(0);
rect(470,470,90,90);
noFill();
noStroke();

stroke(0); //outlines for 8th rectangle 
fill(232, 255, 253); 
rect(320, 320, 160, 160);
rect(330, 330, 140, 140);
rect(340, 340, 120, 120);
rect(350, 350, 100, 100);
noStroke();
noFill();

fill(255); //eighth rectangle (80x80)
stroke(0);
rect(360, 360, 80, 80);
noFill();
noStroke();

fill(0,0,0); //outline for 7th rectangle
rect(260, 260, 110, 10);
rect(360, 260, 10, 110);
rect(260, 360, 110, 10);
rect(260, 270, 10, 90);
noFill();

fill(224,255,253);
rect(270, 270, 90, 90);
noFill();

fill(87, 240, 231); //7th rectangle (70x70)
stroke(0);
rect(280,280,70,70);
noFill();
noStroke();

stroke(0); //outlines for 6th rectangle 
fill(232, 255, 253);
rect(160, 160, 120, 120);
rect(170, 170, 100, 100);
rect(180, 180, 80, 80);
noFill();

fill(255, 255, 255); //6th rectangle (60x60)
stroke(0);
rect(190, 190, 60, 60);
noStroke();
noFill();

fill(0,0,0); //outline for 5th rectangle
rect(110, 110, 90, 10);
rect(190, 110, 10, 90);
rect(110, 190, 90, 10);
rect(110, 110, 10, 90);
noFill();

fill(224,255,253);
rect(120, 120, 70, 70);
noFill();

fill(87, 240, 231); //5th rectangle (50x50)
stroke(0);
rect(130,130,50,50);
noFill();
noStroke();

stroke(0); //outline for 4th rectangle
fill(232, 255, 253);
rect(60, 60, 80, 80);
rect(70, 70, 60, 60);
noFill();
noStroke();

fill(255, 255, 255); //4th rectangle (40x40)
stroke(0);
rect(80, 80, 40, 40);
noStroke();
noFill();

fill(0, 0, 0); //outline of third rectangle
rect(20, 20, 70, 10); 
rect(80, 20, 10, 60);
rect(30, 80 , 60, 10);
rect(20, 20, 10, 70); 
noFill();

fill(224,255,253);
rect(30, 30, 50, 50);
noFill();

fill(87, 240, 231); //3rd rectangle (30x30)
stroke(0);
rect(40,40,30,30);
noFill();
noStroke();

stroke(0); //outline for 2nd rectangle
fill(232, 255, 253);
rect(10, 10, 40, 40);
noFill();
noStroke();

fill(255, 255, 255); //2nd rectangle (20x20)
stroke(0);
rect(20, 20, 20, 20);
noStroke();
noFill();

fill(0, 0, 0); //outline of first rectangle
rect(20, 0, 10, 30); 
rect(0, 20, 30, 10);
noFill();

fill(224,255,253);
rect(0,0,20,20);
noFill();

fill(87, 240, 231); //first rectangle (10x10)
stroke(0);
rect(0,0,10,10);
noFill();
noStroke();

//lines on top
stroke(0);
line(30,0,90,0);
line(90,0,90,20);
line(50, 10, 140, 10);
line(140, 10, 140, 60);
line(90, 20, 200, 20);
line(200, 20, 200, 110);
line(140, 60, 280, 60);
line(280, 60, 280, 160);
line(200, 110, 370,110);
line(370, 110, 370, 260);
line(280, 160, 480, 160);
line(480, 160, 480, 320);
line(370, 260, 580, 260);
line(580, 260, 580, 450);
line(470, 320, 600, 320);
line(580, 450, 600, 450);
noStroke();


//lines on bottom
stroke(0);
line(0,30,0,90);
line(0,90,20,90);
line(10, 50, 10, 140);
line(10, 140, 60, 140);
line(20, 90, 20, 200);
line(20, 200, 110, 200);
line(60, 140, 60, 280);
line(60, 280, 160, 280);
line(110, 200, 110,370);
line(110, 370, 260, 370);
line(160, 280, 160, 480);
line(160, 480, 320, 480);
line(260, 370, 260, 580);
line(260, 580, 450, 580);
line(320, 470, 320, 600);
line(450, 580, 450, 600);
noStroke();

//sqaures on top
fill(0, 0, 0);
rect(130, 10, 20, 20);
rect(130, 50, 20, 20);
rect(190, 50, 20, 20);
rect(190, 100, 20, 20);
rect(270, 100, 20, 20);
rect(270, 150, 20, 20);
rect(360, 150, 20, 20);
rect(360, 250, 20, 20);
rect(470, 250, 20, 20);
rect(470, 310, 20, 20);
rect(570, 310, 20, 20);
rect(570, 440, 20, 20);
noFill();

//sqaures on bottom
fill(0, 0, 0);
rect(10, 130, 20, 20);
rect(50, 130, 20, 20);
rect(50, 190, 20, 20);
rect(100, 190, 20, 20);
rect(100, 270, 20, 20);
rect(150, 270, 20, 20);
rect(150, 360, 20, 20);
rect(250, 360, 20, 20);
rect(250, 470, 20, 20);
rect(310, 470, 20, 20);
rect(310, 570, 20, 20);
rect(440, 570, 20, 20);
noFill();

//shape on top
stroke(0);
line(220, 0, 220, 40);
line(220, 40, 300, 40);
line(300, 40, 300, 90);
line(300, 90, 390, 90);
line(390, 90, 390, 140);
line(390, 140, 500, 140);
line(500, 140, 500, 240);
line(500, 240, 600, 240);

//second shape on top
stroke(0);
line(230, 0, 230, 30);
line(230, 30, 310, 30);
line(310, 30, 310, 80);
line(310, 80, 400, 80);
line(400, 80, 400, 130);
line(400, 130, 510, 130);
line(510, 130, 510, 230);
line(510, 230, 600, 230);

//third shape on top
stroke(0);
line(240, 0, 240, 20);
line(240, 20, 320, 20);
line(320, 20, 320, 70);
line(320, 70, 410, 70);
line(410, 70, 410, 120);
line(410, 120, 520, 120);
line(520, 120, 520, 220);
line(520, 220, 600, 220);

//fourth shape on top
stroke(0);
line(250, 0, 250, 10);
line(250, 10, 330, 10);
line(330, 10, 330, 60);
line(330, 60, 420, 60);
line(420, 60, 420, 110);
line(420, 110, 530, 110);
line(530, 110, 530, 210);
line(530, 210, 600, 210);

//fifth shape on top
stroke(0);
line(260, 0, 340, 0);
line(340, 0, 340, 50);
line(340, 50, 430, 50);
line(430, 50, 430, 100);
line(430, 100, 540, 100);
line(540, 100, 540, 200);
line(540, 200, 600, 200);

//sixth shape on top
stroke(0);
line(350, 0, 350, 40);
line(350, 40, 440, 40);
line(440, 40, 440, 90);
line(440, 90, 550, 90);
line(550, 90, 550, 190);
line(550, 190, 600, 190);

//seventh shape on top
stroke(0);
line(360, 0, 360, 30);
line(360, 30, 450, 30);
line(450, 30, 450, 80);
line(450, 80, 560, 80);
line(560, 80, 560, 180);
line(560, 180, 600, 180);

//eighth shape on top
stroke(0);
line(370, 0, 370, 20);
line(370, 20, 460, 20);
line(460, 20, 460, 70);
line(460, 70, 570, 70);
line(570, 70, 570, 170);
line(570, 170, 600, 170);

//nineth shape on top
stroke(0);
line(380, 0, 380, 10);
line(380, 10, 470, 10);
line(470, 10, 470, 60);
line(470, 60, 580, 60);
line(580, 60, 580, 160);
line(580, 160, 600, 160);

//tenth shape on top
stroke(0);
line(390, 0, 480, 0);
line(480, 0, 480, 50);
line(480, 50, 590, 50);
line(590, 50, 590, 150);
line(590, 150, 600, 150);

//eleventh shape on top
stroke(0);
line(490, 0, 490, 40);
line(490, 40, 600, 40);
line(600, 40, 600, 140);

//twelth shape on top
stroke(0);
line(500, 0, 500, 30);
line(500, 30, 600, 30);

//rectangle top right corner
stroke(0);
fill(87, 240, 231);
rect(510, 0, 90, 20);
noFill();
noStroke();

//shape on bottom
stroke(0);
line(0, 220, 40, 220);
line(40, 220, 40, 300);
line(40, 300, 90, 300);
line(90, 300, 90, 390);
line(90, 390, 140, 390);
line(140, 390, 140, 500);
line(140, 500, 240, 500);
line(240, 500, 240, 600);

//second shape on bottom
stroke(0);
line(0, 230, 30, 230);
line(30, 230, 30, 310);
line(30, 310, 80, 310);
line(80, 310, 80, 400);
line(80, 400, 130, 400);
line(130, 400, 130, 510);
line(130, 510, 230, 510);
line(230, 510, 230, 600);

//third shape on bottom
stroke(0);
line(0, 240, 20, 240);
line(20, 240, 20, 320);
line(20, 320, 70, 320);
line(70, 320, 70, 410);
line(70, 410, 120, 410);
line(120, 410, 120, 520);
line(120, 520, 220, 520);
line(220, 520, 220, 600);

//fourth shape on bottom
stroke(0);
line(0, 250, 10, 250);
line(10, 250, 10, 330);
line(10, 330, 60, 330);
line(60, 330, 60, 420);
line(60, 420, 110, 420);
line(110, 420, 110, 530);
line(110, 530, 210, 530);
line(210, 530, 210, 600);

//fifth shape on bottom
stroke(0);
line(0, 260, 0, 340);
line(0, 340, 50, 340);
line(50, 340, 50, 430);
line(50, 430, 100, 430);
line(100, 430, 100, 540);
line(100, 540, 200, 540);
line(200, 540, 200, 600);

//sixth shape on bottom
stroke(0);
line(0, 350, 40, 350);
line(40, 350, 40, 440);
line(40, 440, 90, 440);
line(90, 440, 90, 550);
line(90, 550, 190, 550);
line(190, 550, 190, 600);

//seventh shape on bottom
stroke(0);
line(0, 360, 30, 360);
line(30, 360, 30, 450);
line(30, 450, 80, 450);
line(80, 450, 80, 560);
line(80, 560, 180, 560);
line(180, 560, 180, 600);

//eighth shape on bottom
stroke(0);
line(0, 370, 20, 370);
line(20, 370, 20, 460);
line(20, 460, 70, 460);
line(70, 460, 70, 570);
line(70, 570, 170, 570);
line(170, 570, 170, 600);

//nineth shape on bottom
stroke(0);
line(0, 380, 10, 380);
line(10, 380, 10, 470);
line(10, 470, 60, 470);
line(60, 470, 60, 580);
line(60, 580, 160, 580);
line(160, 580, 160, 600);

//tenth shape on bottom
stroke(0);
line(0, 390, 0, 480);
line(0, 480, 50, 480);
line(50, 480, 50, 590);
line(50, 590, 150, 590);
line(150, 590, 150, 600);

//eleventh shape on bottom
stroke(0);
line(0, 490, 40, 490);
line(40, 490, 40, 600);
line(40, 600, 140, 600);

//twelth shape on bottom
stroke(0);
line(0, 500, 30, 500);
line(30, 500, 30, 600);

//rectangle top right corner
stroke(0);
fill(87, 240, 231);
rect(0, 510, 20, 90);
noFill();
noStroke();































