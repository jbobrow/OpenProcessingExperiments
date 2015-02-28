

int yes = 6;
int no = 10;
int maybe = -4;

void setup(){
size (500,500);
smooth ();
background(255);
strokeWeight(1);
for(no=0; no<=500; no+=50){
for(yes=0; yes<=500; yes+=10){ 
stroke (0,50,255,85);
smooth();
line(no,yes,no++,no-20);

for(yes=0; yes<=500; yes+=50){
for(no=0; no<=500; no+=10){ 
for(maybe=0; maybe<=100; maybe+=100){
stroke (0,50,255,85);
smooth();
line(yes,yes,no*10,yes-500);
line(maybe,maybe,yes,no++);
stroke(255,50,0);
line(no,no,maybe*10,maybe++);
rotate(yes/90);
rotate(no/90);
rotate(maybe/260);

for(maybe=0; maybe<=100; maybe++);
noFill();
ellipse(maybe,44,no,20);
}
}
}
} 
}
}


  
  



    

    





