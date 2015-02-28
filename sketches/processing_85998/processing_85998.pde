
size(400,300);
background(255,255,255);
noStroke();

//shell//
fill(0,100,0);//color of bottom rectangle
rectMode(CENTER);  // Set rectMode to CENTER
rect(220, 228, 190, 10);//bottom rectangle of shell
fill (50,205,50);//color of shell
arc(220, 225, 190, 190, -PI, 0);  // arc of shell

//spots on shell//
fill(0,100,0);
shapeMode(CENTER);
quad(180, 180, 195, 195, 180, 210, 165, 195);//in order from closest x coordinate
quad(200, 150, 215, 165, 200, 180, 185, 165);
quad(220, 180, 235, 195, 220, 210, 205, 195);
quad(240, 150, 255, 165, 240, 180, 225, 165);
quad(260, 180, 275, 195, 260, 210, 245, 195);



//head//
fill(0,100,0);
ellipse(334,200,76,76);//head
stroke(0);
arc(352, 200, 20, 18, -PI, 0);//eye
fill(255);


//legs//
noStroke();
fill(0,100,0);
ellipse(160, 240, 28, 22);//back foot
ellipse(200, 240, 28, 22);//second from last foot
ellipse(240, 240, 28, 22);//second foot
ellipse(280, 240, 28, 22);//front foot =)

//tail//
fill(0,100,0);
triangle(105, 223, 123, 208, 123, 230);





