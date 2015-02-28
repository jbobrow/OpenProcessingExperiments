
float a = 20*random(20);

float b = 30*random(10);

float c = random(100);

void setup () {
  size (500,500);
  background (255);
  smooth();
  
 
}


void draw() {

frameRate (10);

 //if (keyPressed) {
  //fill (255,255,0);
  //ellipse (mouseX,mouseY,20,20);
//}

if(keyPressed) {



  
//a - g   

if (key == 'a' || key == 'A') {
noStroke();
fill(random(255),0,random(255),random(255));
rect (a,0,random(40),random(450));
}



}

 
if (key == 'b' || key == 'B') {
noStroke();
fill(random(255),0,random(255),100);
rect (70,0,20,300);
}
  


if (key == 'c' || key == 'C') {
noStroke();
fill(random(255),0,random(255),c);
rect (85,a,20,450);
}

if (key == 'd' || key == 'D') {
noStroke();
fill(random(255),0,random(255),c);
rect (a,0,20,400);
}

if (key == 'e' || key == 'E') {
noStroke();
fill(random(255),0,random(255),c);
rect (250,a,random(20,40),random(50,500));
}


if (key == 'f' || key == 'f') {
noStroke();
fill(random(255),0,random(255),c);
rect (350,0,20,350);
}

if (key == 'g' || key == 'G') {
noStroke();
fill(random(255),0,random(255),c);
rect (200,0,20,250);
}

// h - l

if (key == 'h' || key == 'H') {
noStroke();
fill(random(255),0,random(255),c);
rect (120,50,20,450);
}

if (key == 'i' || key == 'I') {
noStroke();
fill(random(255),0,random(255),c);
rect (150,100,random (20,40),random(50,450));
}





if (key == 'j' || key == 'J') {
noStroke();
fill(random(255),0,random(255));
rect (25,0,20,500);
}

if (key == 'k' || key == 'K') {
noStroke();
fill(random(255),0,random(255),c);
rect (450,0,20,500);
}


if (key == 'l' || key == 'L') {
noStroke();
fill(random(255),0,random(255),c);
rect (300,0,20,500);
}


// m - r

if (key == 'm' || key == 'M') {
noStroke();
fill(random(255),0,random(255),c);
rect (250,20,250,20);
}

if (key == 'n' || key == 'N') {
noStroke();
fill(random(255),0,random(255),c);
rect (50,450,450,20);
}





if (key == 'o' || key == 'O') {
noStroke();
fill(random(255),0,random(255),c);
rect (100,350,random (20,40),random(350,20));

}

if (key == 'p' || key == 'P') {
noStroke();
fill(random(255),0,random(255),c);
rect (400,100,400,20);
}

if (key == 'q' || key == 'Q') {
noStroke();
fill(random(255),0,random(255),c);
rect (450,150,50,20);
}


if (key == 'r' || key == 'R') {
noStroke();
fill(random(255),0,random(255),c);
rect (200,250,300,20);
}


// s - z


if (key == 's' || key == 'S') {
noStroke();
fill(random(255),0,random(255),c);
rect (0,20,200,20);
}


if (key == 't' || key == 'T') {
noStroke();
fill(random(255),0,random(255),c);
rect (0,150,450,20);
}

if (key == 'u' || key == 'U') {
noStroke();
fill(random(255),0,random(255),c);
rect (0,400,random(20,40),random(250,20));

}


if (key == 'v' || key == 'V') {
noStroke();
fill(random(255),0,random(255),c);
rect (0,480,400,20);

}


//rect (250,0,random(20,40),random(50,500));


if (key == 'w' || key == 'W') {
noStroke();
fill(random(255),0,random(255),c);
rect (0,380,150,20);
}

if (key == 'x' || key == 'X') {
noStroke();
fill(random(255),0,random(255),c);
rect (0,220,450,20);
}

if (key == 'y' || key == 'Y') {
noStroke();
fill(random(255),0,random(255),c);
rect (0,120,100,20);
}

if (key == 'z' || key == 'Z') {
noStroke();
fill(random(255),0,random(255),c);
rect (0,320,350,20);
}

// umlaute : bindestriche


// umlaute : Ä,Ö,Ü (ellipse)



if (key == 'ä' || key == 'Ä') {
noStroke();
fill(random(255),0,random(255),10);
ellipse (150,80,random(100,400),random(100,400));
}



if (key == 'ö' || key == 'Ö') {
noStroke();
fill(random(255),0,random(255),10);
ellipse (400,400,random(100,400),random(100,400));
}

if (key == 'ü' || key == 'Ü') {
noStroke();
fill(random(255),0,random(255),10);
ellipse (120,300,random(100,400),random(100,400));
}

if (key == '-' || key == '-') {
noStroke();
fill(random(255),0,random(255),50);
ellipse (100,100,random(150),random(300));
}


}











