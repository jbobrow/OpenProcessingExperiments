
 
/*type*/

void setup (){
size(800,800);
background (41,162,173);

}

void draw() {
}

void keyPressed () {

ellipse (mouseX, mouseY,100,100);

fill(mouseX,0,mouseY);

//if you want different range of colors (map(mouseX,0 ,width,0,255) ,map(mouseY,0,height,0, 255),100); //
}
                
                
