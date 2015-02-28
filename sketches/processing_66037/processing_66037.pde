
background(255);
size(450,500);
noStroke();

// red rectangles
fill(211, 2, 2);
rect(0,0,25,100); //top red rectangle
rect(0,263,25,25); // smaller rectangle, middle left
rect(389,223,41,40); // rectangle, far right

//blue rectangles
fill(5,29,175);
rect(147,0,41,40); //top
rect(389,486,width,height); //bottom right

//yellow rectangle
fill(245,189,2);
rect(147,181,41,107);

// black lines
fill(0);

// horz black lines
rect(0,40,430,11); //top horzl black stripe
rect(34,170,396,11); // second horz black stripe
rect(0,288,width,13); // third horz black stripe (under small red square)
rect(300,375,150,11); //fourth horz black stripe (right half only)
rect(138,475,312,11); // bottom horz black stripe

// vert black lines
rect(25,0,9,288); //first vert black stripe
rect(138,0,9,height); // second vert black stripe (full height)
rect(188,0,9,288); // third vert black stripe (stops halfway down)
rect(299,0,10,height); //fourth vert black stripe
rect(316,0,9,height); // fifth vert black stripe
rect(340,0,10,475); //sixth vert black strike (stops not quite at bottom)
rect(378,0,11,height); //seventh (second-to-last) vert black stripe
rect(430,0,9,288); // eighth (final) vert black stripe



