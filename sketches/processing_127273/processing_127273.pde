
int counter;

void setup() {  //setup function called initially, only once
    size(250,250);
    background(255);


}

void draw() {  //draw function loops

strokeWeight(7);
line(80,20,110,60);

strokeWeight(7);
line(160,20,130,80);

strokeWeight(3);
rectMode(CENTER);
rect(120,110,50,100);

strokeWeight(2);
ellipseMode(CENTER);
ellipse(120,70,80,50);

ellipseMode(CENTER);
ellipse(105,65,17,17);

ellipseMode(CENTER);
ellipse(135,65,17,17);

}
