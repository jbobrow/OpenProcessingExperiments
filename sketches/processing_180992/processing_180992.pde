
int pos_x = 75;
int pos_y = 150;

size(400,600);
background(255);

fill(14,70,180);
rect(pos_x-40,pos_y + 250,100,150); // leg left
rect(pos_x + 80, pos_y + 250,100,150); // leg right
fill(0,0,255,200);
rect(pos_x,pos_y,200,300); // body
fill(0,0,255,240);
rect(pos_x + 100, pos_y - 100,200,200); // head
fill(0,0,100,200);
rect(pos_x + 120, pos_y - 80,20,20);
rect(pos_x + 260, pos_y - 80,20,20);
