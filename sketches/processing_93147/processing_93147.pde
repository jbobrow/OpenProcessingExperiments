
int y=2;
int x=20;
void setup () {
size (200,200);
background (245,73,47);
}
void draw() {
int spacing= 20;
stroke (0);
strokeWeight (5);
x=x+spacing;
point (x-10,x*x/228);
point (x-5,x*x/240);
point (x-0, x*x/250);
line (x-37, x*x/270, x-37, x*x );

}
