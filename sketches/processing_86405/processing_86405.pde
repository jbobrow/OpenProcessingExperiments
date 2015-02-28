
//creating arrays
size(600,600);

int x = int(random(255))+1;
int y= int(random(255))+1;
int z= int(random(255))+1;
background(x,y,z);

int[] w = {50, 250, 450};
//square 1
fill(x);
rect(w[0], 250, 100,100);
//square 2
fill(y);
rect(w[1],250,100,100);
//square 3
fill(z);
rect(w[2],250,100,100);
