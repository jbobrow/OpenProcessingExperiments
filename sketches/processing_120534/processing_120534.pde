
size(400, 565);
background(255);


for(int i=0; i<=565; i+=30)
{
  
 
    stroke(0);
  line(0, 0, i-165, 565);
line(i, 0, 400, 565);

 if(i <=300){
    fill(255);
  }
    else {
     fill(0, 0, 0, 127);
    }
  
    ellipse(350, i, 100, 100);
  
}


stroke(0);
strokeWeight(3);
fill(255, 0, 50);
rect(80, 200, 140, 10);

stroke(0);
strokeWeight(3);
fill(0);
rect(100, 50, 10, 200);

stroke(0);
strokeWeight(3);
fill(0);
rect(190, 0, 10, 50);

stroke(0);
strokeWeight(3);
fill(0);
rect(270, 40, 10, 100);

stroke(0);
strokeWeight(3);
fill(255);
rect(300, 170, 10, 100);

stroke(0);
strokeWeight(3);
fill(0);
rect(270, 300, 10, 100);

stroke(0);
strokeWeight(3);
fill(0);
rect(190, 340, 10, 100);

stroke(0);
strokeWeight(3);
fill(255);
rect(100, 370, 10, 100);

stroke(0);
strokeWeight(3);
fill(0);
rect(10, 340, 10, 100);





