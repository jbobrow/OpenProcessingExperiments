
size(500,500);
rectMode(CENTER);
void retdraw(x, y,l){
rect(x,y,l,l);
ellipse(x,y,l,l);
}

for(int i=0; i < 10; i++){

int a = random(1,500);
int b = random(1,500);
int c = random(1,100);

retdraw(a,b,c);

}
