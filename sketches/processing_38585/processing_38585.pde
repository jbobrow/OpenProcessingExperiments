
float x = 60;
float y = 60;
float w = 50;
float h = 50;
float rad = 10; 
float eyeSpace = 30;
float eyeLine = 40;
float teethx= x-30;
String text1 = "press a, b, c, d, e, f, g";
String text2 = "see what happens";


int state = 0;
int speed = 3;

void setup() {
  size(400, 400);
  background(255);
  smooth();
}

void draw() {
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //text
  fill(0);
  textSize(15);
  text(text1, 120, 150);
  text(text2, 120, 170);
  
  //eyeline
  line(x-eyeSpace, y, x-eyeSpace, y-eyeLine);
  line(x+eyeSpace, y, x+eyeSpace, y-eyeLine);
  
  //body
  fill(255, 83, 3);
  ellipse(x, y, 2*w, h);
  
  //eye
  fill(0, 255, 0);
  ellipse(x-eyeSpace, y-eyeLine, rad, rad);
  ellipse(x+eyeSpace, y-eyeLine, rad, rad);
  
  //legs
  line(x+45, y-10, x+60, y-20);
  line(x+48, y-5, x+65, y-10);
  line(x+50, y+3, x+65, y+5);
  line(x+45, y+10, x+60, y+20);
  
  line(x-45, y+10, x-60, y+20);
  line(x-48, y+5, x-65, y+10);
  line(x-50, y-3, x-65, y-5);
  line(x-45, y-10, x-60, y-20);
  
  
   for(float teethx= x-30; teethx <= x+(w-20) && teethx >= x-30; teethx += 10){
    float r = random(255);
    float g = random(255);
    float b = random(255);
    rectMode(CENTER);
    fill(r, g, b);
    rect(teethx, y-5, 8, 10);
    
    
    if(keyPressed){
      if(key == 'a' || key == 'A'){
        fill(255, 0, 0);
        //rect(x-30, y-5, 8, 10);
        triangle(x-30, y-10, x-25, y, x-35, y);
      } else {
        fill(255);
        rect(x-30, y-5, 8, 10);
  
      }
      
        if(key == 'b' || key =='B'){
          fill(255, 0, 0);
          //rect(x-20, y-5, 8, 10);
          triangle(x-20, y-10, x-15, y, x-25, y);
        } else {
          fill(255);
          rect(x-20, y-5, 8, 10);
       
     }
    
      if(key == 'c' || key == 'C'){
        fill(255, 0, 0);
        //rect(x-10, y-5, 8, 10);
        triangle(x-10, y-10, x-5, y, x-15, y);
      } else {
        fill(255);
        rect(x-10, y-5, 8, 10);
  
      }
      if(key == 'd' || key == 'D'){
        fill(255, 0, 0);
        //rect(x, y-5, 8, 10);
        triangle(x, y-10, x+5, y, x-5, y);
      } else {
        fill(255);
        rect(x, y-5, 8, 10);
  
      }
       if(key == 'e' || key == 'E'){
        fill(255, 0, 0);
        //rect(x+10, y-5, 8, 10);
        triangle(x+10, y-10, x+15, y, x+5, y);
      } else {
        fill(255);
        rect(x+10, y-5, 8, 10);
  
      }
        if(key == 'f' || key == 'F'){
        fill(255, 0, 0);
        //rect(x+20, y-5, 8, 10);
        triangle(x+20, y-10, x+25, y, x+15, y);
      } else {
        fill(255);
        rect(x+20, y-5, 8, 10);
  
      }
        if(key == 'g' || key == 'G'){
        fill(255, 0, 0);
        //rect(x+30, y-5, 8, 10);
        triangle(x+30, y-10, x+35, y, x+25, y);
      } else {
        fill(255);
        rect(x+30, y-5, 8, 10);
      }
     }
}
  
    
  //mouthsmile
    line(x-40, y-5, x+40, y-5);
  
  //move
  if (state == 0){
    x = x + speed;
    if(x > width - 60){
      x = width - 60;
      state = 1;
    }
  } else if(state == 1){
    y = y + speed;
    if (y > height - 40){
      y = height - 40;
      state = 2;
    }
  } else if(state == 2){
    x = x - speed;
    if(x < 60){
      x = 60;
      state = 3;
    }
  } else if(state == 3){
    y = y - speed;
    if(y < 60){
      y = 60;
      state = 0;
    }
  }
}

 void mousePressed(){
  fill(255, 0, 0);
  ellipse(x-eyeSpace, y-eyeLine, rad, rad);
  ellipse(x+eyeSpace, y-eyeLine, rad, rad);
 }
    
    /*if(key == 'a' || key == 'A'){
      //fill(255, 0, 0);
      //rect(x-30, y-5, 8, 10);
      triangle(x-30, y-10, x-25, y, x+35, y);
    } else {
      fill(255);
      
      rect(x-30, y-5, 8, 10);

    }
    
    if(key == 'b' || key =='B'){
        fill(255, 0, 0);
        rect(x-20, y-5, 8, 10);
      } else {
        fill(255);
        rect(x-20, y-5, 8, 10);
     
   }
  
    if(key == 'c' || key == 'C'){
      fill(255, 0, 0);
      rect(x-10, y-5, 8, 10);
      //rect(x-20, y-5, 8, 10);
    } else {
      fill(255);
      rect(x-10, y-5, 8, 10);

    }
    if(key == 'd' || key == 'D'){
      fill(255, 0, 0);
      rect(x, y-5, 8, 10);
      //rect(x-20, y-5, 8, 10);
    } else {
      fill(255);
      rect(x, y-5, 8, 10);

    }
     if(key == 'e' || key == 'E'){
      fill(255, 0, 0);
      rect(x+10, y-5, 8, 10);
      //rect(x-20, y-5, 8, 10);
    } else {
      fill(255);
      rect(x+10, y-5, 8, 10);

    }
      if(key == 'f' || key == 'F'){
      fill(255, 0, 0);
      rect(x+20, y-5, 8, 10);
      //rect(x-20, y-5, 8, 10);
    } else {
      fill(255);
      rect(x+20, y-5, 8, 10);

    }
      if(key == 'g' || key == 'G'){
      fill(255, 0, 0);
      rect(x+30, y-5, 8, 10);
      //rect(x-20, y-5, 8, 10);
    } else {
      fill(255);
      rect(x+30, y-5, 8, 10);

    }
 }*/

