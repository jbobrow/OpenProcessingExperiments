
//Fly1
float flyX;
float flyY;
float flyF1;
float flyF2;
float flyF3;
float rootX;
float rootY;

//Fly2
//float 2flyX;
//float 2flyY;
//float 2flyF1;
//float 2flyF2;
//float 2flyF3;
//float 2rootX;
//float 2rootY;

int scoreP;
int fly;
int flyA;
int flyB;


void setup() {
  size(450, 500);
  int flyA = 0;
  int flyB = 0;


  fly = 0;
  scoreP = 0; 
  
  //Fly1
  flyX = 1;
  flyY = 1;
  flyF1 = 1;
  flyF2 = 1;
  flyF3 = 1;
  
   //Fly2
//  2flyX = 1;
//  2flyY = 1;
//  2flyF1 = 1;
//  2flyF2 = 1;
//  2flyF3 = 1;
}

void draw() {
  background(flyF3+mouseX/4, flyF1+mouseY/4, flyF2);
  
  
  //Moving flyswatter
  strokeWeight(4);
  line(mouseX, mouseY, mouseX, mouseY-200);
  noFill();
  rect(mouseX-50, mouseY-300, 100, 100, 7);  

  //Verticle lines
  strokeWeight(1);
  line(mouseX-45, mouseY-300, mouseX-45, mouseY-200);
  line(mouseX-40, mouseY-300, mouseX-40, mouseY-200);
  line(mouseX-35, mouseY-300, mouseX-35, mouseY-200);
  line(mouseX-30, mouseY-300, mouseX-30, mouseY-200);
  line(mouseX-25, mouseY-300, mouseX-25, mouseY-200);
  line(mouseX-20, mouseY-300, mouseX-20, mouseY-200);
  line(mouseX-15, mouseY-300, mouseX-15, mouseY-200);
  line(mouseX-10, mouseY-300, mouseX-10, mouseY-200);
  line(mouseX-5, mouseY-300, mouseX-5, mouseY-200);
  line(mouseX, mouseY-300, mouseX, mouseY-200);
  line(mouseX+5, mouseY-300, mouseX+5, mouseY-200);
  line(mouseX+10, mouseY-300, mouseX+10, mouseY-200);
  line(mouseX+15, mouseY-300, mouseX+15, mouseY-200);
  line(mouseX+20, mouseY-300, mouseX+20, mouseY-200);
  line(mouseX+25, mouseY-300, mouseX+25, mouseY-200);
  line(mouseX+30, mouseY-300, mouseX+30, mouseY-200);
  line(mouseX+35, mouseY-300, mouseX+35, mouseY-200);
  line(mouseX+40, mouseY-300, mouseX+40, mouseY-200);
  line(mouseX+45, mouseY-300, mouseX+45, mouseY-200);

  //Horizontal lines
  line(mouseX-50, mouseY-295, mouseX+50, mouseY-295);
  line(mouseX-50, mouseY-290, mouseX+50, mouseY-290);
  line(mouseX-50, mouseY-285, mouseX+50, mouseY-285);
  line(mouseX-50, mouseY-280, mouseX+50, mouseY-280);
  line(mouseX-50, mouseY-275, mouseX+50, mouseY-275);
  line(mouseX-50, mouseY-270, mouseX+50, mouseY-270);
  line(mouseX-50, mouseY-265, mouseX+50, mouseY-265);
  line(mouseX-50, mouseY-260, mouseX+50, mouseY-260);
  line(mouseX-50, mouseY-255, mouseX+50, mouseY-255);
  line(mouseX-50, mouseY-250, mouseX+50, mouseY-250);
  line(mouseX-50, mouseY-245, mouseX+50, mouseY-245);
  line(mouseX-50, mouseY-240, mouseX+50, mouseY-240);
  line(mouseX-50, mouseY-235, mouseX+50, mouseY-235);
  line(mouseX-50, mouseY-230, mouseX+50, mouseY-230);
  line(mouseX-50, mouseY-225, mouseX+50, mouseY-225);
  line(mouseX-50, mouseY-220, mouseX+50, mouseY-220);
  line(mouseX-50, mouseY-215, mouseX+50, mouseY-215);
  line(mouseX-50, mouseY-210, mouseX+50, mouseY-210);
  line(mouseX-50, mouseY-205, mouseX+50, mouseY-205);

// LOGIX for repeating patterns
  //in setup
  //int[]xArray

  //for(int = 0; i <45;i=i=5)
  //line(mouseX=i,mouseY-300, mouseX+i, mouseY -200)


// Flyswatter grip
  fill(0, 0, 0);
  ellipse(mouseX, mouseY, 20, 60);


// Logics for moving fly
  flyX = flyX + random(-20, 20);
  flyY = flyY + random(-2, 5) + flyX/100;

// Logics for Respawning fly
  if (flyX > width || flyX < 0 || flyY > height-200){
    flyX = random(0, width);
    flyY = random(-100, 0);
    fly = fly + 1;
    
    //flyA = 100;
    //flyB = 100;
    
      //fill(flyF1, flyF2, flyF3);
 // triangle(flyA+10, flyB+10, flyA+10, flyB-20, flyA+0, flyB-30);
  //triangle(flyA+10, flyB+10, flyA+10, flyB-20, flyA+20, flyB-30);

      //Fly eyes
      fill(250, 0, 0);
      ellipse(flyA+7, flyB-3, 5, 5);
      ellipse(flyA+14, flyB-3, 5, 5);
  }

  //Texts
  textSize(30);
  text(fly, 80, 50);
  text("FLY:", 20, 50);
  text("YOU:", 340, 50);
  text(scoreP, 420, 50);
 
 
  //Fly graphic
  fill(flyF1, flyF2, flyF3);
  triangle(flyX+10, flyY+10, flyX+10, flyY-20, flyX+0, flyY-30);
  triangle(flyX+10, flyY+10, flyX+10, flyY-20, flyX+20, flyY-30);

      //Fly eyes
      fill(250, 0, 0);
      ellipse(flyX+7, flyY-3, 5, 5);
      ellipse(flyX+14, flyY-3, 5, 5);


// Hitting the fly
  rootX = mouseX;
  rootY = mouseY-250;

  if (mousePressed) {
    if ( rootX > flyX -50 && rootX < flyX+50 && rootY > flyY-50 
      && rootY < flyY+50) {
      scoreP ++;
      flyX = random(0, width);
      flyY = random(-100, 0);
      flyF1 = random(0, 200);
      flyF2 = random(0, 200);
      flyF3 = random(0, 200);
     
    } else {
      ;
    }
  }

//if (scoreP==5 ||scoreP==10){
 //fly = fly-1;
  
}



//f mouseX = 

//Logix 
//float scoreP = 0;

//void mousePressed() {
//  score ++;
//  if (flyX == 0) {
//    flyX = random(100, 700);
//    flyY = random(0, 200);
//    flyF1 = random(0, 200);
//    flyF2 = random(0, 200);
//    flyF3 = random(0, 200);
//  } else {
//    flyX = random(100, 700);
//    flyY = random(0, 200);
//    flyF1 = random(0, 200);
//    flyF2 = random(0, 200);
//    flyF3 = random(0, 200);
//  }

//  println(score);
//  //println(scoreP);
//
//  if(200 < abs(dist(mouseX, mouseY, flyX, flyY)) < 300){
//  scoreP ++;
//}

//abs(mouseX-flyX) = absolute value. 
//map( 

