
size(300, 300);
background(#A9D9F0);
int x;
int y;
x = -2;
y = 1;
x = x + 3;
println(x);
y = y * y;
println(y);
float a;
float b;
a = y + x;
println(a);
b = y / a;
println(b);

strokeWeight(2);
rect( (height / 2) - 40, (width / 2) - 75, 80, 175); //Actual phone
strokeWeight(.5);
ellipse( height / 2, width / 2 + 87, 15, 15); // Home button
strokeWeight(1);
fill(0,0,0);
ellipse( height / 2, width / 2 - 60, 4, 4); //Camera
strokeWeight(2);
line ( height / 2 - 10, width / 2 - 50, height / 2 + 10, width / 2 - 50); //Speaker
strokeWeight(1);
ellipse( height / 2 - 15, width / 2 - 50, 3, 3); //Sensor
fill(0, 0, 0);
rect( (height / 2) - 35, (width / 2) - 40, 70, 115); //Screen
noFill();
strokeWeight(.5);
rect( height / 2 - 2.5, width / 2 + 84, 5, 5); //Home button square design


