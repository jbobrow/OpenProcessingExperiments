
size(500,500);
smooth();

//x,y =center 
float x;
float y;

x = width/2;
y = height/2;

float d = width*0.2;

strokeWeight(d*0.2);
ellipse(x*0.7,y*0.6,d,d);
fill(0);
ellipse(x*0.7,y*0.6,d*0.2,d*0.2);

strokeWeight(d*0.1);
fill(255);
ellipse(x*1.4,y*0.7,d,d);
fill(0);
ellipse(x*1.4,y*0.7,d*0.5,d*0.5);

//hair

strokeWeight(d*0.01);

float e = d*0.1;
for(int j=0 ; j<width/2 ; j+=e){
  line(j,0,0,height);
}

/*
line(250,0,70,500);
line(70,500,130,0);
line(135,0,70,500);
line(140,0,70,500);
line(144,0,70,500);
line(149,0,70,500);
line(156,0,70,500);
line(160,0,70,500);
line(170,0,70,500);
line(200,0,70,500);
line(210,0,70,500);
line(220,0,70,500);
line(240,0,70,500);
*/


float c = d*0.2;
for(int i=250 ; i<width ; i+=c){
  line(i,0,width,height);
}



/*
line(250,0,width,height);
line(255,0,width,height);
line(260,0,width,height);
line(290,0,width,height);
line(360,0,width,height);
line(400,0,width,height);
line(280,0,width,height);
line(330,0,width,height);
line(390,0,width,height);
line(410,0,width,height);
line(430,0,width,height);
line(420,0,width,height);
line(455,0,width,height);
line(310,0,width,height);
line(320,0,width,height);
line(370,0,width,height);
line(335,0,width,height);
line(450,0,width,height);
*/

//mouth

fill(0);
strokeWeight(d*0.05);
quad(x*0.8,y*0.9,x*0.7,y*1.9,x*1.6,y*1.8,x*1.16,y*0.96);

strokeWeight(d*0.03);
fill(240);
quad(x*0.74,y*1.76,x*0.72,y*1.92,x*1.6,y*1.88,x*1.5,y*1.75);
x = x*0.8;
y = y*1.76;
line(x,y,x,y*1.085);
line(x*1.2,y,x*1.2,y*1.085);
line(x*1.3,y,x*1.3,y*1.08);
line(x*1.5,y,x*1.5,y*1.08);
line(x*1.6,y,x*1.6,y*1.075);
line(x*1.75,y,x*1.75,y*1.07);

x=width/2;
y=width/2;
quad(x*0.8,y*0.96,x*0.84,y*1.54,x,y*1.53,x,y*0.96);
quad(x,y*0.96,x*1.02,y*1.64,x*1.2,y*1.64,x*1.16,y*0.96);


