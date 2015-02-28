
int a=6;
void setup (){
size(500,500);
background(255);
for(int i=0;i<210;i++){
int b =i*a+5;
strokeWeight(i/1000);
smooth();
stroke(30);
noFill();
stroke(95,95,95);
strokeWeight(i/1000);
curve(0, b*200,10+i, b,b*1, 200*i, b,b);
stroke(255, 102, 0);
curve(500+b*5, b*8, 300+i, b/200+i, 30, b*3, 500,200);

}
}
