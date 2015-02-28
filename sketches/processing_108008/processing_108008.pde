
/**
* CANVAS
*/
size(600, 600);
background(250);
noStroke();

/**
* HEAD
*/
fill(130);
ellipse(300, 400, 345, 500); //head bottom
fill(250);
rect(120, 150, 300, 50); //eraser
fill(130);
ellipse(300, 205, 210, 60); //head top
triangle(230, 150, 250, 190, 270, 150); //left ear bottom
ellipse(250, 127, 49, 78); //left ear top
triangle(330, 150, 350, 190, 370, 150); //right ear bottom
ellipse(350, 127, 49, 78); //right ear top

/**
* BODY
*/

fill(130);
ellipse(300, 420, 375, 450); //main body
ellipse(200, 410, 200, 265); //left arm
ellipse(400, 410, 200, 265); //right arm
fill(250);
rect(130, 550, 350, 100); //eraser
fill(130);
ellipse(300, 538, 313, 110); //body bottom
fill(250);
ellipse(300, 480, 300, 220); //belly top
ellipse(300, 490, 300, 200); //belly bottom
fill(130);
quad(210, 410, 230, 405, 250, 410, 230, 395); //mark 1
quad(280, 410, 300, 405, 320, 410, 300, 395); //mark 2
quad(350, 410, 370, 405, 390, 410, 370, 395); //mark 3
quad(175, 440, 195, 435, 215, 440, 195, 425); //mark 4
quad(245, 440, 265, 435, 285, 440, 265, 425); //mark 5
quad(315, 440, 335, 435, 355, 440, 335, 425); //mark 6
quad(385, 440, 405, 435, 425, 440, 405, 425); //mark 7

/**
* FACE
*/
fill(250); 
ellipse(300, 285, 240, 60); //mouth bottom
fill(130);
rect(163, 250, 275, 35); //eraser
fill(250);
ellipse(300, 285, 240, 25); //mouth top
stroke(1); 
line(200, 278, 200, 301); //tooth 1
line(233, 275, 233, 309); //tooth 2
line(275, 273, 275, 314); //tooth 3
line(328, 273, 328, 314); //tooth 4
line(370, 275, 370, 309); //tooth 5
line(400, 278, 400, 301); //tooth 6
noStroke();
fill(1);
triangle(285, 250, 300, 260, 315, 250); //nose
fill(250);
ellipse(230, 230, 30, 30); //left eye
ellipse(370, 230, 30, 30); //right eye
fill(1);
ellipse(233, 228, 15, 15); //left pupil
ellipse(367, 228, 15, 15); //right pupil
strokeWeight(3);
stroke(75);
line(145, 220, 195, 240); //whisker 1
line(115, 245, 190, 255); //whisker 2
line(125, 275, 180, 270); //whisker 3
line(455, 220, 405, 240); //whisker 4
line(485, 245, 410, 255); //whisker 5
line(475, 275, 420, 270); //whisker 6



