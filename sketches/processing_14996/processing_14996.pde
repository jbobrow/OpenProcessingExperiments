
// Setting the background

void setup() { 

size(774,861);

PImage b;
b=loadImage("M_BG.jpg");
image(b,0,0);



// Drawing the lines

smooth();
strokeWeight(4);

stroke(#403D5C);
line(617,265,306,775);      
// Blue long line

stroke(#C7740A);
line(622,367,422,494);       
// Orange line

stroke(#AA2810);              
// Short red lines

line(345,803,288,766);
line(480,435,427,432);
line(235,460,180,482);

stroke(0);                     
line(133,240,43,241);
line(82,217,87,294);
line(455,430,443,210);
// Black lines

stroke(#B03B05);
line(210,465,71,127);          
// Orange long line


// Drawing the triangle

stroke(#EB7201);
fill(#EB7201);
triangle(372,387,403,245,310,243);

// Drawing last black line on the triangle

stroke(0);
line(584,436,338,371);



// Drawing rectangles and quadrilaterals

noStroke();

fill(#10284E);
quad(258,779,283,786,277,816,257,812);
// Small dark blue quad

fill(#403C77);
quad(288,638,300,638,301,648,288,650);
// Mini light purple quad

fill(0);
quad(365,341,455,305,467,333,371,368);
// Medium black quad

fill(#BD1304);
quad(89,400,648,188,655,206,96,417);
quad(540,169,568,159,609,268,582,280);
// Big red cross

fill(#AA0C01);
quad(168,249,419,244,418,177,167,209);
// Red quad

fill(#101103);
quad(224,202,213,130,501,91,511,165);
quad(314,120,305,31,397,26,406,105);
// Black shape semi-cross

fill(#CA3904);
quad(401,79,538,59,540,89,406,107);
// Medium orange quad


save("M_BG.jpg");


}



