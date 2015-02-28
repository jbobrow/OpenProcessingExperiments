
PImage img;

size(400,565);
background(0, 0, 0);

//White
noStroke();
fill(255, 255, 255);
ellipse(300,500,360,360);

ellipse(60,60,110,110);

rect(280,10, 80, 80);

rect(150,10, 80, 80);

//Red
fill(255, 0, 0);

triangle(366,366,60,40,126,505);

rect(5,150, 80, 80);

rect(5,280, 80, 80);

rect(5,410, 80, 80);

rect(5,540, 80, 80);

//black
fill(0, 0, 0);
ellipse(340,436,40,120);

ellipse(230,500,40,120);

//lines
stroke(255, 0, 0);
strokeWeight(10);
line(117, 50, 400, 50);

line(350, 180, 250,180);

stroke(255);
strokeWeight(10);
line(45, 880, 45, 110);

line(300, 230, 300, 130);

//for if
//int eSize = 10;
noStroke();

for(int x = 0; x <= 8; x ++){
   if(x == 4){
     fill(0);
    } else{
        fill(255, 0, 0);
    }
  ellipse(x*20, 60 - x*2, 10, 10);
    println("x=" + x);  
}









