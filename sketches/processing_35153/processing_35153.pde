

void setup(){
size (800, 600);

background(0);

}

void draw(){

stroke(mouseX,mouseY,20,20); //puedo hacer esto mejor?

float distance = dist(mouseX, mouseY,pmouseX, pmouseY);

float maxStroke =45;

strokeWeight(maxStroke - constrain(distance, 10, maxStroke));


rect(pmouseX, pmouseY, mouseX, mouseY);

}

