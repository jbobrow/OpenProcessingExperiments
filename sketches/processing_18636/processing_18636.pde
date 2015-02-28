
void setup(){
size(200,200);
background (0,0,0);

}


void draw(){


fill(mouseX,10,255);

ellipse(100,100,mouseX,mouseY);


}


void mousePressed(){

fill(255,mouseX,0);

rect(mouseX,mouseY,mouseX,mouseY);
}



