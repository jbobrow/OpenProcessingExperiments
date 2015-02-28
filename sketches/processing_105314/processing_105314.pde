
//Lucy Morcos
//August 1, 2013
//for loop, function and mousePressed
//for loop help: http://www.learningprocessing.com/exercises/chapter-6/exercise-6-8/

PFont thefont;

void setup(){
size(600,600);
thefont = loadFont("ArialMT-48.vlw");


}

void draw(){
  background(255);
  
  textFont(thefont);   //add font
  fill(90);
  text("Hit the TV",220,500);
 
 fill(160,82,45);   //draw tv
  stroke(139, 69, 19);
  rect(180,175,290,250);
  
 fill(205,201,201);
  stroke(50,50,50);
  rect(200,200,200,200);
  ellipse(435,230,35,35);
  ellipse(435,290,35,35);
  
  line(300,175,220,50);
  line(330,175,420,50);
  ellipse(220,50,15,15);
  ellipse(420,50,15,15);
  
  
if(mousePressed){
  mousePressed(); //if mousepressed boolean, call to mousepressed function
}


}


void mousePressed(){ //begin function

for (int x = 0; x < 200; x+=10) { //x for loop x must be 0 and as long as it is less than width of 200, add 10
  for (int y = 0; y < 200; y+=10) { //for loop within does same with y
    noStroke();
    fill(random(255),random(255),random(255));
    rect(x+200,y+200,10,10); //moved the squares over 200, int x and y are replicated
  }
} 


}
