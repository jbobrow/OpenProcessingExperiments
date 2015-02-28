
size(500,500);
smooth();

background(0);
fill(255);
strokeWeight(4);
stroke(255);
fill(255);
ellipse(400, 190, 60,60);

fill(255);
ellipse(100, 190, 60,60);

rect(95, 105, 300, 200);
fill(0);
noStroke();


rect(105, 110,282 ,190);
//left eye
fill(254,241,62);
stroke(255);
strokeWeight(8);
ellipse( 150, 195, 60, 60);
//right eye
ellipse( 345, 195, 60, 60);
noFill();
strokeWeight(17);
stroke(255);

for(int y= 240; y< 300; y +=60){
  for(int x=200; x < 300; x+=20)
  {
    rect(x,y-10, 20,60);
  }
}



strokeWeight(6);
fill(255);
 triangle(250, 155, 200, 110, 300, 110);
//nose
strokeWeight(6);
stroke(255);
fill(254,241,62);



 rect( 215, 180, 70, 30);
 strokeWeight(5);
 rect( 240, 110, 20,70);
 
 rect( 115, 120, 4, 20);
 rect( 115, 120, 20, 4);
 
 rect( 370, 120, 4, 20);
 rect( 350, 120, 20, 4);
 
 

