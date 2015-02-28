
//snowman drawing

int x = 200;  // x coordinate
int y = 200;  //y coordinate
int bodyHeight = 50; //body height
 
size (300, 300);
smooth();
background(10, 140, 180, 125);
noStroke();


//head and face
fill(255);
ellipse(x-50, y-70, 20, bodyHeight-30);

fill(0);
ellipse(x-54, y-73, 2, 2);
ellipse(x-46, y-73, 2, 2);
ellipse(x-54, y-66, 1, 1);
ellipse(x-52, y-65, 1, 1);
ellipse(x-50, y-64, 1, 1);
ellipse(x-48, y-65, 1, 1);
ellipse(x-46, y-66, 1, 1);

fill(200, 100, 0);
beginShape();
vertex(x-51, y-71);
vertex(x-48, y-68);
vertex(x-59, y-63);
endShape(CLOSE);

//hat
fill(0);
rect(x-57, y-95, 14, 14);
rect(x-61, y-81, 22, 4); 
fill(255, 0, 0);
rect(x-57, y-83, 14, 2);

//body
fill(255);
ellipse(x-50, y-36, 40, bodyHeight);
fill(100, 0, 255);
ellipse(x-50, y-48, 3, bodyHeight-47);
ellipse(x-50, y-35, 3, bodyHeight-47);
ellipse(x-50, y-22, 3, bodyHeight-47);

//arms
stroke(60, 60, 60);
strokeWeight(3);
line(x-32, y-44, x-20, y-51); 
line(x-20, y-51, x-17, y-56);
line(x-20, y-51, x-15, y-48);
line(x-68, y-44, x-80, y-51);
line(x-80, y-51, x-83, y-56);
line(x-80, y-51, x-85, y-48);

//grass
noStroke();
fill(0, 100, 30, 125);
rect(x-100, y-12, 100, 12);



