
//Tracy Carlin
//January 28,2012
//Week 2 - Variables
//size(x,y)

void setup() {
size(800,600);
smooth();
background(240);
}

void draw() {
float heartX=400.0;
float heartY=300.0;

//desired color = red
//fill(255,0,0);

//left wings - original layer
strokeWeight(3);
ellipse(heartX-225,heartY,250,30);
ellipse(heartX-215,heartY-30,250,30);
ellipse(heartX-215,heartY+30,250,30);
ellipse(heartX-205,heartY-60,250,30);

//left wings - new layer
strokeWeight(3);
ellipse(heartX-125,heartY,250,30);
ellipse(heartX-115,heartY-30,250,30);
ellipse(heartX-115,heartY+30,250,30);
ellipse(heartX-105,heartY-60,250,30);

//each "feather" is 30 pix wide, 250 px long, 30 px apart veritcally and offset by about 10 px

strokeWeight(3);
//right wings - original layer
ellipse(heartX+225,heartY,250,30);
ellipse(heartX+215,heartY-30,250,30);
ellipse(heartX+215,heartY+30,250,30);
ellipse(heartX+205,heartY-60,250,30);

//right wings - new layer
ellipse(heartX+125,heartY,250,30);
ellipse(heartX+115,heartY-30,250,30);
ellipse(heartX+115,heartY+30,250,30);
ellipse(heartX+105,heartY-60,250,30);

//neck

strokeWeight(5);
line(heartX,heartY-100,400,100);

//legs
line(heartX-40,heartY-50,360,500);
line(heartX+40,heartY-50,440,500);

//feet - left
strokeWeight(3);
fill(215);
rect(heartX-50,heartY+200,20,50);
rect(heartX-65,heartY+200,15,30);
rect(heartX-30,heartY+200,15,30);

//feet - right
rect(heartX+30,500,20,50);
rect(heartX+15,500,15,30);
rect(heartX+50,500,15,30);

//tail
fill(255);
rect(heartX-195,heartY+55,150,30);
//plume one
rect(heartX-195,heartY+85,30,100);
//plume two
rect(heartX-165,heartY+155,60,30);
//plume 3
rect(heartX-135,heartY+105,30,50);
//final plume
rect(heartX-155,heartY+105,20,30);

//body
//desired color = red
fill(255);
//fill(255,0,0);
strokeWeight(3);
ellipse(heartX,heartY,200,200);

//crest
strokeWeight(3);
fill(215);
rect(heartX-40,heartY-265,50,15);
rect(heartX-60,heartY-275,50,10);

//head (main)
fill(255);
strokeWeight(3);
ellipse(heartX,heartY-200,100,100);

//eyeball
strokeWeight(2);
//fill(0,255,0);
//it's blue because I say so
ellipse(heartX+15,heartY-210,25,25);
//eye - pupil
strokeWeight(1);
fill(0);
ellipse(heartX+15,heartY-210,10,10);

//beak (upper)
strokeWeight(3);
fill(215);
ellipse(heartX+85,heartY-200,70,20);

//beak (lower)
ellipse(heartX+65,heartY-185,30,10);
strokeWeight(3);
}

