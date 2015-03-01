
void setup(){
size(1000,800);
background(255);
}

 
void draw(){
float s = map(second(), 0, 59, 0, 300);
float m = map(minute(), 0, 59, 0, 300);

//square
fill(5,247,47);
stroke(255,255,255);
strokeWeight(10);
rect ( 50, 50, s*3, 700);
stroke(255,255,255);
strokeWeight(10);
rect ( 100, 100, s*3, 600);
stroke(255,255,255);
strokeWeight(10);
rect ( 150, 150, s*3, 500);
stroke(255,255,255);
strokeWeight(10);
rect ( 200, 200, s*3, 400);
stroke(255,255,255);
strokeWeight(10);
rect ( 250, 250, s*3, 300);
stroke(255,255,255);
strokeWeight(10);
rect ( 300, 300, s*3, 200);
stroke(255,255,255);
strokeWeight(10);
rect ( 350, 350, s*3, 100);

// inception square
// inception square
fill(0,255,244);
stroke(255,255,255);
strokeWeight(10);
rect ( 50, 50, s*2, 700);
stroke(255,255,255);
strokeWeight(10);
rect ( 100, 100, s*2, 600);
stroke(255,255,255);
strokeWeight(10);
rect ( 150, 150, s*2, 500);
stroke(255,255,255);
strokeWeight(10);
rect ( 200, 200, s*2, 400);
stroke(255,255,255);
strokeWeight(10);
rect ( 250, 250, s*2, 300);
stroke(255,255,255);
strokeWeight(10);
rect ( 300, 300, s*2, 200);
stroke(255,255,255);
strokeWeight(10);
rect ( 350, 350, s*2, 100);


// inception square
// inception square
fill(255,40,255);
stroke(255,255,255);
strokeWeight(10);
rect ( 50, 50, s, 700);
stroke(255,255,255);
strokeWeight(10);
rect ( 100, 100, s, 600);
stroke(255,255,255);
strokeWeight(10);
rect ( 150, 150, s, 500);
stroke(255,255,255);
strokeWeight(10);
rect ( 200, 200, s, 400);
stroke(255,255,255);
strokeWeight(10);
rect ( 250, 250, s, 300);
stroke(255,255,255);
strokeWeight(10);
rect ( 300, 300, s, 200);
stroke(255,255,255);
strokeWeight(10);
rect ( 350, 350, s, 100);


// inception square
fill(255,255,23);
stroke(255,255,255);
strokeWeight(10);
rect ( 50, 50, s/2, 700);
stroke(255,255,255);
strokeWeight(10);
rect ( 100, 100, s/2, 600);
stroke(255,255,255);
strokeWeight(10);
rect ( 150, 150, s/2, 500);
stroke(255,255,255);
strokeWeight(10);
rect ( 200, 200, s/2, 400);
stroke(255,255,255);
strokeWeight(10);
rect ( 250, 250, s/2, 300);
stroke(255,255,255);
strokeWeight(10);
rect ( 300, 300, s/2, 200);
stroke(255,255,255);
strokeWeight(10);
rect ( 350, 350, s/2, 100);


// inception square
fill(0,55);
stroke(255,255,255);
strokeWeight(10);
rect ( 50, 50, s/3, 700);
stroke(255,255,255);
strokeWeight(10);
rect ( 100, 100, s/3, 600);
stroke(255,255,255);
strokeWeight(10);
rect ( 150, 150, s/3, 500);
stroke(255,255,255);
strokeWeight(10);
rect ( 200, 200, s/3, 400);
stroke(255,255,255);
strokeWeight(10);
rect ( 250, 250, s/3, 300);
stroke(255,255,255);
strokeWeight(10);
rect ( 300, 300, s/3, 200);
stroke(255,255,255);
strokeWeight(10);
rect ( 350, 350, s/3, 100);

fill(244,0,0);
rect( m, 30, 60, 20);

noStroke();
fill(5,247,47);
rect(10,10,10,10);
text("seconds x 3 ", 20, 20);

fill(0,255,244);
rect(100,10,10,10);
text("seconds x 2 ", 110, 20);

fill(255,40,255);
rect(190,10,10,10);
text("seconds ", 200, 20);

fill(255,255,23);
rect(280,10,10,10);
text("seconds/2 ", 290, 20);

fill(0,55);
rect(370,10,10,10);
text("seconds/3 ", 380, 20);

fill(255,0,0);
rect(460,10,10,10);
text("minutes ", 470, 20);


}


