
/*
 Konkuk University
 SOS iDesign

Name: Woo Eunhye
 ID: Woo Eunhye

*/

PImage img;

void setup(){
size (600, 600);
background(240,203,131);
 // noLoop();
smooth();
colorMode (RGB, 600);
 img = loadImage ("ddd.jpg"); // put the image in the same folder as the processing file
 }

void draw(){
println(mouseX + " : " + mouseY);
image (img, 0, 0);
// here you add your code with all shapes and colors. 

noStroke ();
fill (300, 100, 0);
rect (271, 329, 150, 100);

stroke (500, 500, 0);
line (122, 599, 307, 492);

noStroke ();
fill (500, 300, 0);
ellipse (515, 316, 160, 160);

stroke (2);
fill (500, 100, 0);
ellipse (464, 319, 170, 170);


noStroke ();
fill (0, 226, 255);
triangle (82, 93, 6, 172, 132, 170);

stroke(0, 0 ,0);
strokeWeight (7);
line (0, 21, 198, 599);

stroke(0, 0 ,0);
strokeWeight (1);
line (0, 259, 213, 374);

strokeWeight (1);
line (0, 298, 213, 374);

strokeWeight (7);
line (0, 458, 300, 598);

strokeWeight (2);
line (0, 520, 224, 422);

strokeWeight (2);
line (1, 481, 65, 452);

strokeWeight (1);
line (0, 480, 45, 450);

strokeWeight (4);
line (258, 1, 258, 263);

strokeWeight (4);
line (272, 0, 269, 263);

strokeWeight (5);
line (218, 29, 312, 28);
point (6, 419);

strokeWeight (5);
line (225, 240, 306, 241);

strokeWeight (2);
line (0, 592, 301, 387);

strokeWeight (2);
line (50, 599, 329, 394);

strokeWeight (4);
line (114, 599, 304, 486);

strokeWeight (3);
fill (mouseX+10, mouseY+10);
quad (328, 362 , 353, 396, 393, 378, 369, 342);
quad (460, 393, 484, 424, 514, 412, 491, 378);





fill (0, 0, 0);
quad (371, 342, 393, 378, 434, 361, 411, 325);
quad (448, 311, 470, 345, 518, 325, 491, 292);
quad (539, 272, 574, 300, 599, 287, 599, 243);
quad (355, 397, 380, 428, 414, 412, 393, 379);
quad (437, 362, 460, 393, 493, 377, 471, 346);
quad (519, 324, 548, 354, 599, 331, 576, 301);
quad (418, 411, 438, 445, 483, 425, 459, 394);
quad (492, 377, 514, 412, 577, 387, 546, 355);
quad (404, 459, 431, 497, 464, 479, 439, 446);
quad (485, 425, 505, 456, 537, 443, 515, 412);
quad (399, 516, 421, 545, 454, 529, 428, 499);
quad (384, 568, 408, 596, 445, 577, 421, 547);
quad (455, 531, 477, 561, 508, 542, 487, 514);
quad (533, 492, 554, 521, 579, 508, 559, 477);
quad (538, 443, 560, 477, 599, 456, 599, 420);
quad (443, 579, 462, 599, 498, 589, 477, 561);
quad (500, 588, 501, 599, 546, 596, 530, 572);

fill (600, 600, 600);
quad (466, 480, 551, 599, 598, 583, 505, 458);
noStroke ();
triangle (569, 591, 597, 598, 596, 581);

stroke (2);
fill (mouseX+10, mouseY+10);
quad (413, 325, 435, 361, 469, 345, 446, 310);
quad (492, 292, 518, 323, 575, 300, 538, 272);
quad (381, 430, 403, 458, 437, 445, 417, 412);


fill (mouseX, mouseY, 100);
quad (395, 380, 417, 411, 460, 394, 436, 362);
quad (471, 346, 492, 378, 547, 354, 519, 325);
quad (359, 534, 382, 567, 419, 546, 398, 516);
quad (478, 560, 498, 590, 528, 572, 509, 542);
quad (553, 523, 598, 586, 598, 538, 582, 507);
triangle (575, 300, 599, 329, 599, 288);
triangle (581, 508, 599, 538, 599, 497);
triangle (464, 599, 502, 597, 497, 589);


fill (mouseX+10, mouseY+10);
quad (547, 356, 578, 385, 599, 377, 597, 330);




fill (mouseX+10, mouseY+10, 300);
quad (438, 444, 465, 479, 506, 457, 484, 425);
quad (418, 545, 444, 576, 475, 561, 453, 529);
quad (558, 477, 581, 508, 599, 498, 598, 457);



fill (mouseX+30, mouseY+30, 300);
quad (517, 412, 538, 443, 599, 420, 599, 378);

quad (431, 498, 455, 531, 486, 514, 465, 480);
quad (505, 456, 533, 491, 559, 477, 537, 443);

noFill ();
bezier (292, 129, 222, 132, 222, 57, 295, 62);
bezier (0, 341, 20, 344, 25, 397, 0, 397);
bezier (37, 597, 27, 565, 119, 516, 153, 551);
bezier (153, 550, 107, 502, 223, 442, 254, 480);
bezier (252, 480, 237, 455, 284, 423, 305, 440);


fill (0, 200, 600);
bezier (525, 598, 533, 584, 610, 588, 599, 610);





strokeWeight (3);
fill (0, 0, 0);
quad (313, 599, 337, 599, 370, 572, 354, 556);

noStroke ();
fill (0, 0, 250);
ellipse (173, 196, 60, 60);

stroke (1);
noFill ();
ellipse (173, 196, 80, 80);



}

