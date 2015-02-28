
/*Sarah Scialli
Homework 2- "Repeat"
*/


int col = -1;
int prevCol = -1;
int row =-1;

void setup(){
  size(640,480);
  smooth();
}

void draw(){
 checkMouse();
 background(255);
 triangles();
 coloredLines();
 frontLines();
 borders(); 
  
}
//figure out the row and col of the mouse
void checkMouse(){
  col = -1;
  for(int i=25;i< width; i+=100){
    col = rangeMap(mouseX, i, i+100, 50, col);  
  }
  prevCol = col -100;
  row = -1;
  
  for(int j= 25; j<height-20; j+=100){
    row = rangeMap(mouseY, j, j+100, 25, row); 
    if(row > height){
      row = 0;  
    }
  }

}

//a function to map values from a bin to a discrete number
//if the value is not in the range, return another number
int rangeMap(int value, int lower, int higher, int offset, int prev){
  if((value > lower) &&( value <=higher)){
    return higher -  offset;   
  }
  else 
    return prev;
}


void frontLines(){
  stroke(0);
  strokeWeight(10); 
  noFill();
  
  for(int x = -25; x < width; x+=100){
    for(int y = 0; y < height-20; y+=100){
      //if curser is on bottom border, draw normal arcs
      if(row == 0){
        arc(x,y, 100, 200,0, QUARTER_PI + HALF_PI); 
        arc(x+105, y-30, 100, 300, QUARTER_PI, PI);
      }
      //draw open arcs for current row and col
      else if((x== col) && (y ==row)){
        arc(x+100, 0, 200, 2*y, HALF_PI, PI);
        arc(x-100, 0, 200, 2*y, 0, HALF_PI);
      } 
      //draw normal arcs in non row and col
      if(x != col){
         arc(x,y, 100, 200,0, QUARTER_PI + HALF_PI);      
      }
      if(x != prevCol){
         arc(x+105, y-30, 100, 300, QUARTER_PI, PI);
      }

      
    }

  }
}

void coloredLines(){
  stroke(201,34,60,90+mouseY);
  strokeWeight(5);
  line(150, height, width, height -150);
  stroke(9,102,214,90+mouseY);
  strokeWeight(20);
  line(width/2 +50, 0, width -50, height);
  stroke(112,48,144,90+mouseY);
  strokeWeight(10);
  line(100,0, 100,height);
  noStroke();  

  
}



void triangles(){
  strokeWeight(1);
  stroke(230);
  int w = 50;
  int h = 80;
  fill(18,47,95, 70+mouseY);
  for(int y = 25; y<height; y+=50){
    for(int x = 25; x<width -10; x+=50){
      triangle(x - .5 *w, y + .5 *h, x +.5 *w, y +.5*h, x, y - .5 *h);
    }
    fill(18+y/2, 47+y/2, 95+y/2, 70+mouseY);
  }
}

void borders(){
  fill(0);
  rect(0,0,30, height);
  rect(width -30,0, 30, height);
  rect(0,0, width, 30);
  rect(0, height-30, width, 30);
  
}





