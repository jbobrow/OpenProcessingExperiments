
//YOU CAN PLAY WITH THIS VALUES
int genheight = 400; //THIS VALUE SHOULD MAKE THE WATTER AND SHOWER GROW
int genwidth = 300; //THIS VALUE SHOULD MAKE THE TUBE GROW
/*-------------------------------------------------------*/


int tubesize = (genwidth * 50)/100; //IT GIVES THE SIZE OF TUBE
size(genwidth,genheight);
background(235,255,205); 

//SHOWER
ellipse(80,90, 80,20);//bottom of the shower
ellipse(80,50,80,50);//head of the shower
strokeWeight(1);
rect(40,50,80,40);//boddy
rect(120,50,tubesize,10);//Tube
rect(tubesize + 120,50,10,genheight - 75);//base
//falling watter
noStroke();
fill(180,255,255);//color
rect(61,100,5,(genheight * 60)/100);//watter 1
rect(70,100,5,(genheight * 73)/100);//watter 2
rect(80,100,5,(genheight * 50)/100);//watter 3
rect(90,100,5,(genheight * 70)/100);//watter 4
rect(100,100,5,(genheight * 40)/100);//watter 5
