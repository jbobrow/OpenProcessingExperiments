

size(500,500);
smooth();
background(0);

fill(255,255,255,40); //rose
noStroke();
translate(width/2, height/2);
for (int i=0;i<360;i+=30){
rotate(radians(30));


//formes

rectMode(CENTER);
rect(0,90,10,140);

//autre sketches


rotate(radians(30));
triangle(90,230,20,170,160,170);
rectMode(CENTER);
rect(0,90,140,140);


}



