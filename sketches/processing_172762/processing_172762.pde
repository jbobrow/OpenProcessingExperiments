
void setup() {
size (400,400); //Make a 400 Pixel Background
background(0,150,0); //Fill it with a green color
}

void draw() {
//Making the creeper face (START)\\
fill(0,0,0); 
rectMode(CENTER);
rect(275,300,50,50);
rect(125,300,50,50);
rect(175,250,50,50);
rect(225,250,50,50);
rect(125,100,50,50);
rect(275,100,50,50);

line(100,135,150,135); 
line(110,145,140,145);
line(120,155,130,155);

line(250,135,300,135); 
line(260,145,290,145);
line(270,155,280,155);
//Making the creeper face (END)\\
}


