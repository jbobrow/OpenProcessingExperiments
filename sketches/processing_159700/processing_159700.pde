
size(800,800);
background(137,242,220);
strokeJoin(ROUND);
strokeWeight(4);

//cap side
fill (214,111,0); 
strokeJoin(ROUND);
strokeWeight(4);
quad(280, 50, 400, 50, 400, 100, 280, 100);

//cap top circle
fill (255, 133, 10); 
ellipse(340, 50, 120, 50);
strokeJoin(ROUND);
strokeWeight(4);

//gatorade bottle body top head
fill (245, 193, 234);
strokeJoin(ROUND);
strokeWeight(4);
quad(280, 100, 400, 100, 500, 240, 180, 240);

//center bottle body top
fill(245, 193, 234);
strokeJoin(ROUND);
quad(180, 240, 500, 240, 500, 390, 180, 390);
fill(222,136,203);
quad(200, 390, 480, 390, 480, 410, 200, 410);

//body bottom down
fill(245, 193, 234);
strokeJoin(ROUND);
strokeWeight(4);
quad(180, 410, 500, 410, 500, 700, 180, 700);

//lightning bolt
fill(222,136,203);
quad(290, 480, 400, 460, 370, 500, 270, 520);
triangle(300, 510, 430, 490, 250, 610); 

//shadow
fill(222,136,203);
strokeWeight(0);
stroke(222,136,203);
triangle(284, 104, 284, 236, 187, 236);
triangle(397, 104, 494, 236, 397, 236);
rect(184,244, 100, 143);
rect(397,244, 100, 143);
rect(184,414, 100, 282);
rect(397,414, 100, 282);

//light
noStroke();
fill(255,255,255);
rect(300, 102, 50, 135);
rect(300, 242, 50, 145);
rect(300, 412, 50, 285);

//label
fill(255,255,255);
strokeJoin(ROUND);
stroke(0,0,0);
strokeWeight(2);

quad(180, 430, 490, 430, 490, 650, 180, 650);

//lightning bolt
fill(247,198,117);
noStroke();
quad(290, 480, 400, 460, 370, 500, 270, 520);
triangle(300, 510, 430, 490, 250, 610); 

//Gatorade G

fill(0,0,0);
noStroke();
textSize(200);
strokeWeight(2);
text("G", 230, 590);

//Gatorade
fill(0,0,0);
textSize(33);
strokeWeight(2);
text("Gatorade", 258, 510);
