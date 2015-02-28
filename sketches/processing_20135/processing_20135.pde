
size(250, 250);
smooth();
noStroke();
background(#3F1E40);
rotate(0.1);
rectMode(CENTER);
stroke(255);
noFill();

rect(160.5, 60, 10, 52);

rect(232.5, 127.5, 100, 50);
rect(232.5, 127.5, 85, 35);

rect(100, 100, 150, 150);
rect(65, 134, 60, 60);
fill(255, 150);
noStroke();
rect(82, 117, 10, 10);
stroke(255);
noFill();
rect(45, 45, 20, 20);

rect(190, 200, 80, 80);
rect(20, 240, 60, 60);
rect(20, 240, 80, 80);

rect(200, 40, 110, 110);

for(int y=0; y<=400; y+=15){ 
for(int x=0; x<=500; x+=15){ 
strokeWeight(10);
stroke(#0D6759, 10);
fill(0, 60);

ellipse(x,y,20,y-125); 
}}
rotate(-0.1);
stroke(255, 20);
strokeWeight(7);

for(int z = 17; z<=100; z += 10){
  line(z, 0, z, z+250);

}


