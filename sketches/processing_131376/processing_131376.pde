
background(165,150,135);
size(400,600);
noStroke();

//Background Layer - Large Rectangles

  fill(88,85,78);
rect(0,0,220,300); //background layer, top left rect
  
  fill(179,136,58,60); //opacity 60%
rect(200,0,200,340); // background layer, bottom left corner 
  
 fill(255,239,189); //opacity 50%
rect(260,280,150,320); //bottom right rect
   
 fill(132,128,119,50); //opacity 50%
rect(0,280,300,400); //bottom brown rect


//Layer 2  - Larger Quads

  fill(54,49,45);
quad(120,200,160,240,0,400,0,320); //middle bottom left quad

  fill(101,87,60);
quad(240,560,320,480,400,560,400,600); //bottom right quad

  fill(132,128,119);
quad(100,600,220,480,320,600,220,600); //bottom irght quad 

  fill(163,147,114);
quad(300,580,320,600,400,600,340,540); //bottom right quad

  fill(179,136,58);
quad(0,400,120,280,220,380,0,600); //mid bottom left quad

  fill(70,70,78);
quad(0,440,20,420,100,500,0,600); 
//mid bottom left quad, appears from corner

quad(0,160,20,140,40,180,0,220); //blue quad

//Layer 3

  fill(90,70,46);
quad(0,0,80,0,120,40,80,80);

quad(0,80,40,40,80,80,0,160); 



//Layer 4

  fill(70,70,78);
rect(100,0,60,140); //Upper navy rectangle

  fill(255,239,189);
rect(100,120,40,60); //small bright yellow rectangle
  
  fill(90,70,46); //long rectangle 
rect(220,0,60,260);


//Layer 5
 
  stroke(0);
line(240,80,240,220);

line(250,120,250,240);

line(260,100,260,240);

//Central Circle
  noStroke();
  fill(54,49,45);
ellipseMode(RADIUS);
ellipse(220,260,40,40);

//Arc
/*arc(300,300,80,80,0,PI+QUARTER_PI, OPEN);*/  //I tried


//I choose Georges Braque because I have always been fascinated in cubism. Being an abstract artist myself, I find the work of early modern painters interesting.  His work seemed realatively simple in terms of code, I was thinking of the simplified shapes and nuetral color pallete when I was creating this project.
// I think I represented his style as best I could.  



