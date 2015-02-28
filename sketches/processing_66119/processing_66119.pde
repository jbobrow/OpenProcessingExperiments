
size(400, 400);

background(#FAF5DC);
smooth();

noFill();
stroke(0);

//plot curve
//bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2)
bezier(60, 400, 110, 225, 150, 200, 225, 50); //big black left side
bezier(160, 400, 200, 350, 200, 180, 270, 60); //big black right side

bezier(175, 0, 225, 60, 240, 60, 325, 60); //crescent moon bottom
bezier(225, 0, 250, 20, 250, 25, 325, 60); //crescent moon top

noStroke();
fill(#C91910);
bezier(225, 50, 230, 15, 250, 25, 270, 60); //crescent moon red inner

stroke(0);
noFill();
bezier(75, 0, 40, 40, 68, 70, 100, 60); //top left curve

fill(0);
triangle(100, 60, 120, 40, 120, 80); //upper-left triangle

bezier(120, 40, 130, 50, 130, 70, 120, 80); //triangle-curve

ellipse(15, 70, 25, 25); //upper-left circle
ellipse(15, 130, 25, 25); //second-from-upper-left circle
line(15, 70, 15, 130); //line connecting upper-left circles

line(75, 100, 75, 175); //vertical of left star
line(55, 105, 95, 170); //backslash of left star
line(40, 137, 110, 137); //horizontal of left star
line(40, 172, 100, 117); //forwardslash of left star

ellipse(15, 275, 25, 25); //upper-left circle
noFill();
bezier(0, 300, 15, 275, 25, 275, 30, 225); //line through circle

fill(0);
ellipse(20, 330, 20, 20);//bottom circle
noFill();
bezier(0, 375, 10, 360, 30, 350, 20, 330); //bottom-left vertical curve
bezier(0, 350, 60, 350, 75, 350, 75, 275); //bottom-left horizontal curve

fill(0);
ellipse(325, 0, 15, 15); //top-right half ellipse
line(257, 25, 325, 0); //line to the top-right half ellipse

ellipse(300, 100, 25, 25); //
ellipse(300, 160, 25, 25); //middle hourglass
line(300, 100, 300, 160); //

ellipse(375, 170, 25, 25); //
ellipse(375, 230, 25, 25); //far-right hourglass
line(375, 170, 375, 230); //

line(350, 85, 350, 160); //vertical of left star
line(330, 90, 370, 155); //backslash of left star//actually top-right star
line(315, 122, 385, 122); //horizontal of left star
line(315, 157, 375, 102); //forwardslash of left star

line(325, 200, 325, 275); //vertical of left star
line(305, 205, 345, 270); //backslash of left star//actually middle-right star
line(290, 237, 360, 237); //horizontal of left star
line(290, 272, 350, 217); //forwardslash of left star

line(375, 275, 375, 350); //vertical of left star
line(355, 280, 395, 345); //backslash of left star//actually second-from-middle right star
line(340, 312, 410, 312); //horizontal of left star
line(340, 347, 400, 292); //forwardslash of left star

line(250, 338, 250, 413); //vertical of left star
line(230, 343, 270, 408); //backslash of left star//actually bottom-right star
line(215, 375, 285, 375); //horizontal of left star
line(215, 410, 275, 355); //forwardslash of left star

ellipse(375, 15, 25, 25); //upper-right circle

noFill();
bezier(400, 10, 335, 15, 390, 100, 400, 150);//curve through upper-right circle

fill(0);
triangle(400, 50, 400, 60, 390, 55); //upper-right tiny triangle

line(385, 400, 400, 385); //bottom-right line through corner

