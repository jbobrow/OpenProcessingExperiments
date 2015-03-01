
size (100,100);

background (204, 252, 255 ,  125); // change background color // last number is opacity
noStroke();

// hair
fill(255, 204, 0);
ellipse (50,50,60,80); //elipse orgin is at center

// shirt
fill(255, 0, 0);
ellipse (50,100,70,60); //elipse orgin is at center

//face
fill(253,228,200);
ellipse (50,50,40,60); //elipse orgin is at center

//glasses rim

fill(255,255,255); //square fill in rgb // last number is opacity
stroke (0,25,74);  //square stroke in rgb
strokeWeight(.5);
rect (40,40,9,8); // draw a rectangle x,y,width,height

rect (55,40,9,8); // draw a rectangle x,y,width,height

//glasses connecting bar

fill(0,25,74); //square fill in rgb // last number is opacity
stroke (0,25,74);  //square stroke in rgb
noStroke();
rect (50,45,5,1); // draw a rectangle x,y,width,height


// eye dots

fill(0,25,74); //square fill in rgb // last number is opacity
noStroke();
rect (43,43,3,3); // draw a rectangle x,y,width,height

rect (58,43,3,3); // draw a rectangle x,y,width,height

//mouth

fill(255,0,0); //square fill in rgb // last number is opacity
noStroke();
rect (45,69,10,4); // draw a rectangle x,y,width,height

ellipse(47,70,5,4); // draw a rectangle x,y,width,height
ellipse(53,70,5,4); // draw a rectangle x,y,width,height

//nose

fill(0,25,74); //square fill in rgb // last number is opacity
triangle(49, 55, 50, 57, 51, 55);


