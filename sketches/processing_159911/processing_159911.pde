



//solving for slope
//1 = one pixel





color [] palette = {#5C0185, #E670E8, #FF047C, #FF2E00};
int r = 0; // 
// 'm' is the slope of the line and 'b' is the 'y' intercept of 'x' + 'b' | there is no 'x' or 'y' intercept in this instance because 'b' is always equal to 0

//random
float m;
float y;
float x;
float b;
float s;
float t;


float p;
float o;
float i;

float j;
float k;




//setup
void setup() {
size(600,600);
background(palette[(r)]);
}



 void draw() {
noLoop();
   // m = 'x2' - 'x1' / 'y2' - 'y1' | 's' and 't' will replace 'x2' and 'y2'
x = random(1, 299);
y = random(1, 299);
s = random(201, 600);
t = random(201 , 600);


//distance formula
j = s - x;
k = t - y; 
i = (sq(j));
o = (sq(k));
p = i + o;

//slope
float y = m * x + b;
float m = ((t - y) / (s - x));
// distance (length)
float l = sqrt(p);


line(x, y, s, t);



//answer  
fill(#0f0f0f);
textSize(30);
text(m*-1, 350, 80);
text("m", 325, 80);
//x
text(x, 350, 110);
text("x", 330, 110);
//y
text(y, 350, 140);
text("y", 330, 140);
//x2
text(s, 350, 200);
text("x2", 310, 200);
//y2
text(t, 350, 230);
text("y2", 310, 230);
//length
text(l, 350, 170);
text("length", 260, 170);

//console
print(m, x, y, s, t, s, t, i, o, p, j, k, l);




}


