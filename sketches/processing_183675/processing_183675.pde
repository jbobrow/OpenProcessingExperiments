
size(700, 700);
background(7,55,73);



//SUN
fill(250, 255, 75);
ellipse(350, 350, 50, 50);

noFill();
strokeWeight(2);
stroke(250);

//ORBITS  


  //planet 1 tri 1
  fill(234,15,24);
  stroke(150);
  triangle(390,350,430,330,420,350);

//orbit 1
stroke(250);
noFill(); 
ellipse(350, 350, 120, 120);


   //planet 2 Round 
   fill(134,345,34);
   stroke(150);
   ellipse(325,255,20,20);
    
    
//orbit 2
stroke(250);
noFill(); 
ellipse(350, 350, 200, 200);

   
   
      //planet 3 triangel strip 
    fill(134,45,134);
    stroke(150);
    stroke(134,45,164);
    strokeJoin(ROUND);
    beginShape(TRIANGLE_STRIP);
    vertex(430, 475);
    vertex(440, 420);
    vertex(450, 475);
    vertex(460, 420);
    vertex(470, 475);
    vertex(480, 420);
    vertex(490, 475);
    endShape();
   
//orbit 3 
stroke(250);
noFill(); 
ellipse(350, 340, 340, 340);

  //planet 4 quad 
  fill(134,145,234);
  stroke(150);
  quad(300,20,360,50,380,90,340,120);

//orbit 4
stroke(250);
noFill();  
ellipse(350, 350, 600, 600);





