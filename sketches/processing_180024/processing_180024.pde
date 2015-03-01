
size(100,100); //canvas
background(255,255,255); //bg color

fill(210,150,90); //back of neck color
noStroke(); //no stroke
beginShape();//starts shape
vertex(30,70);//point
bezierVertex(31,69, 40,80, 28,90);//curve
vertex(58,100);//point
bezierVertex(60,80, 35,73, 66,60);//curve
endShape(CLOSE);//ends/closes shape 


fill(210,150,90); //face color
ellipse(40,40,57,57); //head
triangle(30,69, 69,37, 68,70);//chin
triangle(69,42, 73,50, 65,55);//nose
//rect(40,52,15,35);//neck

fill(255,255,75);//haircolor
stroke(255,255,75); //hairstroke
strokeWeight(1);//outlines hair
triangle(9,15, 12,58, 30,69); //back of hair
triangle(30,69, 45,30, 9,15); //middle of hair
triangle(9,15, 45,30, 40,10); //top of hair
ellipse(14,16,33,33); //bun

noStroke();//gets rid of stroke 

fill(210,150,90); //ear color
ellipse(38,46, 20,20);//ear

fill(255,255,75);//haircolor
triangle(40,10, 72,9, 40,50);//bangs
triangle(55,35, 66, 29, 63,28);//eyebrows

fill(255,255,255); //eye color
triangle(65,32, 65,45, 59,40); //eyeball

fill(0,150,240);//pupil color
triangle(66,34, 65,42, 63,40); //pupil

fill(200,100,50);//lip color
triangle(68,58, 68,64, 58, 59);//lip

fill(200,100,50, 100);//blush color
ellipse(55,50, 15,10);//blush


//bezier(31,69, 50,90, 20,90, 15,100); //curve



