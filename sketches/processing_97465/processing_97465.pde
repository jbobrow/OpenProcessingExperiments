


//declaring

int x = 10;
int y = 10;
int h = 10;



void setup() {
  println("I'm starting");
  
  size(400, 400);
  background(0);
  smooth();
  noStroke();
}

void draw() {
x = mouseX;
y = mouseY;
  
//------ 
//FOUR TRIANGLES

fill(255);
float r=map(mouseX, 0, width, 0, 255);
float g=map(mouseY, 0, width, 0, 255);

println("mouseX:" + "mouseX" + "remappedColor:" + r);
fill(mouseX,mouseY,0);
triangle(x+30, y+80, x+40, y+70, x+50, y+80);    //bottom
triangle(x+30, y, x+50, y, x+40, y+10);          //top
triangle(x, y+30, x+10, y+40, x, y+50);          //left
triangle(x+80, y+30, x+70, y+40, x+80, y+50);    //right

//------
//FOUR SQUARES
  
rect(x, y, h, h);        //top left
rect(x+70, y, h, h);     //top right
rect(x, y+70, h, h);     //bottom left
rect(x+70, y+70, h, h);  //bottom right
  
 
//------
//QUAD SHAPES
smooth();  
stroke(0);
strokeWeight(2);

//top LEFT
println("mouseX:" + "mouseX" + "remappedColor:" + r);
fill(mouseX,mouseY,0);                                       
quad(x+10, y+30, x+30, y+30, x+40, y+40, x+20, y+40);    // inner 1
quad(x+30, y+10, x+40, y+20, x+40, y+40, x+30, y+30);    //inner 2
  
println("mouseX:" + "mouseX" + "remappedColor:" + r);
fill(mouseX,mouseY,0);                                    
quad(x, y+20, x+20, y+20, x+30, y+30, x+10, y+30);       //outer 1
quad(x+20, y, x+30, y+10, x+30, y+30, x+20, y+20);       //outer 2
  

//bottom LEFT
println("mouseX:" + "mouseX" + "remappedColor:" + r);
fill(mouseX,mouseY,0);                                        
quad(x+20, y+40, x+40, y+40, x+30, y+50, x+10, y+50);    //inner 1 
quad(x+40, y+40, x+40, y+60, x+30, y+70, x+30, y+50);    //inner 2

println("mouseX:" + "mouseX" + "remappedColor:" + r);
fill(mouseX,mouseY,0);                                      
quad(x+10, y+50, x+30, y+50, x+20, y+60, x, y+60);       //outer 1
quad(x+30, y+50, x+30, y+70, x+20, y+80, x+20, y+60);    //outer 2

//top RIGHT
println("mouseX:" + "mouseX" + "remappedColor:" + r);
fill(mouseX,mouseY,0);                                         
quad(x+40, y+20, x+50, y+10, x+50, y+30, x+40, y+40);     //inner 1
quad(x+50, y+30, x+70, y+30, x+60, y+40, x+40, y+40);     //inner 2

println("mouseX:" + "mouseX" + "remappedColor:" + r);
fill(mouseX,mouseY,0); 
quad(x+50, y+10, x+60, y, x+60, y+20, x+50, y+30);        //outer 1
quad(x+60, y+20, x+80, y+20, x+70, y+30, x+50, y+30);     //outer 2
  
  
//bottom RIGHT
println("mouseX:" + "mouseX" + "remappedColor:" + r);
fill(mouseX,mouseY,0);                                         
quad(x+40, y+40, x+50, y+50, x+50, y+70, x+40, y+60);    //inner 1
quad(x+40, y+40, x+60, y+40, x+70, y+50, x+50, y+50);    //inner 2 
  
quad(x+50, y+50, x+60, y+60, x+60, y+80, x+50, y+70);    //outer 1
quad(x+50, y+50, x+70, y+50, x+80, y+60, x+60, y+60);    //outer 2 


//------
  //WHITE OUTER STROKES
stroke(255);
strokeWeight(1);
strokeCap(SQUARE);
line(x+10, y+10, x+70, y+70);
line(x+70, y+10, x+10, y+70);
line(x+40, y+10, x+40, y+70);
line(x+10, y+40, x+70, y+40);

//------
//CENTRE SQUARE
noStroke();
smooth();
fill(0);
quad(x+40, y+30, x+50, y+40, x+40, y+50, x+30, y+40);

  //
}










