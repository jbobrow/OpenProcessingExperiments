
void setup(){
size(800,800);

background(0);

for(int a=0; a<width; a=a+30){
noStroke();
fill(246,255,0,10);
rect(0,0,a+100,a+100);

fill(255,243,0,30);
rect (200,200,a-500,a-500);

fill(255,85,0,30);
rect (200,200,a-200,a-200);



}


}



