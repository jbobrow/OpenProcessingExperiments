
size(600,600);

noStroke();
fill(192, 214, 195);
ellipse(165, 300, 30, 30);
ellipse(435, 300, 30, 30);//hand

smooth();
stroke(30);
fill(192, 214, 195);
strokeWeight(5);
beginShape();
vertex(180, 510);
vertex(180, 360);
bezierVertex(180, 330, 210, 300, 240, 300);
vertex(240, 180);
bezierVertex(180, 60, 420, 60, 360, 180);
vertex(360, 300);
bezierVertex(390, 300, 420, 330, 420, 360);
vertex(420, 510);
endShape();//body

noFill();
beginShape();
vertex(150, 300);
bezierVertex(150, 240, 210, 180, 270, 180);
vertex(330, 180);
bezierVertex(390, 180, 450, 240, 450, 300);
endShape();//shoulder

beginShape();
strokeWeight(4);
vertex(165, 315);
bezierVertex(150, 315, 150, 300, 150, 300);
endShape();
beginShape();
vertex(450, 300);
bezierVertex(450, 315, 435, 315, 435, 315);
endShape();//arm extension #1

beginShape();
strokeWeight(3);
vertex(180, 300);
bezierVertex(180, 315, 165, 315, 165, 315);
endShape();
beginShape();
vertex(435, 315);
bezierVertex(420, 315, 420, 300, 420, 300);
endShape();//arm extension #2

beginShape();
strokeWeight(2);
vertex(165, 285);
bezierVertex(180, 285, 180, 300, 180, 300);
endShape();
beginShape();
vertex(420, 300);
bezierVertex(420, 285, 435, 285, 435, 285);
endShape();//arm extension #3

noStroke();
fill(140, 20, 20);
ellipse(280, 140, 30, 30);
ellipse(320, 140, 30, 30);
fill(0);
ellipse(280, 142, 10, 10);
ellipse(320, 142, 10, 10);//eyes

fill(180, 170, 165);
beginShape();
vertex(240, 300);
bezierVertex(300, 300, 300, 450, 300, 450);
bezierVertex(300, 300, 360, 300, 360, 300);
bezierVertex(300, 320, 240, 300, 240, 300);
endShape();

fill(200, 100, 100);
beginShape();
vertex(263, 142);
bezierVertex(253, 112, 307, 112, 297, 142);
endShape();
beginShape();
vertex(303, 138);
bezierVertex(293, 109, 347, 112, 337, 142);
endShape();//eyeleash

fill(140, 60, 50);
beginShape();
vertex(260, 155);
vertex(338, 158);
vertex(350, 193);
vertex(252, 195);

endShape();//mouth


