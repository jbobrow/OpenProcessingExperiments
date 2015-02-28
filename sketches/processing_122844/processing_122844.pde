
int x = 100;
int y = 1;
int speed = 1;  // botstbal

void setup() {
size(400,250);
}

void draw() {
 background(255);
 
 x = x + speed;

  if ((x>width) || (x<0)) {
    speed = speed*-1;
  }
  
stroke(0);
line(30+x,20,55+x,45);
line(155+x,20,135+x,45);
fill(0,255,0,220);    //stokbolletjes\\
ellipse(30+x,20,20,20);
ellipse(155+x,20,20,20);


fill(255,0,0,220);
ellipse(90+x,94,145,120);  //face\\

fill(0,0,255);
ellipse(30+x,80,40,40);  //eyes\\
ellipse(155+x,80,40,40);

stroke(0);
line(40+x,120,140+x,120);  //mouth\\

println("i'm an alien");
}
