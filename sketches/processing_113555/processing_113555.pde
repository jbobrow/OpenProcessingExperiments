

void setup(){
size(500,500);
smooth();
background(255,255,255,255);
}

void draw(){
  
pushMatrix();
fill(255,0,0);
rect(0,0,150,150);

fill(51,73,193);
rect(400,250,150,100);

fill(255,255,3);
rect(150,250,70,100);

popMatrix();

strokeWeight(10);
line(150,0,150,500);

strokeWeight(4);
line(220,0,220,500);


strokeWeight(6);
line(0,150,500,150);


line(0,250,500,250);

line(0,350,500,350);

line(150,450,400,450);

line(400,500,400,250);



//println(mouseY);

}












