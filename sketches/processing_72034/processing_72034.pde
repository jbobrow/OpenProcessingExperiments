
size (600, 600);
 background (200, 195, 50);
 
 //hair bezier
 fill (175);
 stroke (0);
 strokeWeight(10);
 /*
 line (160, 620, -95, -175);
 line (815, -275, 608, 600);
 */
 bezier (160, 620, -95, -175, 815, -275, 608, 600); 
 
 //face bezier
 fill (100, 80, 150);
 stroke (0);
 strokeWeight(10);
 /*
 line (230, 330, 310, 740);
 line (540, 610, 530, 240);
 */
 bezier (230, 330, 310, 740, 540, 610, 530, 240);
 
 //bottom lip
 fill (0);
 stroke (0);
 noStroke ();
 /*
 line (345, 525, 375, 550);
 line (415, 530, 425, 500);
 */
 bezier (348, 525, 375, 550, 415, 530, 420, 505);
 
 //brow bezier
 noFill ();
 stroke (0);
 strokeWeight(10);
 /*
 line (400, 310, 445, 270);
 line (465, 275, 500, 285);
 */
 bezier (400, 310, 445, 270, 465, 275, 500, 285);
 
 //eye bezier
 noFill ();
 stroke (0);
 strokeWeight(10);
 /*
 line (420, 340, 445, 365);
 line (480, 345, 490, 330);
 */
 bezier (420, 340, 445, 365, 480, 345, 490, 330);
 
 //eyelash (L)
 fill (0);
 noStroke ();
 triangle (470, 355, 485, 360, 485, 346);
 
 //eyelash (R)
 fill (0);
 noStroke ();
 triangle (485, 346, 505, 348, 498, 334);
 
 //top lip (L)
 fill (0);
 noStroke ();
 arc (355, 513, 50, 30, 2.9, 5.98);
 
 //top lip (R)
 fill (0);
 stroke (0);
 noStroke ();
 /*
 line (345, 525, 375, 550);
 line (415, 530, 425, 500);
 */
 bezier (380, 508, 375, 490, 425, 475, 430, 495);

 //nose top bezier
 fill (100, 80, 150);
 stroke (0);
 strokeWeight(1);
 /*
 line (345, 355, 330, 330);
 line (370, 410, 355, 440);
 */
 stroke (0);
 strokeWeight(10);
 bezier (345, 355, 365, 375, 370, 410, 355, 440);
 
 //nose nostril (L)
 fill (100, 80, 150);
 stroke (0);
 strokeWeight(1);
 /*
 line (355, 440, 350, 445);
 line (345, 460, 360, 470);
 */
 stroke (0);
 strokeWeight(10);
 bezier (355, 440, 350, 445, 345, 460, 360, 470);
 
 //nose nostril (R)
 fill (100, 80, 150);
 stroke (0);
 strokeWeight(5);
 /*
 line (410, 440, 420, 440);
 line (420, 455, 410, 460);
 */
 bezier (410, 440, 420, 445, 420, 455, 410, 460);

//neck
 strokeWeight(10);
 beginShape();
 vertex(310, 540);
 bezierVertex(415, 640, 470, 540, 480, 515);
 bezierVertex(475, 545, 470, 565, 510, 615);
 bezierVertex(485, 600, 335, 620, 305, 635);
 bezierVertex(320, 620, 315, 560, 310, 540);
 endShape();
 
 //face patch
 noStroke();
 beginShape();
 vertex(455, 265);
 bezierVertex(470, 260, 525, 205, 533, 180);
 bezierVertex(535, 208, 535, 235, 535, 250);
 bezierVertex(530, 260, 470, 275, 455, 265);
 endShape();
 
 //face bezier copy
 noFill();
 stroke (0);
 strokeWeight(10);
 /*
 line (230, 330, 310, 740);
 line (540, 610, 530, 240);
 */
 bezier (230, 330, 310, 740, 540, 610, 530, 240);
 
 //bang bezier
 fill (175);
 /*
 line (190, 320, 340, 400);
 line (540, 205, 540, 150);
 */
 stroke (0);
 strokeWeight(10);
 bezier (190, 320, 340, 400, 540, 205, 540, 150);
