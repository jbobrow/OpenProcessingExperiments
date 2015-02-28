
void setup(){
background ( 255 ) ;
size ( 600 , 600 ) ;
frameRate ( 70 ) ;


}

void draw()
{
  
noFill();
strokeWeight(1);
stroke(153, 0, 0, random(50));
rect(0, 0, mouseX, mouseY);

noFill();
strokeWeight(1);
stroke(0, 153, 0, random(50));
rect(height, 0, -mouseX, mouseY);

noFill();
strokeWeight(1);
stroke(255, 128, 0, random(50));
rect(0, width, mouseX, -mouseY);


noFill();
strokeWeight(1);
stroke(random(0), 102, 204, random(50));
rect(width, height, -mouseY, -mouseX);

strokeWeight(5);
stroke(255);
line(0, height/2, width, height/2);

strokeWeight(5);
stroke(255);
line(width/2, 0, width/2, height);

strokeWeight(10);
stroke(255);
line(0, 0, width, 0);

strokeWeight(10);
stroke(255);
line(0, height, width, height);

strokeWeight(10);
stroke(255);
line(0, 0, 0, height);

strokeWeight(10);
stroke(255);
line(width, 0, width, height);






}
