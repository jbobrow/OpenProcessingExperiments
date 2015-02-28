
/*
 Konkuk University
 SOS iDesign

Name: PARK Hyebin 
ID: 201420081 
*/

void setup(){

 size (600, 600);
 // noLoop();
smooth();
colorMode (RGB, 600);
background(600, 500, 0);
 }

void draw(){
println(mouseX + ":"+mouseY);
//eyes
stroke(0, 0, 0);
strokeWeight(2);
fill(600, 600, 600);
ellipse(234, 279, 130, 130);
ellipse(347, 279, 130, 130);
line(316, 221, 306, 203);
line(347, 214, 344, 191);
line(378, 221, 387, 201);
line(401, 242, 419, 230);
line(265, 221, 274, 202);
line(229, 213, 226, 190);
line(198, 224, 186, 203);


float mx1 = constrain (mouseX, 190, 265);
float mx2 = constrain (mouseX, 305, 390);
float my = constrain (mouseY, 255, 300);

fill(0, 0, 0);
ellipse(mx1, my, 20, 20);
ellipse(mx2, my, 20, 20);


//nose
line(290, 314, 248, 315);
fill(600, 500, 0);
bezier(248, 315, 219, 314, 218, 359, 247, 356); 
line(247, 356, 272, 356);
//hair
line(178, 246, 107, 145);
line(107, 145, 189, 121);
line(189, 121, 199, 33);
line(199, 33, 274, 53);
line(274, 53, 307, 2);
line(328, 1, 366, 42);
line(366, 42, 450, 10);
line(450, 10, 460, 85);
line(460, 85, 544, 102);
line(544, 102, 511, 172);
line(511, 172, 587, 230);
line(587, 230, 520, 289);
line(520, 289, 567, 347);
line(567, 347, 501, 369);
line(501, 369, 504, 412);
line(504, 412, 452, 408);


//mouse
line(200, 335, 162, 383);
bezier(162, 383, 155, 423, 411, 437, 423, 390);
bezier(404, 376, 410, 376, 434, 397, 430, 400);
bezier(237, 418, 227, 417, 227, 449, 259, 448);
line(259, 448, 259, 483);
//ear
bezier(457, 317, 505, 294, 484, 378, 455, 369);
line(455, 369, 438, 487);
bezier(456, 347, 448, 340, 467, 324, 473, 331);
line(460, 335, 467, 342);

//neck
fill(600, 600, 600);
ellipse(243, 503, 50, 50);
ellipse(264, 516, 50, 50);
ellipse(317, 530, 50, 50);
ellipse(372, 530, 50, 50);
ellipse(450, 495, 50, 50);
ellipse(425, 519, 50, 50);

//nose
noStroke();
fill(600, 500, 0);
quad(248, 315, 245, 345, 292, 343, 290, 314);
 }
void keyPressed(){
  }

