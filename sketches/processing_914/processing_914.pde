
//Belgü UÇAR,060411029,GRAPHIC DESIGN,belguucar@windowslive.com

//Nebile SEÇKİN,050411032,GRAPHIC DESIGN,nebileseckin@hotmail.com

//Belde UÇAR,060411014,GRAPHIC DESIGN,beldeucar@hotmail.com
 




void setup(){
smooth();
size (800,400);
frameRate(3);
}


//We have picked blackcolor for background and the small squares in our range ,
//we have calculated them in exactly range of that area. And the rgb colours we have picked ,
//we tried to determine the colour s we are going to use for it. With certain speed
//we have managed to change the colours
void draw(){
background (0);


fill(random(255),random(233),31);
noStroke();
rect (650,300,40,40);
fill(random(153),random(31),random(255));
rect(650,260,40,40);
fill(random(153),random(31),random(355));
rect(610,300,40,40);
fill(random(250),random(8),random(72));
rect(570,300,40,40);
fill(random(146),random(8),72);




fill(99,156,245,80);
ellipse(660,120,80,80);
ellipse(400,230,230,250);


rect(610,260,40,40);
rect(650,220,40,40);
fill(random(236),random(146),250);
rect(610,220,40,40);
fill(random(60),random(185),222);
rect(570,260,40,40);
fill(random(149),random(211),6);
rect(570,220,40,40);
fill(random(211),random(6),random(188));
rect(570,180,40,40);
fill(random(211),random(130),random(6));
rect(610,180,40,40);
fill(random(45),random(56),100);
rect(650,180,40,40);
fill(random(45),random(56),100);
rect(530,300,40,40);
fill(random(211),random(6),random(188));
rect(530,220,40,40);
fill(random(255),random(233),31);
rect(530,260,40,40);
fill(random(250),random(8),random(72));
rect(530,180,40,40);
fill(255,233,31);
fill(random(153),random(31),random(255));


rect(490,300,40,40);
rect(470,300,40,40);
fill(153,31,355,50);
rect(510,220,20,40);
fill(240,178,7,40);
rect(510,180,20,40);
fill(240,7,23,40);
rect(490,220,20,40);
fill(7,240,207,40);
rect(490,180,20,40);
fill(200,7,240,40);
rect(470,220,20,40);
fill(240,7,27,40);
rect(460,180,30,40);
fill(14,5,103,80);
rect(650,80,40,100);



triangle(650,25,650,80,690,80);
fill(random(4),random(36),random(85),500);
ellipse(400,230,100,100);



//Therefore: we have calculated the centre. The opposite way we have
//equalled xi to horizontal moves. and again we have equalled inverse
//Y to top of- mouse y’ moves. When we used  x for mouse x and y for 
//inverse y and then we have found the ellipse’ value. Therefore the 
//time when the mouse scrolls down to horizontal way, it has managed 
//to move the mouse right opposite way of ellipses’ moves.

fill(245,30,44);
int inverseX = width-mouseX;
int inverseY = height-mouseY;
ellipse(mouseX, inverseY, 100,100);
fill(176,49,232);
ellipse(mouseX, mouseY, 100, 100);


//In the explanation we equalized the color X at the horizontal,
//to the reverse of mouse's movement on X plane. And we equalized 
//color Y at vertical, to the reverse of mouse Y's movement.
//And we determined the color assets as R is color X, G is
//random 40 and Bis color Y. In this ellipse we can see the 
//color transitions and lightness, darkness assets according
//to movement of mouse at horizantal and vertical.
int renkX = width-mouseX;
int renkY = height-mouseY;
fill(renkX,random(40),renkY,500);
ellipse(400,230,100,100);
 






fill(252,172,16,90);
rect(490,140,20,40);

ellipse(555,80,50,50);
color inside = color(0);
fill(inside);


ellipse(560,90,60,60);

strokeWeight(8);
stroke(7,5,175);
line(0,200,800,200);
line(410,50,410,380);

strokeWeight(3);
stroke(255);
line(530,180,530,380);
strokeWeight(3);
}







