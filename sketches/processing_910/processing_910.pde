
// umut göçer 050411022 istanbul altyapı projesi içerisinde
// kullanilan malzeme nekadar kaliteli ve saglam olursa
// alt yapi sorunumuz en kısa zamanda çözülecektir.

int k=1;
int m=40;
void setup(){
size(800,400);
background(0);
frameRate(30);

}

void draw(){
//background(255);
fill(0);
stroke(214,19,19);
ellipse(k,m,50,50);
k=k+3;
//line(k,k,700,200);
if (k>800) {k=0;m=m+50;  }

}

