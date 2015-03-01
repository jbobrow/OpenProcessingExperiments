
int counter;

void setup() {  
  size(500, 300);
  background(#FF6699); //you can also place hex values in here rather than doing (amount red, amount blue, etc)
  colorMode(HSB);   
  counter = 0;
}

void draw() {  

cursor(HAND);  //I learned that you can change the cursor

if (mousePressed) {    //make stars when the mouse is clicked
     int x = mouseX;
     int y = mouseY;
     fill(random(100, 255), random(0, 255), random(200, 255));
     noStroke();
     triangle(x-10, y-2, x+2, y-2, x+6, y+10);
     triangle(x-6, y+10, x-2, y-2, x+10, y-2);
     triangle(x-6, y+10, x, y-10, x+4, y+2);
     }

for (int i = 50; i <= 300; i += 10) {  //creates an hourglass figure using randomly colored points
    stroke(random(255), 100, 250); 
    strokeWeight(random(1, 9));  
    point(random(i - 30, 330 - i), random(i - 40, i - 10)); /* I learned that the code for generating a
                                                            random number is simply random(min, max) */
} 
    
line(0, 0, 0, 300);  //draws a vertical line between the points (0, 0) and (0, 300) -- left border
line(500, 0, 500, 300); // draws a vertical line between (500, 0) and (500, 300)    -- right border

for (int i = 0; i < 300; i+= 20) {  //creates a spiral of arcs and a diagonal of ellipses
    noFill();
    strokeWeight(3);
    stroke(random(255), 255, 255);
    arc(490, i, 10 + i, 30, PI / 2, 3 * PI / 2);
    fill(random(255), random(50, 200), 250);
    ellipse(440 - i / 2, 20 + i, 10, 10);
    }
   
//make a heart
fill(240, 220, 190);
bezier(340, 180, 225, 225, 225, 125, 300, 150);
bezier(300, 150, 300, 50, 375, 110, 340, 180);

for (int i = 0; i < 30; i += 2) {    //creates 2 sets of rectangles
noStroke();
fill(random(50, 255), random(255), random(50, 255));
rect(30 + i, 85 + i, 20, 30);
rect(50 - i, 175 - i, 20, 30);
}

//make a smiley face
strokeWeight(2);
stroke(random(255), 100, 250); 
ellipse(320, 30, 12, 12);    //1st eye
ellipse(350, 30, 12, 12);    //2nd eye

noFill();
strokeWeight(7);
arc(335, 50, 50, 30, 0.2, PI - 0.2);    //mouth
}
