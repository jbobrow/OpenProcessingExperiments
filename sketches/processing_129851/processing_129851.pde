
int h=300;

void setup(){
size(800,800);
line(0,500,800,500);
background(10,50,150,200);
fill(10,250,50,200);
rect(0,400,800,400);
}
void draw(){
rect(250,200,h,h); //House
fill(15,175,200,45);
triangle(410,50,200,200,600,200); //Roof, obviously
fill(0);
triangle(520,350,780,350,650,250); //Garage Roof
fill(25,50,75,100);
rect(300,250,h/4,h/4); //Left Window
fill(100,200,150,250);
rect(430,250,h/4,h/4); //Right Window
fill(255,150,100,75);
rect(370,400,h/4,h/3); //Door
fill(205,132,118,27);
rect(550,350,200,150); //Garage
fill(30,40,50,60);
rect(580,370,140,130); //Garage Door
line(580,390,720,390); //Garage Door Line #1
line(580,410,720,410); //Garage Door Line #2
line(580,430,720,430); //Garage Door Line #3
line(580,450,720,450); //Garage Door Line #4
line(580,470,720,470); //Garage Door Line #5
line(580,490,720,490); //Garage Door Line #6
ellipse(650,480,5,5); //Garage Door Handle
ellipse(420,460,5,5); //Door Knob
}



