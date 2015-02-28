
// happy coding ~
size(200,200);

background(200,100,180);
stroke(250);
fill(0);
strokeWeight(4);
ellipse(50,70,50,50);
ellipse(70+80,70,50,50);
ellipse(100,120,20,20);
ellipse(50,70,10,10);
ellipse(150,70,10,10);

//머리
beginShape();
vertex(0,0);
vertex(200,0);
vertex(100,30);
endShape(CLOSE);

//눈
strokeWeight(4);
fill(280,70,100);
beginShape();
vertex(70,150);
vertex(100,180);
vertex(130,150);
endShape(close);
                
