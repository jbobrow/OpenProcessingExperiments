

size(570, 800);
background (#FFF303);
smooth();

strokeWeight (8);    //ㅎㅏㅇㅑㄴㄴㅜㄴ
fill (255);
ellipse (180, 200, 170, 200);
ellipse (370, 200, 170, 200);

strokeWeight (5);   //ㅍㅏㄹㅏㄴㄴㅜㄴ
fill (#00E3FF, 150);
arc (190, 200, 85, 100, HALF_PI, TWO_PI); 
arc (360, 200, 85, 100, HALF_PI, TWO_PI);
noFill();
ellipse (190, 200, 85, 100);
ellipse (360, 200, 85, 100);


strokeWeight (8);   //ㅅㅗㄱㄴㅜㄴㅅㅓㅂ
line (100, 100, 123, 123);
line (175, 97, 175, 67);
line (250, 100, 232, 120);

line (100+190, 100, 123+190, 123);
line (175+190, 97, 175+190, 67);
line (250+190, 100, 232+190, 120);


noStroke ();    //ㄱㅓㅁㅈㅓㅇㄴㅜㄴ
fill (0);
ellipse ( 190, 200, 40, 40);
ellipse ( 360, 200, 40, 40);

stroke (0);
strokeWeight (5);
fill (#FFF303);
arc (295, 300, 90, 95, PI+QUARTER_PI, TWO_PI);

//mouse
fill (#580505); //ㄷㅓ ㅂㅏㄹㄱㅡㄴ ㄱㅏㄹㅅㅐㄱ
arc (280, 320, 370, 270, 0, PI, CHORD);

//teeth
fill (255);
rect (220, 320, 50, 60); 
rect (290, 320, 50, 60); 

//chick
stroke (#E86010);
strokeWeight (5);
fill (#FFF303);
arc (100, 300, 100, 90, PI-QUARTER_PI, TWO_PI, OPEN);
arc (450, 300, 100, 90, PI, TWO_PI+QUARTER_PI, OPEN);

fill (#E86010);
ellipse (70, 280, 9, 9);
ellipse (100, 270, 8, 8);
ellipse (120, 300, 10, 10);

ellipse (75+350, 280, 9, 9);
ellipse (110+350, 270, 8, 8);
ellipse (120+350, 300, 6, 8);

//ㅇㅣㅂㅈㅜㄹㅡㅁ
stroke (0);
line (85, 330, 110, 310);
line (475, 330, 440, 310);

stroke(1);
noFill();
arc (285, 460, 200, 50, 0, PI, OPEN);

//gimi
noStroke();
fill (#797569);
ellipse (100, 460, 40, 40);
ellipse (60, 530, 70, 70);
ellipse (40, 120, 30, 40);
ellipse (100, 20, 50, 50);
ellipse (510, 100, 40, 40);
ellipse (530, 400, 30, 50);
ellipse (470, 500, 60, 70);

//clothes
stroke (1);
fill (255);
rect (0, 570, width-1, 70); 
fill (#866308);
rect (0, 640, width-1, height);

fill (0);
rect (30, 660, 100, 20);
rect (160, 660, 100, 20);
rect (160+130, 660, 100, 20);
rect (160+260, 660, 100, 20);

fill (255);
triangle (160, 570, 260, 570, 230, 600);
triangle (300, 570, 400, 570, 330, 600);

//necktie
fill(#C40A0A);
beginShape();
vertex(260, 570);
vertex(300, 570);
vertex(290, 590);
vertex(270, 590);
endShape(CLOSE);

//fill(#C40A0A);
beginShape();
vertex(290, 590);
vertex(270, 590);
vertex(250, 640);
vertex(280, 670);
vertex(310, 640);
endShape(CLOSE);



