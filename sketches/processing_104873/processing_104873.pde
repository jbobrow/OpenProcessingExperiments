
size(600,380);
background(80,53,36);

int r1 = 100; //ball_radius
float x = random(width/2-100,width/2); //X-coordinate
float y = random(height/2-r1/2,height/2+r1/2); //Y-coordinate

//eyeball_left
noStroke();

    //eye_white
fill(255,255,255);
ellipse(width/2-150,height/2,r1*2,r1*2);

    //eye_black
fill(0,0,0);
ellipse(x-100,y,r1,r1);

    //eyebrow
strokeCap(SQUARE);
strokeWeight(50);
stroke(0,0,0);
line(x-200,y-120,x,y-100);

//eyeball_right
noStroke();

     //eye_white
fill(255,255,255);
ellipse(width/2+150,height/2,r1*2,r1*2);

    //eye_black
fill(0,0,0);
ellipse(x+200,y,r1,r1);

    //eyebrow
strokeCap(SQUARE);
strokeWeight(50);
stroke(0,0,0);
line(x+100,y-100,x+300,y-120);

//nose
strokeWeight(10);
fill(45,25,25);
ellipse(width/2-30,height/2+150,r1/3,r1/3);//left

fill(45,25,25);
ellipse(width/2+30,height/2+150,r1/3,r1/3);//right

//cheeks
noStroke();
fill(205,100,100);
ellipse(0+20,height,r1*2.2,r1*2.2);//left

fill(205,100,100);
ellipse(width-20,height,r1*2.2,r1*2.2);//right


