
void setup(){
size(400,300);
background(0);
fill(255);
frameRate(1.2);}

//Array

void draw(){
  background(0);
String []verbs = {"Hate","Love","Rate","Date","Find","Take","Hurt","Like",
"Tack","Hide","Ride","Tape","Lick","Turn" };
String []nounpreps = {"it.","me.","us.","to.","off.","you.","out.","on.","in.","up."};

int m = int(random(14));
int n = int(random(10));

textSize(70);

text( verbs[m], 37,160);
text( nounpreps[n], 218,160);}

void keyPressed() {
    if (key== 's') {  
    saveImage();
  }
  }

