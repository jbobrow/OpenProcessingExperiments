
//write out random specifications
int w = int(random(1,100));
int h = int(random(1, 100)); 
int bw = int(random(1, 100)); 
int bh = int(random(1,100));

void setup() {
    //Set the size of the window
  size(320, 240) ;
}
 
 void draw() {
    //Draw a white background 
background(255) ; 
smooth() ;
frameRate(30) ; 

  //Set CENTER mode
ellipseMode(CENTER) ;
rectMode(CENTER) ; 

//Draw Shelby's head//
stroke(0) ; 
fill(10, 0, 255) ; 
ellipse(mouseX+20, mouseY+20, w+60, h+80) ; 

//Dray Shelby's body//
stroke(0) ;
fill(155, 0, 155) ; 
rect(mouseX, mouseY, bw, bh) ;

//Draw Shelby's Legs//
stroke(0, 191, 191) ;
line(70, 145, 70, 200) ; 
line(90, 145, 90, 200) ; 
line(110, 145, 110, 200) ;
line(130, 145, 130, 200) ;

if (mouseX < width*2) { 
  fill(30, 110, 70, 90); 
  ellipse(mouseX,mouseY,width/2,height);
}

stroke(0) ;
println("Shelby Likes Personal Digital Space") ;
 }


