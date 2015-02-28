

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
    fill(143, 135, 99);
    rect(xgrid, ygrid, 1, 1);
}
}

int x = 320;
int y = 240;
stroke(0);
fill(255, 255, 157);
ellipse(x, y, 60, 60);
line(x - 20, y - 5, x-10, y); //left eye
line(x+20, y- 5, x+10, y); //right eye
line(x-10, y + 15, x+10, y+15); //mouth

//teeth//
fill(255, 250, 77);
rect(x-5, y+15, 5, 5);
rect(x, y+15, 5, 5);

//hat//
fill(247, 231, 140);
triangle(x - 50, y-10, x + 50, y - 10, x, y-50);



println("HERRO");
}



