

size(500,500);
smooth();
background(#4F4F5A);

fill(188,104,219,50); 
noStroke();
translate(width/2, height/2);
for (int i=0;i<360;i+=30){
rotate(radians(30));


//formes
rotate(radians(5));
rectMode(CENTER);
rect(200,130,10,140);

rotate(radians(30));
triangle(90,30,20,170,160,170);
rectMode(CENTER);
rect(0,90,140,140);


}




