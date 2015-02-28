
int value = #FFADF7;
void setup (){
  background(98,92,91);
  size(250,250);
  noStroke();
}
void draw(){
  Ditto(100,100);
  fill(value);
  lightpink(0,0);
  pink(0,0);
} 
void Ditto (int x, int y){
  fill(0);
  rect(50,70,10,30);
  rect(60,60,40,10);
  rect(60,100,10,20);
  rect(50,120,10,30);
  rect(60,150,10,10);
  rect(70,160,20,10);
  rect(90,170,40,10);
  rect(130,160,20,10);
  rect(150,170,40,10);
  rect(190,160,10,10);
  rect(200,120,10,40);
  rect(190,90,10,30);
  rect(180,70,10,20);
  rect(170,60,10,10);
  rect(150,50,20,10);
  rect(130,60,20,10);
  rect(120,50,10,10);
  rect(100,40,20,10);
  rect(90,50,10,10);
  rect(80,70,10,10);
  rect(100,70,10,10);
  rect(140,80,10,10);
  rect(90,90,20,10);
  rect(110,100,40,10);
  rect(150,120,10,10);
  rect(160,130,20,10);
}  
  void lightpink(int x, int y){
  rect(60,70,20,10);
  rect(70,110,10,10);
  rect(70,120,30,20);
  rect(90,140,20,20);
  rect(100,50,20,10);
  rect(100,60,10,10);
  rect(150,60,20,10);
  rect(150,70,10,10);
  rect(160,120,10,10);
  }
  void pink( int x, int y){
  rect(110,60,20,40);
  rect(130,70,20,10);
  rect(130,80,10,20);
  rect(140,90,10,10);
  rect(150,80,30,40);
  rect(160,70,20,10);
  rect(180,90,10,30);
  rect(170,120,30,10);
  rect(180,130,20,30);
  rect(180,160,10,10);
  rect(150,140,30,30);
  rect(150,130,10,10);
  rect(110,110,40,50);
  rect(90,160,40,10);
  rect(70,140,20,20);
  rect(60,120,10,30);
  rect(100,120,10,20);
  rect(80,100,30,20);
  rect(70,100,10,10);
  rect(60,80,30,20);
  rect(90,70,10,20);
  rect(100,80,10,10);
}  
void mousePressed (){
  if(value == #FFADF7){
    value = #A0EBFF;
  } else {
    value = #FFADF7;
  }
}

