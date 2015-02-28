
void setup(){

size (500,500);


}

void draw(){
  
background(0,0,0);



pushMatrix(); 
noStroke();
fill(255,255,mouseX/2);
translate(50,50);
rect(mouseX,0,50,50, mouseX/20);
rect(mouseX,70,50, 50, mouseX/20);
rect(mouseX,140,50, 50, mouseX/20);
translate(350,0);
fill(255,255,mouseX/2);
rect(-mouseX,210,50, 50, mouseX/20);
rect(-mouseX,280,50, 50, mouseX/20);
rect(-mouseX,350,50, 50, mouseX/20);

popMatrix();

pushMatrix();
translate(0,0);
fill(0,0,0);
rect(220, 50, 100,50);
rect(300, 120, 100, 50);
rect(100, 190, 100, 50);

rect(280, 400, 100,50);
rect(100, 330, 100, 50);
rect(180, 260, 100, 50);
popMatrix();
}
