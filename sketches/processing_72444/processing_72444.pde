
float randomDiameter = 80;   //Global variable -float- diamter
int growingDiameter = 0;      //Global variable -int- diamter
int randomGreen = 0;           //Global variable -float- color 
boolean boolGrowing = false; //Global variable -boolean- to grow, or not to grow
void setup() {
  size (1200, 600);   //The size of our screen for Assignment 01B
  background (255);

}



void draw() {
  fill (98,50,30);
  rect(900,0, 400, 600);
  strokeWeight (2);
  fill (90,52,31);
  stroke (200,62,31);
  line (920,40,920,85);
  stroke (150,50,29);
  line (940,200,940,352);
  stroke (200,150,90);
  line (960,300,960,500);
  stroke (180,140,100);
  line (980,600,980,560);
  stroke (120,180,150);
  line (1000,0,1000,400);
  stroke (98,50,10);
  line (1010,90,1010,600);
  stroke (90,250,5);
  line (990,5,990,400);
  line (1100,35,1100,554);
  line (1050,600,1050,30);
  line (1080,600,1080,400);
  line (1150,20,1150,300);
  stroke (190,50,25);
  
  fill (255, 25);
  //rectangle (0,0,width,height);
  smooth ();                    //anti-aliasing
  strokeWeight (2);
  randomGreen = int(random(255)); //convert a random float to an int
  fill (0, randomGreen, 0);         //make a random green color 
  //randomDiameter = random(50);  //random number generator 
  ellipse (mouseX, mouseY, randomDiameter, randomDiameter);   //Ellipse drawn under our mouse
  fill (0);
  ellipse (50, 90, 20, 40);
  fill (200, 50, 0);
  
  triangle(150, 1000, 150, 500, 300, 800);
  noFill ();
  //arc (40, 400, 60, 800, PI+HALF_PI, HALF_PI);
  //arc (mouseX, mouseY, 700, 600, HALF_PI, TWO_PI);
  line (900,0,900,400);
  fill (0);
  stroke (2);
  line (75, 50, 150,600);
  //arc (mouseX, mouseY,70,90,0, HALF_PI);
  //arc (800,400,800,200, PI+HALF_PI, HALF_PI);
  if (boolGrowing == true) {  // 'Is boolGrowing equal to true?', if not, ignore...
    if (growingDiameter < 100) {
      growingDiameter++;
    }
    else {
      growingDiameter = 0;
    }
  }

  //ellipse (mouseX, mouseY, randomDiameter, growingDiameter);    //Ellipse drawn under our mouse
  arc(mouseX, mouseY, growingDiameter, randomDiameter, 0, HALF_PI);
  fill(100,40,80);
  arc(mouseX, mouseY, growingDiameter, growingDiameter, HALF_PI, PI);
  fill (200, 150, 10);
  arc(mouseX, mouseY, growingDiameter, growingDiameter, PI, PI+QUARTER_PI);
  fill (50, 120, 30);
  arc(mouseX, mouseY, growingDiameter, growingDiameter, PI+QUARTER_PI, TWO_PI);
  fill (60, 80, 35);
  //arc(mouseX, 50, 100, 100, PI+QUARTER_PI, TWO_PI);
  fill (0);
  stroke(50, 102, 25);
  //curve(randomDiameter, 260, 5, 26, 73, 24, 73, 61);
  stroke(0); 
  curve(mouseX, mouseY, 73, 24, randomDiameter, 610, 15, 65); 
  //curve (mouseX, mouseY, mouseX, mouseY, randomDiameter,50,40,72);
  stroke(255, 102, 0);
  curve(mouseX, mouseY, 730, 61, growingDiameter, 65, 15, 65);
}



void mouseClicked() {
  //if (boolGrowing == false){
  //   boolGrowing =true;
  // }
  // else{
  //  boolGrowing = false;
  // }
  boolGrowing = !boolGrowing;
}




void keypressed() {
  if (key=='s') 
    save ("CourtneyWood.png");
}
