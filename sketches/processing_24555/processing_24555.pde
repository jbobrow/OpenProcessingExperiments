

void setup(){
   size(640, 480);
    smooth();
}

void draw(){

background(90, 83, 62);

//for loop
for (int ygrid=10; ygrid<=height; ygrid+=20){
  for (int xgrid=10; xgrid <=width; xgrid+=20){
    stroke (143, 135, 99);
    
    float redcolour = map(mouseX, 100, 255, 120, 255);
    float greencolour = map(mouseY, 0, 255, 120, 255);
    fill (redcolour, greencolour, 99);
    float xrect = map(mouseX, 0, 640, 5, 10);
    float yrect = map(mouseY, 0, 480, 5, 10);
    
    rect(xgrid, ygrid, xrect, yrect);
}
}

//BEGIN DRAWING OF CHINAMAN
int x = mouseX; //xpos of man
int y = mouseY; //ypost of man
stroke(0);

//body
fill(255);
rect(x-10, y, 25,50);//body
line(x+4, y+7, x+40, y+7);//arm

//face
fill(255);
triangle(x - 30, y, x + 30, y, x, y-50);
fill(255,0,0);
ellipse(x+5, y- 15, 3, 3); //right eye
ellipse(x+15, y- 20, 2, 2); //left eye

//gun
line(x+40, y+12, x+40, y+3);
line(x+40, y+3, x+60, y+3);





if (mousePressed == true){

  
  stroke(255, 247, 0);
  fill(255, 247, 0);
  ellipse(x+70, y+3, 10,10);
}

println("HERRO");
}



