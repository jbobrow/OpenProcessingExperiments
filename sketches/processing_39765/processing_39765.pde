
int num = 100; //set 100 variables
float[] x = new float[num];
float[] y = new float[num]; 
float[] speed = new float[num];
color[] c = new color[num]; 

void setup() {
size(300, 300);
colorMode(RGB);
smooth();
for (int i=0; i < num;i++) {//set where it starts and the color
x[i] = random(50,250);
y[i] = i * (height/num);
speed[i] = random(0.5, 2);
c[i] = color(random(255), random(255), random(255),150); 
}
}

void draw() {
background(0);
for (int i=0; i < num; i++) {
noStroke();
fill(c[i]);
rotate(2);
ellipse(x[i], y[i]+20, 5, y[i]); //set the stars and elongate them
y[i] = y[i] + speed[i];
if (y[i] > height + 10) {
y[i] = -10;
}
}
}







