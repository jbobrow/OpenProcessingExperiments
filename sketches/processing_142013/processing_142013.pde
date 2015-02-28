
/*
Konkuk University
SOS iDesign

Name: hye ri lee<<------ Write your full name here!
ID: 201420101 <<--------- Write your ID here!

*/

PImage img;

void setup(){
size (600, 600);
// noLoop();
colorMode(RGB, 255);
smooth();
img = loadImage ("bobo.jpg");
}


void draw(){
println(mouseX + " : " + mouseY);
//image (img, 0, 0);
fill(255);
quad(0,0,600,0,600,600,0,600);

colorMode(RGB,mouseX/(width/255),mouseY/(height/255),255);



//Head (Eyes)

stroke(0, 0, 0);
strokeWeight(2);
noFill();
ellipse(436, 260, 138, 138);
ellipse(161, 260, 138, 138);
line(379,187,392,204);
line(433,169,433,190);
line(490,188,480,206);
line(206,206,222,186);
line(161,189,160,168);
line(107,181,117,204);

//face
fill(255,54,181);
ellipse(547, 358, 96, 30);
ellipse(85, 358, 96, 30);

//mouth
noFill();
bezier(0,198,12,5,599,1,599,205);
fill(255, 187, 0);
bezier(124,444,260,323,414,359,474,441);
bezier(124,444,282,516,384,505,474,440);
line(125,444,473,442);


//Constrin
float mx1 = constrain(mouseX, 402, 470);
float mx2 = constrain(mouseX, 127, 195);
float my = constrain(mouseY, 226, 294);

fill(0);
ellipse(mx1, my, 30, 30);
ellipse(mx2, my, 30, 30);



if(mousePressed){ 


 translate(mouseX, mouseY); 


  fill(random(55,255),random(4,255),random(344,255)); 


  beginShape(); 



  vertex(0, -50); 


  vertex(14, -20); 


  vertex(47, -15); 


  vertex(23, 7); 


  vertex(29, 40); 


  vertex(0, 25); 


  vertex(-29, 40); 


  vertex(-23, 7); 


  vertex(-47, -15); 


  vertex(-14, -20); 


 
 endShape(CLOSE); 
} 


    } 

     



     


     




  






void keyPressed(){



  
   
}
