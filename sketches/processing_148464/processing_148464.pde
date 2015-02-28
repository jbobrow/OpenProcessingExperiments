
int[][] gr = new int[4][50];

PImage pic;
PImage img;
float timer = 10;
int clicks = 0;
int state = 0;
int x;
int y;
int os = 0;

int winnyClicks = 30; //clicks to incr time


//os variable 
//after screen starts at 0, increase by 100 pixels 

void setup() {
  
  fill(155);
  size(400,400);
  img = loadImage("fer.jpg");
  pic = loadImage("cb.jpg");
  drawGrids();

}

void draw() {
  
  noStroke();
  fill(155);
  rect(230,5,60,60);
  stroke(0);
  
  
  fill(255);   
  textSize(30);
  text("TIME: " + (int)timer, 160, 30);
  
  noStroke();
  fill(155);
  rect(220, 40, 50,30);
  stroke(0);
  
  fill(255,0,0);
  textSize(35);
  text(clicks,220,70); 
  if (state == 0) {
  timer -= 0.045;
  if (timer < 0) {
     timer = 0;
     state = -1;   
 
  }  
  }
  if (clicks == 50) {
    state = 69;
  }  
  if (state == 69) {
       fill(0,0,255);  
       text(" YOU WIN! ", 40, 200 );
       textSize(50); 
  }  
  if (state == -1) {   
       image(pic,0,0,400,400);   
       fill(255,0,0);
       textSize(50);
       text(" 'BANG BANG' ", 40,200);  
  }   
   
}  
  

//Have a method that checks if the mouse is inside a picture, have 
//something call upon that method to increase clicks

void drawGrids() {
  
  
  pushMatrix();
  translate(0,os); 
   
  /*int grid = 100;
   
  for (int a = 0; a < width;  a += grid) {
     line(a ,0 ,a,height);
  }for (int b = 0;b < height; b += grid) {
     line(0, b,width, b);     
  }  
  
  /*for (int r = 0; r < gr.length; r++) {
    for(int c = 0; c< gr[0].length; c++) {
      gr[r][c] = new Square();    
    } 
  }*/
      /*image(img, 100, 0, 100,100); //top
      image(img, 300, 100, 100, 100);
      image(img, 300, 200, 100, 100);
      image(img, 100, 300, 100, 100);
      image(img, 0, 400, 100, 100);
      image(img, 0, 500, 100, 100);
      image(img, 100, 600, 100, 100);
      image(img, 200, 700, 100, 100);
      image(img, 100, 800, 100, 100); 
      image(img, 0, 900, 100, 100); //bottom*/
  
  for (int row = 0; row < gr.length; row++) {
    for ( int col = 0; col <gr[0].length; col++) {
      fill(155);
      x = 100*row;
      y = 100*col; 
      rect(x,y,100,100);
      
    
      image(img, 100, 0, 100,100); //top
      image(img, 300, 100, 100, 100);
      image(img, 300, 200, 100, 100);
      image(img, 100, 300, 100, 100);
      image(img, 0, 400, 100, 100);
      image(img, 0, 500, 100, 100);
      image(img, 100, 600, 100, 100);
      image(img, 200, 700, 100, 100);
      image(img, 100, 800, 100, 100); 
      image(img, 0, 900, 100, 100);
      image(img, 100, 1000, 100, 100);
      image(img, 0, 1100, 100, 100);
      image(img, 200, 1200, 100, 100);
      image(img, 300, 1300, 100, 100);
      image(img, 0, 1400, 100, 100);
      image(img, 300, 1500, 100, 100);    
      image(img, 100, 1600, 100, 100);
      image(img, 300, 1700, 100, 100);
      image(img, 100, 1800, 100, 100);
      image(img, 100, 1900, 100, 100);
      image(img, 200, 2000, 100, 100);
      image(img, 0, 2100, 100, 100);
      image(img, 100, 2200, 100, 100);
      image(img, 300, 2300, 100, 100);
      image(img, 100, 2400, 100, 100);
      image(img, 100, 2500, 100, 100);
      image(img, 200, 2600, 100, 100);
      image(img, 0, 2700, 100, 100);
      image(img, 100, 2800, 100, 100);
      image(img, 300, 2900, 100, 100);
      image(img, 100, 3000, 100, 100);
      image(img, 100, 3100, 100, 100);
      image(img, 200, 3200, 100, 100);
      image(img, 0, 3300, 100, 100);
      image(img, 300, 3400, 100, 100);
      image(img, 100, 3500, 100, 100);
      image(img, 200, 3600, 100, 100);
      image(img, 0, 3700, 100, 100);
      image(img, 100, 3800, 100, 100);
      image(img, 100, 3900, 100, 100);
      image(img, 200, 4000, 100, 100);
      image(img, 0, 4100, 100, 100);
      image(img, 100, 4200, 100, 100);
      image(img, 100, 4300, 100, 100);
      image(img, 200, 4400, 100, 100);
      image(img, 300, 4500, 100, 100); 
      image(img, 0, 4600, 100, 100);
      image(img, 100, 4700, 100, 100);
      image(img, 300, 4800, 100, 100);
      image(img, 100, 4900, 100, 100);
      //end
      
      
      
      
    }  
  }
  popMatrix();
     
} 

/*public class Square() {
 
 boolean findImg(  
  
}  */
  
  




public int getRow() {
  if (mouseY < width/4) {
    return 0;
  } else if ( mouseY < width/2 && mouseY > width/4) {
    return 1;
  } else if ( mouseY < (3*width/4) && mouseY > width/2) {
    return 2;
  } else {
    return 3;
  } 
  
}

int getCol() {
  if (mouseX < width/4) {
    return 0;
  } else if ( mouseX < width/2 && mouseX > width/4) {
    return 1;
  } else if ( mouseX < (3*width/4) && mouseX > width/2) {
    return 2;
  } else {
    return 3;
  }  
}  


void mousePressed() {
  drawGrids();
  
  if(state == 0) {
    if (getRow() < 1) {
      clicks +=1; 
      os -= 100;
    }  
  } 
  
  if (clicks == winnyClicks) {
    winnyClicks += 10;
    timer += 10;
  }  
}  
  
  
  //println(getCol() + " , " + getRow());

  
      

        

