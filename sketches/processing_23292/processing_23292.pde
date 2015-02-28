
smooth();

rect(30,10,40,30);//hat

//BODY&FACE
ellipse(50,50,65,40);//body
ellipse(42,50,15,15);//eye
ellipse(58,50,15,15);//eye
ellipse(42,48,4,4);//eye dot
ellipse(58,48,4,4);//eye dot
line(30,60,70,60);//mouth
triangle(35,60,45,60,40,65);//tooth1
triangle(45,60,55,60,50,65);//tooth2
triangle(55,60,65,60,60,65);//tooth3
curve(45,65,35,40, 50,40,40,65);//eyebrowL
curve(60,65,50,40, 65,40,55,60);//eyebrowR

//LEGS
quad(40,70,40,85,35,85,35,68);
quad(60,70,60,85,65,85,65,68);
ellipse(35,85,15,10);
ellipse(65,85,15,10);

//FLOWER
curve(70,30,70,30, 80,15,100,50);
ellipse(82,11,5,5);
ellipse(86,14,5,5);
ellipse(84,18,5,5);
ellipse(80,18,5,5);
ellipse(78,14,5,5);
ellipse(82,15,5,5);

//ARMS
quad(8,60,17,50,17,53,8,63);
ellipse(8,60,8,8);
quad(83,50,95,40,95,37,83,47);
ellipse(95,40,8,8);

//HAT2
strokeWeight(5);
line(25,32,75,32);


