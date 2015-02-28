
background(0);
size(600, 800);
smooth();

 
//hai, topr, right, left
noStroke();
fill(56, 0, 0);
arc(180, 180, 180, 150,radians(180), radians(360));
arc(230,360,200,500,radians(220), radians(450));
arc(150, 370, 180, 500, radians(90), radians(270));

//face
fill(255, 212, 143);
ellipse(200, 300, 200, 300);

//mouth
fill(255, 212, 222);
strokeWeight(2);
arc(190, 370, 55, 30, radians(0), radians(180));
 
//eyes, left and right 
fill(0);
ellipse(140, 260, 20, 20); 
ellipse(240, 260, 20, 20);

//eyebrows
stroke(60, 40, 40);
strokeWeight(3);
noFill();
arc(145, 255, 45, 15, radians(180), radians(360));
arc(245, 255, 45, 15, radians(180), radians(360));
 
//nose
fill(0);
arc(190, 320, 25, 8, radians(0), radians(180));

 


 





