


void setup(){

size (300,300);
background(234,54,34);
//head
fill(255,179,144);
ellipse(150,150,100,100);
//left eye
fill(255,255,255);

ellipse(130,138,25,10);
noFill();
rect(116,133,27,10);


//right eye
fill(255,255,255);
ellipse(170,138,25,10);
noFill();
rect(156,133,27,10);

}
void draw(){
println("mouse x:");
println(mouseX);
println("mouse y:");
println(mouseY);
}



