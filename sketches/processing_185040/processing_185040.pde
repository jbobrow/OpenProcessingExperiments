
size(500,525);
background(250);
smooth(BEVEL);
fill(50);
stroke(50);
//strokeWeight(10);

// Head
arc(250,100,150,150,PI,TWO_PI); //head
//ellipse(250,120,150,150); //head
line(250,100,200,10); //left antena
line(250,100,300,10); //right antena
fill(200);
strokeWeight(0);
triangle(230,90,220,75,210,90); //left eye
triangle(290,90,280,75,270,90); //right eye
rect(240,92.5,20,2.5); //mouth
ellipse(200,10,5,5);// left ball
ellipse(300,10,5,5);// right ball

smooth(BEVEL);
fill(50);
stroke(50);
//strokeWeight(10);
// Leg/Wheele
quad(155,380,345,380,330,415,170,415); //platform
triangle(175,420,325,420,250,500); //leg
fill(200);
ellipse(250,510,10,10); //dot
fill(50);

// Body
quad(174.5,100,325.5,100,305,115,195,115); //collar
//quad(150,100,350,100,345,150,155,150); //collar
quad(125,125,375,125,350,375,150,375); //body
strokeWeight(50);
line(125,150,75,300); //left arm
line(375,150,425,300); //right arm
