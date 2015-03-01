
size(1000, 1000);
smooth();
strokeWeight(2);

//moving
void draw() {
background(197,240,180);  //set background green
translate(-1+mouseX,-1+mouseY);


//head
noStroke();
fill(132,75,200,200);
ellipse(500,500,200,200);

//antenne
stroke(255,245,0);
line(430,430,300,300);
noStroke();
fill(255,245,0);
ellipse(335,335,25,25);

//eyes
noStroke();
fill(197,155,222);
rect(440,460,35,15);
fill(197,155,222);
rect(530,460,35,15);

//Body
noStroke();
fill(255,200,0);
rect(200,600,600,200);
fill(255,245,0);
rect(200,700,600,25);  //stipe

//legs
strokeWeight(8)
stroke(255,0,0);
fill(255,0,0);
line(425,800,425,950); 
line(400,800,400,950);
line(600,800,600,950);
line(625,800,625,950);

//arms
strokeWeight(5);
stroke(255,0,0);
line(200,650,100,600);  //left
line(800,650,900,600);  //right
}


