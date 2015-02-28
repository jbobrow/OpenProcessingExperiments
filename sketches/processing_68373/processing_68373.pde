
//owl face

size(500, 350);
background(113, 112, 106);
smooth();

//Dark Grey stripe
strokeWeight(50);
stroke(46,49,52);
line(width/2,0,width/2,height);
   
//Dark Purple stripe
strokeWeight(40);
stroke(103,103,96);
line(width/2,0,width/2,height);
   
//Grey triangles
noStroke();
fill(194,209,195);
for(int i=0; i <= height-20; i += 20){
  triangle(width/2,i,width/2-20,i+20,width/2+20,i+20);
  }
   
//Black stripe 
strokeWeight(10);
stroke(0,0,0);
line(width/2,0,width/2,height);
   
//Mustard triangles
noStroke();
fill(71, 163, 180);
for(int i=20; i < height+10; i += 20){
  triangle(width/2,i,width/2+10,i-10,width/2-10,i-10);
  }

//Blue middle concave curve shape
noStroke();
fill(103, 103, 103);
arc(0, 290, 460, 480, TWO_PI-PI/2, TWO_PI);
arc(500, 290, 460, 480, PI, TWO_PI-PI/2);
rect(0, 350-60, 500, 60);

//left eye
stroke(0, 0, 0);
strokeWeight(4);
fill(206, 162, 40);
ellipse(120, 180, 170, 170);
//inside beige area
noStroke(); 
fill(206, 183, 119);
ellipse(120, 180, 155, 155);
//iris 
strokeWeight(5);
fill(0, 0, 0);
ellipse(120, 180, 85, 85);
fill(206, 204, 200);
ellipse(120, 180, 40, 40);
fill(0, 0, 0);
ellipse(120, 180, 25, 25);
fill(255, 255, 255);
ellipse(120, 180, 20, 20);

//right eye 
stroke(0, 0, 0);
strokeWeight(4);
fill(206, 162, 40);
ellipse(380, 180, 170, 170);
//inside beige area
noStroke();
fill(206, 183, 119);
ellipse(380, 180, 155, 155);
//iris 
strokeWeight(5);
fill(0, 0, 0);
ellipse(380, 180, 85, 85);
noStroke();
fill(206, 204, 200);
ellipse(380, 180, 40, 40);
fill(0, 0, 0);
ellipse(380, 180, 25, 25);
fill(255, 255, 255);
ellipse(380, 180, 20, 20);

//white dots around the eyes
int radius = 100;
for(float i = 0; i < TWO_PI; i = i + 0.16)  {
noStroke();
  fill(255, 255, 255);
  ellipse(120 + radius*sin(i), 180 + radius * cos(i), 10, 10);
}
for(float j= 0; j < TWO_PI; j = j + 0.16) {
  fill(255, 255, 255);
  ellipse(380 + radius*sin(j), 180 + radius * cos(j), 10, 10);
  
} 

//black arcs 
boolean changeColor = false;
noFill();
for(int i = 480; i < 900; i++) {
  if(i % 10 == 0) {
    if(changeColor == true) {
      changeColor = false;
      stroke(0, 0, 0);
    } else {
      changeColor = true;
      stroke(117, 160, 170);
    }
  }
//blue arcs
  arc(0, 290, 460, i, TWO_PI-PI/2, TWO_PI);
  arc(500, 290, 460, i, PI, TWO_PI-PI/2);
}


//diamond quads
noStroke();
fill(242, 182, 103);

for(int k=0; k<550; k=k+30){ 
quad(k, 320, k+15, 330, k, 350, k-15, 330);
}

fill(65, 237, 192);
for(int l=0; l<550; l=l+30){
quad(l, 290, l+15, 310, l, 320, l-15, 310);
}  

//triangle
stroke(0.5);
fill(201, 189, 154);
triangle(250, 330, 230, 290, 270, 290);
