
void setup() {
  size(600,600);
  drawhouse();
  drawwindow();
}
 
float housewidth = 300;    //sets house height and width
float househeight = 100;
float windownumber = 0;
 
void draw() {
  if(housewidth < width){  //limits housewidth to sketch width
    drawwindow();
}
} 
 
void keyPressed() {
  if (key == 'q' || key == 'Q') {  
    housewidth--;
    drawhouse();
     drawwindow();
  }
  else if (key == 'w' || key == 'W') {
   housewidth++;
    drawhouse();
     drawwindow();
  }
   
  else if (key == 'k' || key == 'K') {
    househeight++;
    drawhouse();
     drawwindow();
  }
   
  else if (key == 'l' || key == 'L') {
    househeight--;
    drawhouse();
     drawwindow();
  }
 
  }

 
void drawhouse() {
  background(0);
  noFill();
  stroke(255);
 rectMode(CENTER);
 rect(300,300,housewidth,househeight);
 //triangle(housewidth-housewidth/1.5,househeight,width/2,househeight-50,housewidth+housewidth/1.5,househeight);
 
}

void drawwindow(){ 
  fill(150);
 rect(housewidth,300,housewidth/20,househeight/4);
 rect(housewidth+ 30,300,housewidth/20,househeight/4);
 rect(housewidth+60,300,housewidth/20,househeight/4);
  rect(housewidth+90,300,housewidth/20,househeight/4);
    rect(housewidth-30,300,housewidth/20,househeight/4);
     rect(housewidth-60,300,housewidth/20,househeight/4);
      rect(housewidth-90,300,housewidth/20,househeight/4);
       

  }



