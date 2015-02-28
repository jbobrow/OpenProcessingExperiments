
void setup() {
size(200,200);
background(255);
}

void draw() {
stroke(0);
line(30,20,55,45);
line(155,20,135,45);
fill(0,255,0,220);    //stokbolletjes\\
ellipse(30,20,20,20);
ellipse(155,20,20,20);


fill(255,0,0,220);
ellipse(90,94,145,120);  //face\\

fill(0,0,255);
ellipse(30,80,40,40);  //eyes\\
ellipse(155,80,40,40);

stroke(0);
line(40,120,140,120);  //mouth\\

println("i'm an alien");
}
