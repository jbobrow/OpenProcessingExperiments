
size(500,500);
smooth();

//NECK

fill(36,114,180);
noStroke();
rect(230,150,40,30);
fill(191,225,255,10);
rect(265,150,6,30);

//HEAD

fill(191,225,255);
noStroke();
arc(250,155,100,100,PI,TWO_PI);//head
fill(2,94,173);
arc(230,134,20,20,PI,TWO_PI);//left eye
arc(270,134,20,20,PI,TWO_PI);//right eye

//BODY

fill(191,225,255);
ellipse(250,330,10,10);//Small Bottom
fill(36,114,180);
ellipse(250,300,50,50);//Large Bottom
fill(191,225,255);
rect(200,175,100,120); //Main
fill(36,114,180,50);
rect(275,175,20,120);//Stripe Large
fill(237,247,255,60);
rect(275,175,6,120);//Stripe Small






