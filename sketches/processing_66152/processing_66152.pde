
void setup() {
 
size(500, 500);
background(75, 173, 149);
stroke(126, 132, 130);
strokeWeight(4);
fill(35, 67, 59);

//city
rect(0, 400, 30, 100);
rect(30, 350, 80, 150);
rect(110, 380, 60, 120);
rect(170, 300, 50, 200);
rect(220, 320, 100, 180);
rect(320, 385, 120, 115);
rect(440, 290, 60, 210);

//balloon
noStroke();
fill(147, 149, 18);
arc(400, 20, 325, 200, PI/4, 3*PI);

//distant balloons
ellipse(100, 50, 5, 5);
ellipse(200, 75, 5, 5);
ellipse(300, 250, 5, 5);
ellipse(180, 100, 5, 5);
ellipse(400, 200, 5, 5);
ellipse(50, 300, 5, 5);
ellipse(130,250, 5, 5);
ellipse(250,180, 5, 5);
ellipse(80,150, 5, 5);
beginShape(POINTS);
vertex(30,20);
vertex(300, 300);
vertex(250,100);
endShape();

//wind
noFill();
stroke(255);
strokeWeight(2);
bezier(50, 150, 100, 100, 350, 300, 400, 250);
bezier(400, 250, 450, 200, 380,210, 370, 200);
bezier(370,200, 420, 150, 480, 250, 450, 220);

//balloon string
noFill();
stroke(126, 132, 130);
strokeWeight(5);
//curve(500,120, 450,115, 300, 300, 100, 300);
curve(500,120, 400,120, 300, 300, 100, 300);

//poem
print("The ba1100ns dance when the city sl33ps");

}



