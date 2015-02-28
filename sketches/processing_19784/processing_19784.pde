
void setup(){
size(250, 250);
smooth();
background(0);

float rdm = random(50, 80);
float rdms = random(3, 5);
float rdmsw = random(1, 10);
strokeWeight(rdmsw);
ellipseMode(CENTER);

noFill();
stroke(#607E96, rdm);
ellipse(20, 20, 20*rdms, 20*rdms);
ellipse(20, 200, 50*rdms, 50*rdms);
ellipse(180, 180, 40*rdms, 40*rdms);
ellipse(100, 200, 30*rdms, 30*rdms);
ellipse(90, 100, 60*rdms, 60*rdms);
ellipse(100, 100, 20*rdms, 20*rdms);
ellipse(120, 90, 10*rdms, 10*rdms);
ellipse(100, 80, 20*rdms, 20*rdms);
ellipse(200, 100, 30*rdms, 30*rdms);
ellipse(20, 200, 30*rdms, 30*rdms);
ellipse(270, 270, 70*rdms, 70*rdms);


strokeWeight(random(1, 4));

line(6*rdmsw, 0, 6*rdmsw, 250);
line(8*rdmsw, 0, 8*rdmsw, 250);
line(10*rdmsw, 0, 10*rdmsw, 250);
line(12*rdmsw, 0, 12*rdmsw, 250);
line(20*rdmsw, 0, 20*rdmsw, 250);
}               
