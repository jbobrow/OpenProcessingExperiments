
void setup() {
  size(800,1110);
background(#27ffe8);
noStroke();
ellipseMode(CENTER);
}

void draw () {
  
//head  
fill(255);
ellipse(400,950,200,280);

//neck
fill(255);
rect(340,750,120,100);

//body
fill(255);
quad(191,670,609,670,460,850,340,850);

//body2
fill(255,8);
quad(78,532,722,532,460,850,340,850);

//left eye
fill(255);
ellipse(320,889,55,55);

//left eye inside
fill(0);
ellipse(320,889,40,40);

//left eye inside inside
fill(255);
ellipse(320,889,15,15);

//right eye
fill(255);
ellipse(482,889,55,55);

//right eye inside
fill(0);
ellipse(482,889,40,40);

//right eye inside inside
fill(255);
ellipse(482,889,15,15);

//tentical 1
fill(255);
quad(78,532,148,532,460,850,340,850);

//tentical 1.5
fill(255);
quad(103,442,43,442,78,532,148,532);

//tentical 1.6
fill(255);
quad(73,302,133,302,103,442,43,442);

//tentical 1.7
fill(255);
quad(98,180,48,180,73,302,133,302);

//tentical 1.8
fill(255);
quad(88,50,108,50,98,180,48,180);

//tentical 2
fill(255);
quad(270,532,340,532,460,850,340,850);

//tentical 2.5
fill(255);
quad(310,442,250,442,270,532,340,532);

//tentical 2.6
fill(255);
quad(280,302,340,302,310,442,250,442);

//tentical 2.7
fill(255);
quad(305,180,255,180,280,302,340,302);

//tentical 2.8
fill(255);
quad(295,50,315,50,305,180,255,180);

//tentical 3
fill(255);
quad(457,532,527,532,460,850,340,850);

//tentical 3.5
fill(255);
quad(537,442,477,442,457,532,527,532);

//tentical 3.6
fill(255);
quad(447,302,507,302,537,442,477,442);

//tentical 3.7
fill(255);
quad(532,180,482,180,447,302,507,302);

//tentical 3.8
fill(255);
quad(462,50,482,50,532,180,482,180);

//tentical 4
fill(255);
quad(652,532,722,532,460,850,340,850);

//tentical 4.5
fill(255);
quad(757,442,697,442,652,532,722,532);

//tentical 4.6
fill(255);
quad(667,302,727,302,757,442,697,442);

//tentical 4.7
fill(255);
quad(752,180,702,180,667,302,727,302);

//tentical 4.8
fill(255);
quad(682,50,702,50,752,180,702,180);

println(mouseX + ", " + mouseY);
}


