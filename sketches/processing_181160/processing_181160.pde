
size(500,400);
background(247,90,90);
strokeWeight(2);


/*ous*/
fill(255,235,170);
ellipse(150,100, 100, 150); 
ellipse(250,100, 100, 150); 
ellipse(50,100, 100, 150); 

/*ouera*/
fill(183,147,109);
quad(0,175,0,100,325,100,300,175);


/*esferesblanques*/
fill(255);
ellipse(260,26,10,10);
ellipse(280,35,15,15);
ellipse(305,56,30,30);
ellipse(340,100,70,70);
ellipse(360,360,440,440);

/*tronc pollet*/
fill(255,233,108);
ellipse(300,300,175,150);


stroke(0);

/*ales*/
fill(214,187,32);
triangle(290,280,247,240,160,307);
  fill(255,233,108);
   triangle(290,280,247,240,160,300);
    triangle(290,280,247,240,160,293);
    triangle(290,280,247,240,160,286);
    triangle(290,280,247,240,160,286);

fill(214,187,32);
triangle(295,296,300,215,430,197);
fill(255,233,108);
triangle(295,296,300,215,430,190);
triangle(295,296,300,215,430,183);
triangle(295,296,300,215,430,176);




/*cap*/
ellipse(300,250,105,95);

fill(206,107,25);
triangle(297,250,315,270,325,240);
fill(255,156,75);
triangle(297,250,325,270,325,240);

fill(255);
ellipse(280,245,27,27);
fill(0);
ellipse(280,245,10,10);

fill(255);
ellipse(334,225,27,27);
fill(0);
ellipse(334,225,10,10);

/*potes*/
line(320,373,320,400);
    line(337,400,320,385);
    line(303,400,320,385);

line(280,373,280,400);
    line(263,400,280,385);
    line(298,400,280,385);

/*codis ous*/
textSize(8);
fill(255, 0, 0);
text("0-DE-3344461", 20, 90);   
text("0-DE-3344462", 120, 90);  
text("0-DE-3344463", 224, 90);


/*flying free*/
rotate(-0.3);
textSize(50);
fill(0);
text("Flying free!", 100, 430);



