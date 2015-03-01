
//Rotation
float secondRotation, minuteRotation, hourRotation;
 
void setup() {
size(600, 600);
}
 
void draw() {
 
background(#A9B0FA);
secondRotation = map(second(), 0, 60, 0, 360);
println(second());
 
noFill();
stroke(#392089);
ellipse(width/2, height/2, 125, 125);
noFill();
strokeWeight(20);
stroke(#392089);
ellipse(width/2, height/2, 320, 320);
stroke(#392089);
ellipse(width/2, height/2, 520, 520);
 
pushMatrix();
translate(width/2, height/2);
rotate(radians(secondRotation));
stroke(#A9B0FA);
line(0, 0, 0, -270);
popMatrix();
 
pushMatrix();
minuteRotation = map(minute(), 0, 60, 0, 360);
println(minute());
translate(width/2, height/2);
rotate(radians(minuteRotation));
stroke(#A9B0FA);
line(0, 0, 0, -220);
popMatrix();
 
pushMatrix();
hourRotation = map(hour(), 0, 24, 0, 720);
println(hour());
translate(width/2, height/2);
rotate(radians(hourRotation));
stroke(#A9B0FA);
line(0, 0, 0, -140);
popMatrix();
}
