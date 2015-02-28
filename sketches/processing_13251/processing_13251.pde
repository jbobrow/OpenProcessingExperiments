
size (200,200);
 
background( #006ea4 );

//eye
strokeWeight(3);
int[] x={40,160};
ellipse(x[0],100,50,50);
ellipse(x[1],100,50,50);
ellipse(x[0],100,30,30);
ellipse(x[1],100,30,30);
 
//face
stroke ( #ffffff );
strokeWeight(3);
line(0,50,75,50);
line(75,50,75,140);
line(75,140,125,140);
line(125,140,125,50);
line(125,50,200,50);

stroke( #5dc3c7 );
fill(#5dc3c7);
beginShape();
vertex(0,40);
vertex(85,40);
vertex(85,130);
vertex(115,130);
vertex(115,40);
vertex(200,40);
vertex(200,10);
vertex(0,10);
vertex(0,30);
endShape(CLOSE);

rect(10,140,50,10);
rect(140,140,50,10);
rect(95,155,10,50);


stroke ( #ffffff);
fill(#ffffff);
ellipse(100,70,23,23);
ellipse(55,145,10,10);
ellipse(145,145,10,10);

 
//mouth
strokeWeight(5);
stroke( #03386e );
fill(#ffffff);
beginShape();
vertex(50,170);
vertex(100,150);
vertex(150,170);
vertex(50,170);
endShape(CLOSE);        
                
