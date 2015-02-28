
void setup (){
size (400, 400, P2D);
smooth (8);
rect (0,0, 200, 400);
fill (0);
rect (200,0, 200, 400);

}

void draw (){


fill(255);

//  triangle(x1, y1, x2, y2, x3, y3)
//triangle (0,0, 400, 400, 0, 400);


fill(0);
//triangle (0,0, 400, 400, 400, 0);


 if(mousePressed && mouseX > 200){
      fill (255);
   } else if (mousePressed && mouseX < 200){
     fill (0);
   } else{
      noFill ();
      noStroke ();
    }

 
 ellipse (mouseX, mouseY, 15, 15);   



}
