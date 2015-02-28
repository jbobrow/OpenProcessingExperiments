
int hello = 0;
int goodbye = 10;

int y = 0;


void setup (){
  size(500,500);
    
    background(255);
    noStroke();
    fill(0,30);
}

void draw(){
 
  while(goodbye < 250) {
  rect(hello,y,goodbye,goodbye);
    goodbye = goodbye + 35;
 
}
hello = hello + 100;
goodbye = 0;

if (hello > 500) {
  y = y + 90;
  hello = 0;
}

} 

