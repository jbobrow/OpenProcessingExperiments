
void setup() { 
  size(500, 500);

  

}

void draw() {  //draw function loops 
      if (mousePressed == true) {
      background(0);
  } else { 
      background(255);
  }
    if (mousePressed == true) {
        fill(0,0,255);
    }
    else {
        fill(245,245,0);
    }
    rectMode(CENTER);
    rect(mouseX+250,mouseY+250,200,200);
    fill (255,255,255);
    ellipse(mouseX+220,mouseY+220,60,60);
    ellipse(mouseX+280,mouseY+220,60,60);
        if (mousePressed == true) {
            fill (255,40,40);
        } 
        else {
            fill (0,185,255);
        }
    ellipse(mouseX+220,mouseY+220,20,20);
    ellipse(mouseX+280,mouseY+220,20,20);
    fill (0,0,0);
    ellipse(mouseX+220,mouseY+220,10,10);
    ellipse(mouseX+280,mouseY+220,10,10);
    fill (255,255,255);
    ellipse (mouseX+216,mouseY+218,5,5);
    ellipse (mouseX+276,mouseY+218,5,5);
    fill (150,0,0);
    arc(mouseX+250,mouseY+ 280, 80, 80,0, PI);
    fill (255,255,255);
    rect (mouseX+262,mouseY+290,18,20);
    rect (mouseX+239,mouseY+290,18,20);
    fill (245,245,0);
    ellipse(mouseX+250,mouseY+250,25,25);
    fill (200,200,0);
    ellipse (mouseX+320,mouseY+330,30,30);
    ellipse (mouseX+170,mouseY+170,20,20); 
    ellipse (mouseX+190,mouseY+165,10,10);
    fill (255,0,0);
    ellipse (mouseX+320,mouseY+260,5,5);
    ellipse (mouseX+330,mouseY+270,5,5); 
    ellipse (mouseX+310,mouseY+270,5,5);
    ellipse (mouseX+180,mouseY+260,5,5);
    ellipse (mouseX+170,mouseY+270,5,5); 
    ellipse (mouseX+190,mouseY+270,5,5);
    
    //pants
fill (255,255,255);
rect (mouseX+250,mouseY+360,200,25);
fill(130,70,15);
rect(mouseX+250,mouseY+385,200,40);
rect(mouseX+205,mouseY+412,50,15);
rect(mouseX+295,mouseY+412,50,15);
fill(0);
rect(mouseX+187,mouseY+375,30,6);
rect(mouseX+229,mouseY+375,30,6);
rect(mouseX+271,mouseY+375,30,6);
rect(mouseX+312,mouseY+375,30,6);
fill (245,245,0);
rect (mouseX+205,mouseY+445,20,50);
rect (mouseX+295,mouseY+445,20,50);
fill (255,255,255);
rect (mouseX+205,mouseY+455,20,30);
rect (mouseX+295,mouseY+455,20,30);
fill (0,0,0);
rect (mouseX+199,mouseY+480,35,20);
rect (mouseX+300,mouseY+480,35,20);
fill(216,0,0);
triangle(mouseX+266,mouseY+349,mouseX+253,mouseY+369, mouseX+237,mouseY+ 349);
rect (mouseX+251,mouseY+373,15,50);
fill (255,255,255);
triangle(mouseX+150,mouseY+308,mouseX+150,mouseY+348,mouseX+125,mouseY+348);
triangle(mouseX+351,mouseY+309,mouseX+351,mouseY+349,mouseX+377,mouseY+349);
fill (245,245,0);
rect (mouseX+137,mouseY+373,15,50);
rect (mouseX+363,mouseY+373,15,50);
rect (mouseX+132,mouseY+405,30,15);
rect (mouseX+368,mouseY+405,30,15);










}
