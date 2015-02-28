
void setup(){
size(250, 250);
smooth();
background(#AACCB1);

float rdm = random(40, 100);
float rdms = random(3, 5);
float rdmsw = random(1, 10);
strokeWeight(rdmsw);
noFill();
stroke(#654867, rdm);


strokeWeight(random(10, 20));

line(6*rdmsw, 0, 6*rdmsw, 250);
line(8*rdmsw, 0, 8*rdmsw, 250);
line(10*rdmsw, 0, 10*rdmsw, 250);
line(12*rdmsw, 0, 12*rdmsw, 250);
line(20*rdmsw, 0, 20*rdmsw, 250);


strokeWeight(random(3, 10));

line(40*rdms-40, 0, 40*rdms-40, 250);
line(42*rdms-40, 0, 42*rdms-40, 250);
line(44*rdms-40, 0, 44*rdms-40, 250);
line(46*rdms-40, 0, 46*rdms-40, 250);
line(48*rdms-40, 0, 48*rdms-40, 250);
}
