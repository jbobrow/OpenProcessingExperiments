
int k;
void setup(){
size(200, 200);
noStroke();
}
void draw(){
background(102);

fill(255);
k=60;
for(int i=0; i < mouseX/20; i++){
rect(25, k, 155, 5);
k= k + 10;
}

fill(0);
k = 180;
for(int i=0; i < mouseY/15; i++){
rect(105,k,30,5);
k=k-10;
}
}
