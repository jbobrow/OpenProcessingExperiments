

size(500,500);
smooth();
background(0);

fill(#9C9DB2); 
noStroke();
translate(width/2, height/2);
for (int i=0;i<360;i+=30){
rotate(radians(30));
triangle(90,24,500,770,160,170);

ellipse(250,250,8200,200);
fill(#9C9DB2);
}




