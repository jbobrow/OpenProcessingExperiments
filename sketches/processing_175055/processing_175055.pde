
int counter;

void setup() {  //setup function called initially, only once
  size(400, 250);  //8-5 ratio
  background(0, 100, 155);  //set background (r,g,b)
  counter = 0;
  myFont = createFont("cursive", 32);
  textFont(myFont);
  text("Merry Christmas!", 80, 50);
}

void draw() {  //draw function loops 
     snowman(100, 125);//leftest snowman
     snowman(200, 125);//middle snowman
     snowman(300, 125);//rightest snowman
    if (mousePressed == true){
        fill(random(255),100,255,50);//was 200, 200, 255
        stroke(180, 180, 255, 0);
        ellipse(mouseX, mouseY, 6, 6);
        }
    if (keyPressed == true){
       saveFrame("snow.png");
        }
//PFont font;
//font = loadFont("cursive.ttf"); 
//textFont(font, 32);
//fill(255, 255, 255);
//text("Merry Christmas!", 80, 50);
}

void snowman(int x, int y) {
    fill(200, 200, 255);//head color
    stroke(180, 180, 255, 0);//outline color of snowman
    ellipse(x, y, 30, 30); //head 
    fill(200, 200, 255); //middle circle color
    ellipse(x, y+33, 40, 40); //middle circle
    fill(200, 200, 255); //bottom circle color
    ellipse(x, y+75, 60, 60); //bottom circle
    fill(0, 0, 0); //eye color
    stroke(0, 0, 0);
    ellipse(x-5, y-3, 3, 3);//left eye
    ellipse(x+5, y-3, 3, 3);//right eye
    fill(200, 150, 0);
    stroke(200, 150, 0);
    triangle(x, y, x, y+4, x+10, y+2);
    fill(0, 0, 0);
    stroke(0, 0, 0, 0);
    ellipse(x, y+26, 3, 3);//top button
    ellipse(x, y+33, 3, 3);//middle button
    ellipse(x, y+40, 3, 3);//bottom button
    ellipse(x-7, y+6, 2, 2);//mouth
    ellipse(x-5, y+8, 2, 2);//mouth
    ellipse (x-2, y+9, 2, 2);//mouth
    ellipse(x+1, y+9, 2, 2);//mouth
    ellipse(x+4, y+8, 2, 2);//mouth
    ellipse(x+7, y+6, 2, 2);//mouth
    rect(x-15, y-25, 30, 15);//hat
    rect(x-20, y-13, 40, 3);//hat
    stroke(50, 50, 50);
   // strokeWeight(2);
    line(x-20, y+33, x-50, y);//arm
    line(x+20, y+33, x+50, y);//arm
    }
 
 void snowflake(int x, int y){
     fill(255, 255, 255);
     ellipse(x, y, 2, 2);
     }
