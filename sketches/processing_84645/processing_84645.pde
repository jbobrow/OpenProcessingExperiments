
size(500,500);
smooth();
background(0);

fill(225,225,225,40); 
noStroke();
translate(width/2, height/2);
for (int i=0;i<360;i+=30){
rotate(radians(30));


//formes 
triangle(90,230,20,170,160,170);
rectMode(CENTER);
rect(0,90,10,140);
rotate(radians(30));
triangle(90,230,20,170,160,170);
rectMode(CENTER);
rect(0,90,140,140);


}



