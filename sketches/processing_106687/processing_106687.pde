
int x=20, y=20;

void setup() { //function def
    size(500,500);    
    println("Sucessfully ran.");
}

void draw() { //draw body
    int count=0;
   if (mousePressed == true) {
        fill (random(255),255,255,255);
        ellipse(mouseX,mouseY,20,20);
        }
   
   fill(0,255,0);
   ellipse(x,y,20,20);
   y = y+1;
   
   
   fill (255,0,0);
   ellipse(mouseX,mouseY,20,20);
}
