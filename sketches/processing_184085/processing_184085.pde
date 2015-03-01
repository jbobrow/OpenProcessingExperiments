
//canvas size
size(350,500);
background(1);

//inside color green
fill(0,255,0);
//outside case 
stroke(255);
//line(left wall)
line(150,100,150,400);
//line(Right wall)
line(250,100,250,400);

//arc(x,y,width,height,radians(start of curve),radians(end of curve));
arc(200,100,100,10,radians(-180),radians(0));
//arc
arc(200,400,100,10,radians(0),radians(180));

//rectangle(usb port)
rect(170,370,60,20);
//arc
arc(180,360,5,5,radians(0),radians(360));
//arc
arc(220,360,5,5,radians(0),radians(360));

//Power Button
//arc
arc(200,320,50,50,radians(0),radians(360));
//arc
arc(200,320,30,30,radians(0),radians(360));
//arc
arc(200,320,10,10,radians(-60),radians(250));
//line
line(200,320,200,312);

//controller ports
//rectangle(controller port 2)
rect(170,150,10,40);
//rectangle(controller port 1)
rect(170,210,10,40);
//controller sync button
//arc
arc(175,265,10,10,radians(0),radians(360));

//Disc Drive
//rectangle
rect(210,120,20,130,50);

