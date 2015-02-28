

size(500,500);
smooth();
background(0);

fill(139,132,142,20); 
noStroke();
translate(width/2, height/2);
for (int i=0;i<360;i+=30){
rotate(radians(30));
triangle(90,230,20,170,160,170);

ellipse(200,200,180,180);
fill(139,132,142,20);



rotate(radians(30));
triangle(90,230,20,170,160,170);


rectMode(CENTER);
rect(0,90,140,140);


}




