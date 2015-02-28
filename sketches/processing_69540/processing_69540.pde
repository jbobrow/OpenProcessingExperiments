
//Aidan Fulkerson, Penguin, CP 16-17
//http://aidaniscool.webs.com/

//Initial Setup
size(500,500);
background(255,255,255);
smooth();
strokeWeight(6);

//Grey with black fill
stroke(111,111,111);
fill(0,0,0);

//Ears
triangle(80,50,120,220,380,200);
triangle(420,50,380,220,120,200);

//Head
ellipse(250,250,300,300);

//Nose
triangle(250,290,225,245,275,245);
point(243,270);
point(257,270);

//Mouth
line(250,310,250,340);
line(250,340,225,365);
line(250,340,275,365);

//Eyes (Grey with yellow fill)
fill(256,255,111);
ellipse(190,200,80,50);
ellipse(500-190,200,80,50);

//Pupils 
stroke(0,0,0);
fill(0,0,0);
ellipse(500-190,200,8,20);
ellipse(190,200,8,20);
