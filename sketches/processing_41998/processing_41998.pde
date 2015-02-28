

/*
  int circleW = 150;
 int circleH = 150;
 int A = 255;
 int B = 128;
 int C = 0;


 */



float r = 50;
float g = 50;
float b = 150;
//int colorPat = (int) random(
//char mousePos = rect(mouseX,450,75,10);
//mousePos = (mouseX > 2*width/2);

boolean button = false;


void setup () {
  size (500, 500);
  background(r, g, b);
}

void draw (){ 
{
  //  rect(mouseX,450, 75,10);

  // background(r,g,b);
  stroke(128);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);

  //Top Left Square
//  if (mouseX < width/2 && mouseY < height/2) {
   // if (mouseY < height/2) {
      if (button) {
        fill(200, 255, 10); 
        noStroke();
        rect(0, 0, width/2, height/2);
      } else {
        fill(200,0,120);
        rect(0, 0, width/2, height/2);
    }
   }
}
   




  // Bottom Right Square    
//  if (mouseX > width/2 && mouseY > height/2) {
    //if (mouseY > height/2) {
     // if (mousePressed) {
        //r = r + 1;
     //   fill(0);
       // rect(width/2, height/2, width/2, height/2);


//  }

  // Bottom Left Square
 // if (mouseX < width/2 && mouseY < height) {
    //if (mouseY < height) {
     // if (mousePressed) {
   //     fill(128);
        // rectMode(CENTER);
     //   rect(0, 250,width/2 , height/2);

    
//  }

  //Top Right Square
//  if (mouseX < width && mouseY < height/2) {
   // if (mouseY < height/2) { 
  //    if (mousePressed) {
    //    fill(255);
        // rectMode(CENTER);
     //   rect(250, 0, width/2, height/2);
 


void mousePressed(){
  if (mouseX > 0 && mouseX < 250 && mouseY > 0 && mouseY < 250){ 
    button = !button;
  }  else if (mouseX > 250 && mouseX < 500 && mouseY > 250 && mouseY < 500){
    button = !button;
  }
}

//  }


 // }






  // } else {
  //r = r - 1;
  // fill(128);

/*   
  if (mouseY > height/2) {
    // b = b + 1;
    fill(200);
    //   } else {
    //  b = b - 1;
    //fill(128);
  }
  if (mousePressed) {
    // g = g + 1;
    fill(0);
    // } else {
    //g = g - 1;
    //fill(0);
  }
  r = constrain(r, 0, 255);
  g = constrain(g, 0, 255);
  b = constrain(b, 0, 255);
}    







  
 if(mouseX > width/2) {
 r = r + 1;} 
 else {
 r = r - 1;
 }
 if  (r > 255) {
 r = 200;}
 else if (r < 0) {
 r = 0;
 
 
 
 
 
 
 
 //Bottom Rectangle  
 
 }
 if (mouseX < width/3) {
 rect(mouseX,450,75,10);
 } else if (mouseX < 2*width/3){
 rect(mouseX, 450, 75,10);
 } else{
 rect(mouseX,450,75,10);
 }
 */







/* ellipseMode (CENTER);
 fill(255,255,0);
 ellipse(125, 100, circleW, circleH);
 ellipse(125, 400, circleW, circleH);
 ellipse(375, 100, circleW, circleH);
 ellipse(375, 400, circleW, circleH);
 
 //rectangle
 rectMode (CENTER);
 rect(width/2,height/2, mouseX+10,mouseY+10);
 
 
 // lines 
 beginShape (LINES);
 vertex (0,500);
 vertex (250,250);
 vertex (500,500);
 vertex (250,250);
 vertex (250,0);
 vertex (250,250);
 
 endShape(CLOSE);
 
 
 float grade = random(0,100);
 if (mouseX < width/3){
 background(A);
 }else if (mouseX< 2*width/3){
 background(B);
 }else {
 background(C);
 }
 
 int x = 5;
 println("x is now: " + x);
 if (x == 5) {
 x = 6;
 } else if (x == 6) {
 x = 5;
 }
 println( "x is now: " + x);
 */



