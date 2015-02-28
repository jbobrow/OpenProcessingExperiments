
int x;
int speed;  // botstbal
int teller;
boolean test;

void setup() {
size(400,250);
x= 100;
speed =10;
teller =0;
test =true;
}

void draw() {
 background(255);
  
stroke(0);
line(30+x,20,55+x,45);
line(155+x,20,135+x,45);
fill(0,255,0,220);    //stokbolletjes\\
ellipse(30+x,20,20,20);
ellipse(155+x,20,20,20);

  if (test == true){fill(0,255,0);
}
else if (test == false){fill(255,0,0);
}
ellipse(90+x,94,145,120);  //face\\

fill(0,0,255);
ellipse(30+x,80,40,40);  //eyes\\
ellipse(155+x,80,40,40);

stroke(0);
line(40+x,120,140+x,120);  //mouth\\

 x = x + speed;

  if (x >width || x < 0) {
    speed = -speed;
    teller = teller +1;
}
if (teller == 10){
teller = 0;
test = !test;

  }

println(teller);
}
