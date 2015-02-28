
float w = random(120,130);
int value1 = 300;
int value2 = 300;
float z = random(.4,.3);

void mouseDragged() {
  
  //change line2 when mouseDragged
  value1 = mouseX;
  if (value1 > 450) {
    value1 = 450;
  }
  if (value1 < 150) {
    value1 = 150;
  }
}
void setup() {
  size(600,600);
  smooth();



}
void draw() {
  //create pages
  page1();
 //press UP to continue
if (key == CODED) {
  if (keyCode == UP) {
  page2();
  }
}
}

void page1() {
    background(255);
    
  /*Ponzo illusion with line perspective
  Draw background perspective*/
  line(300,100,300,400);
  line(275,100,225,400);
  line(250,100,150,400);
  line(325,100,375,400);
  line(350,100,450,400);
  
  //draw standard horizontal line, line1
  strokeWeight(2);
  line(240,200,360,200);
  rectMode(CENTER);
  
  //draw random horizontal line for comparison, line2
  rect(300,300,value1-100,1);
  
  //draw slider bar
  line(150,500,450,500);
  fill(#3DE325);
  rect(value1,500,10,20); 



  
  //cursor turns from arrow to hand when over slider
    if (mouseX > value1 - 5 && mouseX < value1 + 5 && mouseY > 490 && mouseY < 510) {
    cursor (HAND);
  } 
  else {
    cursor (ARROW);
  }
  
   //draw "arrow UP" text
  fill(0,0,0);
  text("Press arrow UP to go to the next page.",225,575);
  
  //draw 'compare' button
  fill(#9BBBC7);
  rect(500,100,100,30);
  fill(0,0,0);
  textSize(20);
  text("compare",460,105);


//show lines to compare
if (mousePressed = mouseX > 450 && mouseX < 550 && mouseY > 75 && mouseY < 125 == true) {
  stroke(255,0,0);
  line(240,200,240,298);
  line(360,200,360,298);
  
}
stroke(0);
}



  

  
  
void page2(){
 rectMode(CENTER);
  ellipseMode(CENTER);
  background (255);
  
  
//vertical, starting at 300x150, ending at i+100, 450) 
  for (int i = -20000; i < 20500; i = i+100) {
  line(300, 150, i, 450);
  }
  
//horizontal, increasing distance
int a = 1  ;
int b = 10 ;
  for(int h = 1; h < 300; h = h + a) {
  a = a + b;
  b = b++;
  line(0,150+h,600,150+h);
  }
  
  //draw standard horizontal line, door1
  rect(300,110,40,80);
  // raampje 1
    fill(255);
    rect (300,95,20,30);
  rectMode(CORNER);

  //draw random horizontal line for comparison, door2
  //x,y-leftdown,width,height.
  fill(0);
  rect(450,410,40,-value1*z);
    fill(255);
    rect (460,375,20,-value1*z+45);
  
  //draw slider bar
  rectMode(CENTER);
  line(150,500,450,500);
  fill(#3DE325);
  rect(value1,500,10,20); 



  
  //cursor turns from arrow to hand when over slider
    if (mouseX > value2 - 5 && mouseX < value2 + 5 && mouseY > 490 && mouseY < 510) {
    cursor (HAND);
  } 
  else {
    cursor (ARROW);
  }
  
   //draw "arrow UP" text
  fill(0,0,0);
  text("Press arrow UP to go to the next page.",225,575);
  
  //draw 'compare' button
  fill(#9BBBC7);
  rect(500,100,100,30);
  fill(0,0,0);
  textSize(20);
  text("compare",460,105);


//show lines to compare
if (mousePressed = mouseX > 450 && mouseX < 550 && mouseY > 75 && mouseY < 125 == true) {
  stroke(255,0,0);
  noFill();
  rectMode(CORNER);
  
  rect (450,410,40,-80);
  fill(0);
}
stroke(0);
}






